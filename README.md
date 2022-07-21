# Fusion Boilerplate

Fusion Boilerplate is an open-source interface for Fusion. In its current state
it is compatible with Nova Network, Nebula Testnet, and Fantom Opera, and can be
used by anyone to create their own DEX based on Fusion, without having to worry
about deploying contracts and setting up all the complex structure behind an AMM.

It uses Fusion SDK (https://github.com/nova-network-inc/fusion-sdk) to connect to
Fusion Public Contracts (https://github.com/nova-network-inc/fusion-public-contracts)
for allowing the interface to process token swaps and managing liquidity pools.

## F.A.Q

### Is the code open-source? Can I change it and add my own logo, etc?
Yes. This boilerplate was conceived to be used by Nova Network's community to build
their very own DEXEs, and it can be fully customised to accommodate your own brand,
without the need for crediting Nova Network Inc.

### Can I add other networks?
You can, but for that you will have to customise the Fusion SDK, deploy new contracts
on the new networks you want to add, and change a big chunk of the original code.

### Can I add my own token list?
Yes. Simply edit the token list under `src/constants/tokens/tokens.json` to create
your own whitelisted tokens list. Please remember that for tokens to be tradeable,
they need to have enough available liquidity, which can be pooled using this boilerplate,
or Fusion at https://fusion.novanetwork.io/.

### Where can I find help?
Preferably via Discord. We have a dedicated developers' channel in there, where you
can share your questions and get advice from the community on how to tackle any
issues you might be facing while setting up this boilerplate.

## Installing
Fusion Boilerplate has all installation dependencies built-in, including its SDK. First, clone
the Github repository.

```shell
git clone https://github.com/nova-network-inc/fusion-boilerplate && cd fusion-boilerplate
```

Once you've finished cloning, install all dependencies with `yarn` using the command
below. You can also install it with `npm` but we do recommend using `yarn`.

```shell
yarn install
```

After installing all dependencies, install the SDK and the extra dependencies
required. Note that the command below will only work on Windows environments. If
you are using Linux or Mac OS, manually copy the `@uniswap` directory to your
`node_modules` directory, replacing any existing files.

```shell
.\installFusionSDKWin32
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
