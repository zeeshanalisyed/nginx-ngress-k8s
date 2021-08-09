mode=$1  
if [[ $mode == "local:d" ]]; then
  cls && echo "Running Mode: $mode" && helm install zlog360-ingress ./ --skip-crds --dry-run --debug | cat > dry-run.yaml
elif [[ $mode == "debug" ]]; then
  cls && echo "Running Mode: $mode" && helm template --name-template=zlog360-ingress ./ | cat > dry-run.yaml    
else 
  cls && echo "Running Mode: $mode" && helm install zlog360-ingress ./  --debug | cat > dry-run.yaml
fi