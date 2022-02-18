# ansible-hetzner-jupyter

Automatic provisioning and setup for [Hetzner](https://hetzner.cloud/?ref=FkpdQcqbGXhP) cloud instances with Ansible. The setup includes installation of the following packages and libraries:

- [Python 3.9](https://www.python.org/)
- [PyTorch 1.10.1](https://pytorch.org/)
- [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/) including installation as a systemd service


# Installation

This project uses the [hetzner.hcloud.hcloud](https://docs.ansible.com/ansible/latest/collections/hetzner/hcloud/hcloud_inventory.html) dynamic inventory plugin and the [hetzner.hcloud.hcloud_server](https://docs.ansible.com/ansible/latest/collections/hetzner/hcloud/hcloud_server_module.html) collection. The playbooks were tested using Ansible `2.11.7` and Python `3.7.11`.

# Usage

First, make sure to export your `HCLOUD_TOKEN` and desired server credentials with:

```bash
export HCLOUD_TOKEN=XXXXXXX
export SERVER_USERNAME=user
export SERVER_PASSWORD=XXXXXXX
```

The configuration for the server can be found in [config.yml](config.yml). The ssh key loaded to the server is `~/.ssh/hetzner.pub`. Change the `ssh_keys` variable in the configuration if yours is in a different location. The server configuration is:

```yml
server_name: jupyterserver
server_type: cx11
server_image: ubuntu-20.04
server_location: nbg1
ssh_keys: ~/.ssh/hetzner.pub
hcloud_ssh_key_name: ansible-ssh-key
```

Note, that currently only `ubuntu-20.04` is supported for this script. All the available server types can be found by looking at the [Hetzner Cloud](https://www.hetzner.com/cloud/). Other available regions as of this writting are:

- `nbg1`: Nuremberg (DE)
- `fsn1`: Falkenstein (DE)
- `hel1`: Helsinki (FI)
- `ash`: Ashburn, VA (US)

Create and setup a Hetzner server with:

```bash
ansible-playbook -v hcloud-create-server.yml
```

List information about the server with:

```bash
ansible-inventory --list
```

Destroy the running Hetzner server with:

```bash
ansible-playbook -v hcloud-destroy-server.yml
```


# License 
This project is licensed under the MIT license. See the [LICENSE](LICENSE) for details.
