#!/bin/bash

export RUST_LOG=info,nockchain=info,nockchain_libp2p_io=info,libp2p=info,libp2p_quic=info
export MINIMAL_LOG_FORMAT=true

read -p "请输入要创建的进程数量: " n

# 循环创建文件夹
for ((i=1; i<=n; i++))
do
  folder_name="nock_$i"
  mkdir -p "$folder_name"
  echo "已创建进程 $folder_name"

  # 进入文件夹并执行命令
  (
    cd "$folder_name"
    # 在这里替换你想要执行的命令
    # 示例：touch file_in_$folder_name.txt
    nohup ../../nockchain --mining-pubkey 3qmBATj7wbbQkwoBQwzkWtuhWDGzgLJfpr4z6J7U2DfWPv2fq1LsEGpzr3RHmc4RZb1aKrKLuAwczv5am7E42fc7TWMMrVf7ECDVZpAa8PH61wAdioUXbkBMvytDTpZbHixi --mine > 1.log 2>&1&
  )
done

echo "所有进程创建及命令执行完毕。"
