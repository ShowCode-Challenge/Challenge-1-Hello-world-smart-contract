#!/bin/bash
export MAIN_ACCOUNT=duonghb3.testnet
export NEAR_ENV=testnet
export CONTRACT_ID=hello.$MAIN_ACCOUNT
export ACCOUNT_ID=$MAIN_ACCOUNT
export ONE_YOCTO=0.000000000000000000000001
export GAS=200000000000000
export DECIMAL_18=000000000000000000
export DECIMAL_24=000000000000000000000000

./build.sh

echo "################### DELETE ACCOUNT ###################"
near delete $CONTRACT_ID $ACCOUNT_ID

echo "################### CREATE ACCOUNT ###################"

near create-account $CONTRACT_ID --masterAccount $ACCOUNT_ID --initialBalance 10
# near create-account $CONTRACT_ID --masterAccount $ACCOUNT_ID --initialBalance 10

echo "################### CREATE CONTRACT ###################"
near deploy $CONTRACT_ID --accountId $ACCOUNT_ID --wasmFile ./res/hello.wasm 


echo "################### INIT CONTRACT ###################"
near call $CONTRACT_ID new --accountId $ACCOUNT_ID

