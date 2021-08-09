# author: zeeshan
# old script
# mode=$1  
# if [[ $mode == "local:d" ]]; then
#   cls && echo "Running Mode: $mode" && helm install zlog360-ingress ./ --skip-crds --dry-run --debug | cat > dry-run.yaml
# elif [[ $mode == "debug" ]]; then
#   cls && echo "Running Mode: $mode" && helm template --name-template=zlog360-ingress ./ | cat > dry-run.yaml    
# else 
#   cls && echo "Running Mode: $mode" && helm install zlog360-ingress ./  --debug | cat > dry-run.yaml
# fi
help:
	printf "Command:\n\
	make local --> check without installation \n\
	make debug --> generates the template only in dry-run file\n\
	make install --> installs via helm on the connected k8s cluster flags n=namespace\n\
	make uninstall --> uninstalls the installed resources from k8s cluster\n"
local:
	helm install zlog360-ingress --namespace=$(ns) ./ --skip-crds --dry-run --debug | cat > dry-run.yaml
template:
	helm template --namespace=$(ns) --name-template=zlog360-ingress ./ | cat > dry-run.yaml
clean:
	make uninstall && rm -r dry-run.yaml
install:
	helm install zlog360-ingress --namespace=$(ns) ./  --debug | cat > dry-run.yaml
uninstall:
	helm uninstall zlog360-ingress --namespace=$(ns)  --debug | cat > dry-run.yaml
