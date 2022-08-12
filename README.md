# Fusion Boilerplate

Fusion Boilerplate is an open-source interface for Fusion. In its current state
it is only compatible with Nova Network and can be used by anyone to create their
own DEX based on Fusion, without having to worry about deploying contracts and
setting up all the complex structure behind an AMM.

It uses Fusion SDK (https://github.com/nova-network-inc/fusion-sdk) to connect to
Fusion Public Contracts (https://github.com/nova-network-inc/fusion-public-contracts)
for allowing the interface to process token swaps and managing liquidity pools.

## Version 1.1.0 Update Notes
- Added support for a fully automated installation, running, and building via batch
scripts for Windows. You can access the script by executing `Application.cmd` inside
the main repository folder.
- Fixed bug with the swap hooks where it didn't fetch balances properly.
- Added version file.
- Fixed repository's `.gitignore`, which was letting unnecessary files to be uploaded.
- Removed SDK installation script - it's all done by `Application.cmd` now.
- Updated Readme FAQ and instructions to match new version.

## F.A.Q

### Is the code open-source? Can I change it and add my own logo, etc?
Yes. This boilerplate was conceived to be used by Nova Network's community to build
their very own DEXEs, and it can be fully customised to accommodate your own brand,
without the need for crediting Nova Network Inc.

### Can I add other networks?
You can, but for that you will likely have to customise the Fusion SDK, deploy
new contracts on the new networks you want to add, and change a big chunk of the
original code.

### Can I add my own token list?
Yes. The token list is defined at `/src/constants/lists.ts` and can be changed.
You can either upload, host, and use your own list `json` file, or submit a pull
request with your list at our [common-assets repository](https://github.com/nova-network-inc/common-assets/tree/main/token-lists)
and adjust the URL accordingly. As an alternative option, you can also modify
the `/src/hooks/useFetchListCallback.ts` file to fetch a local list instead. We have
left the snippets of code to use commented, and all you need to do is to uncomment
lines `12` and `39-42` for it to fetch the tokens list from `/src/constants/tokens/tokens.json`.

### Where can I find help?
Preferably via Discord. We have a dedicated developers' channel in there, where you
can share your questions and get advice from the community on how to tackle any
issues you might be facing while setting up this boilerplate.

## Installing
Fusion Boilerplate has all installation dependencies built-in, including its SDK,
and a fully automated script - for Windows only - that will help you managing
your repository, including building and deploying your application.

First, clone the Github repository.

```shell
git clone https://github.com/nova-network-inc/fusion-boilerplate ; cd fusion-boilerplate
```

### For Windows Users

Once you've finished cloning, run:

```shell
.\Application
```

Then run the following scripts, in order:

```shell
1. Install/Update Modules and Dependencies
4. Install/Reinstall Fusion SDK
5. Set Environment Variables
```

Once you have executed all three scripts, you just need to start the app.

```shell
2. Start Development Application
```

You can always double-click `Application.cmd` inside the main folder to start
the application script on your terminal.

### For MacOS and Linux Users

If you're using a **Mac** or **Linux**, after cloning run:

```shell
yarn install
```

After installing all dependencies, install the SDK and the extra dependencies
required using the command below.

```shell
rm -rf node_modules/@uniswap && cp -r @fusionSDK @uniswap && cp -r @uniswap node_modules/
```

Now all you need to do is to start the protocol using `yarn`.

```shell
yarn start
```

## Smart Contracts
All smart contract interactions are handled by Fusion SDK, but you can also customise
it and add your own contracts to the code if you want. For that you will need to
change the SDK manually.

## Licencing
This front-end code is open-source, under MIT licencing, and can be replicated, copied, and used by
any entity, person, individual, or group. No crediting is needed, and users are free
to suggest changes to the code via pull requests.

## Disclaimer
This boilerplate was based on Uniswap-V2 Open-Source Interface, and you might find
leftover components from the original code. Feel free to alter, delete, and replace
any components you want, just make sure to do so in such manner you will not compromise
the correct functioning of this interface.
