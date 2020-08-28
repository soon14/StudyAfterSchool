在执行一个 playbook 之前,想看看这个 playbook 的执行会影响到哪些 hosts
> ansible-playbook playbook.yml -i host.yml --list-hosts



python -m pip install ansible