/bin/bash -c if [[ ! (-f /var/lib/apt/periodic/update-success-stamp && $(stat -c %Y /var/lib/apt/periodic/update-success-stamp) -gt $(date -d '-20 hours' +%s)) ]] ; then echo "true"; fi
