
kubectl exec -n guandu -it deployment/caocao-codex -- bash
codex login --device-auth
kubectl rollout -n guandu restart deployment/caocao-codex
kubectl -n guandu logs deployment/caocao-codex

kubectl -n guandu logs deployment/caocao-codex
kubectl -n guandu describe deployment/caocao-codex

kubectl exec -n guandu -it deployment/zhangliao-opencode -- bash
opencode auth login
kubectl rollout -n guandu restart deployment/zhangliao-opencode
kubectl -n guandu logs deployment/zhangliao-opencode



kubectl -n guandu apply -f k8s
codex mcp add --url http://octobroker.guandu.svc.cluster.local:8080/mcp


docker login --username xfalcons ghcr.io

kubectl run --image ghcr.io/xfalcons/openab-codex:0.159.0 openab-xxx
docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/xfalcons/openab-codex:0.159.0 -f Dockerfile.codex .


