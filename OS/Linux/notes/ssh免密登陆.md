ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa(主节点)
ssh-copy-id node30 (发送私钥到各个节点包括主节点)