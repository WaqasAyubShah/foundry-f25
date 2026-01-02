## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

GitHub

```
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/WaqasAyubShah/foundry-f25.git
git push -u origin main
```

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

$ forge --help
$ anvil --help
$ cast --help

Send Transaction to ganache:

forge create Storage --rpc-url http://127.0.0.1:7545 --interactive


Send Transaction to anvil:

forge create Storage --rpc-url http://127.0.0.1:8545 --interactive

This will work as well: 

forge create Storage --interactive

Deploy it to Anvil:

forge script script/DeploySmartContract.s.sol --rpc-url http://127.0.0.1:8545

forge script script/DeploySmartContract.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --priva
te-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

Available Accounts
==================

(0) 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 (10000.000000000000000000 ETH)
(1) 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 (10000.000000000000000000 ETH)
(2) 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC (10000.000000000000000000 ETH)
(3) 0x90F79bf6EB2c4f870365E785982E1f101E93b906 (10000.000000000000000000 ETH)
(4) 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65 (10000.000000000000000000 ETH)
(5) 0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc (10000.000000000000000000 ETH)
(6) 0x976EA74026E726554dB657fA54763abd0C3a0aa9 (10000.000000000000000000 ETH)
(7) 0x14dC79964da2C08b23698B3D3cc7Ca32193d9955 (10000.000000000000000000 ETH)
(8) 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f (10000.000000000000000000 ETH)
(9) 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720 (10000.000000000000000000 ETH)


Private Keys
============

(0) 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
(1) 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
(2) 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a
(3) 0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6
(4) 0x47e179ec197488593b187f80a00eb0da91f1b9d0b13f8733639f19c30a34926a
(5) 0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba
(6) 0x92db14e403b83dfe3df233f83dfa3a0d7096f21ca9b0d6d6b8d88b2b4ec1564e
(7) 0x4bbbf85ce3377467afe5d46f804f221813b2bb87f24d81f60f1fcdbf7cbf4356
(8) 0xdbda1821b80551c9d65939329250298aa3472ba22feea921c0cf5d620ea67b97
(9) 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c


A) on safer side, we can create .env file and put our key & url.

To run .env:: source .env

to get key or url: echo $name

echo $PRIVATE_KEY

echo $RPC_URL

B) To get more safety, we will use '--interactive' or a keystore file with a password once foundry adds that.

We can cast our private key to any other varible & put a password protection.

ERC 2235

Encrypto your keys while developing:

...

cast wallet import defaultkey --interactive

...

Enter private key:
Enter password: wiki

`defaultkey` keystore was saved successfully. Address: 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266

we can check it by:

...

cast wallet list

...

Now we can access the key by using the command:

...

forge script script/DeploySmartContract.s.sol --rpc-url http://127.0.0.1:8545 --account defaultkey --sender 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 --broadcast -vvvv

Congratulation.


we deploy the smart contract to address 

[Success] Hash: 0xa70cc77a13e89ead4fbbb6fea414962ef9b66ef8d6b87a23d2de2e7231b14842
Contract Address: 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512

now we will send some data: 

use send the transaction:

...

cast send 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
  "store(uint256)" 123
  --rpc-url $RPC_URL \
  --private-key $PRIVATE_KEY

...

Now we will send a call to smart contract:

...

cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 \

"retrieve()"

...

So generally it will be:

cast operation address function_name

if convert it to dec.

cast --to-base 0x000000000000000000000000000000000000000000000000000000000000007b dec

we will get 123 back
