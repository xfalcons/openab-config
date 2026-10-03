# Zeabur for OpenAB

## Prerequisite

SSH authorization key
copy your id_rsa.pub content to .ssh/authorized_keys

## K3s, Kubectl
The default cluster config of k3s is in `/etc/rancher/k3s/k3s.yaml`, however it's permission is `root`. We need to copy it to kubectl default config location.
The `kubectl` in zeabur OS default config is `/etc/rancher/k3s/k3s.yaml`, we need to change it too.

Update `.bashrc`

```bash
export KUBECONFIG=/home/ubuntu/.kube/config
```

Copy `k3s.yaml`

```bash
mkdir .kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown ubuntu:ubuntu ~/.kube/config
```


## Prepare Helm Chart

Install `helm` command.

From Apt (Debian/Ubuntu)
Members of the Helm community have contributed an Apt package for Debian/Ubuntu. This package is generally up to date. Thanks to Buildkite for hosting the repo.

```bash
HELM_BUILDKITE_APT_KEY_ID="DDF78C3E6EBB2D2CC223C95C62BA89D07698DBC6"

sudo apt-get install curl gpg apt-transport-https --yes

curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey > "${TMPDIR:-/tmp}/helm.gpg"

# Ensure that the key ID matches to prevent a repository compromise from establishing an attacker controlled key
if [ "$(gpg --show-keys --with-colons "${TMPDIR:-/tmp}/helm.gpg" | awk -F: '$1 == "fpr" {print $10}' | head -n 1)" != "${HELM_BUILDKITE_APT_KEY_ID}" ]; then echo "ERROR: Unexpected Helm APT key ID: potential key compromise"; exit 1; fi

cat "${TMPDIR:-/tmp}/helm.gpg" | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

sudo apt-get update
sudo apt-get install helm
```

在 Helm 中，正確的指令是 helm repo add（而不是單獨的 helm add），用於新增一個 Chart 軟體倉庫。

基本語法

```bash
helm repo add [NAME] [URL] [flags]
```

Add helm repo naming `openab` 

```bash
helm repo add openab https://openabdev.github.io/openab
helm repo update
```