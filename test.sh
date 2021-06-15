#!/bin/bash

case ${chainNetwork} in
  'ETH-Mainnet')
    echo 'chain=1' >> /etc/environment
    echo 'contractAddress=0x514910771af9ca656af840dff83e8264ecf986ca'  >> /etc/environment
    ;;
  'Kovan-ETH-Testnet')
    echo 'chain=42'  >> /etc/environment
    echo 'contractAddress=0xa36085F69e2889c224210F603D836748e7dC0088'  >> /etc/environment
    ;;
  'Rinkeby-ETH-Testnet')
    echo 'chain=4'  >> /etc/environment
    echo 'contractAddress=0x01BE23585060835E02B77ef475b0Cc51aA1e0709'  >> /etc/environment
    ;;
  'xDai-Mainnet')
    echo 'chain=100'  >> /etc/environment
    echo 'contractAddress=0xE2e73A1c69ecF83F464EFCE6A5be353a37cA09b2' >> /etc/environment
    ;;
  'Heco-Mainnet')
    echo 'chain=128'  >> /etc/environment
    echo 'contractAddress=0x9e004545c59D359F6B7BFB06a26390b087717b42'  >> /etc/environment
    ;;
  'BSC-Mainnet')
    echo 'chain=56'  >> /etc/environment
    echo 'contractAddress=0x404460c6a5ede2d891e8297795264fde62adbb75' >> /etc/environment
    ;;
  'Matic-Mainnet')
    echo 'chain=137' >> /etc/environment
    echo 'contractAddress=0xb0897686c545045afc77cf20ec7a532e3120e0f1' >> /etc/environment
    ;;
esac

echo "# Chainlink Environment file
ROOT=/chainlink
LOG_LEVEL=debug
ETH_CHAIN_ID=${chain}
LINK_CONTRACT_ADDRESS=${contractAddress}
ALLOW_ORIGINS=*
MINIMUM_CONTRACT_PAYMENT=1000000000000
DEFAULT_HTTP_ALLOW_UNRESTRICTED_NETWORK_ACCESS=true
JSON_CONSOLE=true

# Ethereum Mainnet Variables
MIN_OUTGOING_CONFIRMATIONS=2
MIN_INCOMING_CONFIRMATIONS=2
ETH_URL=${ethUrl}

# Settings for HTTPS (enable these or the ones below for http)
#CHAINLINK_TLS_PORT=6689
#SECURE_COOKIES=true
#TLS_CERT_PATH=/chainlink/tls/server.crt
#TLS_KEY_PATH=/chainlink/tls/server.key

# Setting for HTTP
CHAINLINK_TLS_PORT=0
SECURE_COOKIES=false

# Transaction Improvements
GAS_UPDATER_ENABLED=true
GAS_UPDATER_TRANSACTION_PERCENTILE=60
ETH_GAS_BUMP_THRESHOLD=9
ETH_GAS_BUMP_WEI=7000000000
ETH_BALANCE_MONITOR_BLOCK_DELAY=3
ENABLE_BULLETPROOF_TX_MANAGER=true" > /home/ec2-user/.chainlink/.env

echo "${apiUser}
${apiPwd}" > /home/ec2-user/.chainlink/.api

echo -e "${RED}Created OCR environment variables succesfully${NC}"
echo
