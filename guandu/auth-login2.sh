
kubectl exec -n guandu -it deployment/caocao-codex -- bash
codex login --device-auth
kubectl rollout -n guandu restart deployment/caocao-codex
kubectl -n guandu logs deployment/caocao-codex

kubectl -n guandu logs deployment/caocao-codex
kubectl -n guandu describe deployment/caocao-codex

kubectl exec -n guandu -it deployment/zhangliao-opencode -- bash
opencode auth login
kubectl rollout -n guandu restart deployment/zhangliao-opencode
