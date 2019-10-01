#!/bin/bash

# dump-project.sh PROJECT_NAME

# If you prefer multiple files, you can split it:
#   zcat *.txt.gz | awk 'BEGIN{f=""}  match($0, /^+ ((oc|date).*)$/, a){f=a[1] ".txt"; gsub(/[ \/=]/,"_",f);} {print $0 >> f}'

PROJECT=$1

if [ -z $PROJECT ]; then
  echo "Usage: $0 PROJECT_NAME"
  exit 1
fi

echo "Generating OpenShift project dump, it takes about 20 sec - 2 min"

DEST=$PROJECT-$(date +%Y%m%d%H%M%S).txt.gz
(
  set -x
  date
  oc whoami
  oc project $PROJECT
  oc version
  oc status -v
  oc get project $PROJECT -o yaml
  oc get all,ds,pvc,hpa,quota,limits,sa,rolebinding,secret,cm -o wide
  oc get all,ds,pvc,hpa,quota,limits,sa,rolebinding,secret,cm -o yaml
  timeout 15 oc get event -w
  PODS=$(oc get pod -o name)
  for pod in $PODS; do
    CONTAINERS=$(oc get $pod --template='{{range .spec.containers}}{{.name}}
{{end}}')
    for c in $CONTAINERS; do
      oc logs $pod --container=$c --timestamps
      oc logs -p $pod --container=$c --timestamps
    done
  done
  # if admin get additional info
  if [ "$(oc policy can-i get nodes)" == "yes" ]; then
    oc get node -o wide
    oc get node -o yaml
    oc describe node
    oc get hostsubnet
    oc get scc -o yaml
    oc get clusterrolebinding -o yaml
    oc get storageclass -o wide
    oc get storageclass -o yaml
    oc get pv -o wide
    oc get pv -o yaml
    oc get pods -o wide --all-namespaces
  fi
  date
) 2>&1 | gzip > $DEST
echo "Generated $DEST"
# end
