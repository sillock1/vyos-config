# Apply environment to container (configuration) files
restart_containers=""
while IFS= read -r -d '' file
do
  cfgfile="${file%.tmpl}"

  shafile=$file.sha256
  if ! test -e "$shafile"; then
    echo "rebuild" >"$shafile"
  fi

  newsha=$(envsubst <"$file" | shasum -a 256 | awk '{print $1}')
  oldsha=$(cat "$shafile")

  if ! test "$newsha" == "$oldsha"; then
    echo "Configuration changed for $file"
    if ! "$dry_run"; then
      envsubst <"$file" >"$cfgfile"
      echo "$newsha" >"$shafile"
      restart_containers="$restart_containers $(echo "$file" | awk -F / '{print $2}')"
    fi
  fi
done < <(find containers -type f -name "*.tmpl" ! -name "*.bootstrap.tmpl" -print0)

# Include VyOS specific functions and aliases
# shellcheck source=/dev/null
source /opt/vyatta/etc/functions/script-template

# Reset the configuration
load /opt/vyatta/etc/config.boot.default

# Load all config files
for f in /config/config-parts/*.sh; do
  if [ -f "${f}" ]; then
    echo "Processing ${f}"
    # shellcheck source=/dev/null
    source "${f}"
  fi
done

if "$dry_run"; then
  # Show what's different from the running config
  compare
else
  # Pull new container images
  mapfile -t AVAILABLE_IMAGES < <(run show container image | awk '{ if ( NR > 1  ) { print $1 ":" $2} }')
  mapfile -t CONFIG_IMAGES < <(sed -nr "s/set container name .* image '(.*)'/\1/p" /config/config-parts/* | uniq)

  for image in "${CONFIG_IMAGES[@]}"; do
    if [[ ! " ${AVAILABLE_IMAGES[*]} " =~ \ ${image}\  ]]; then
      echo "Pulling image ${image}"
      run add container image "${image}"
    fi
  done

  # Commit and save
  echo "Committing and saving config"
  commit
  save

  # Clean obsolete container images
  IFS=$'\n' read -rd '' -a AVAILABLE_IMAGES <<<"$(run show container image | tail -n +2)"
  for image in "${AVAILABLE_IMAGES[@]}"; do
    image_name=$(echo "${image}" | awk '{ print $1 }')
    image_tag=$(echo "${image}" | awk '{ print $2 }')
    image_id=$(echo "${image}" | awk '{ print $3 }')
    image_name_tag="${image_name}:${image_tag}"

    if [[ ! " ${CONFIG_IMAGES[*]} " =~ \ ${image_name_tag}\  ]]; then
      echo "Removing container ${image_name_tag}"
      run delete container image "${image_id}"
    fi
  done

  # Restart containers
  for container in $restart_containers; do
    run restart container "$container"
  done
fi

# Clean annoying overlay* folders
sudo find "/config" -name "overlay*" -type d -prune -exec rm -rf "{}" \;

exit