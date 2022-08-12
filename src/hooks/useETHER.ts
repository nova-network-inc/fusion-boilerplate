import { ChainId, Currency, ETHER, FANTOM, NBX } from '@uniswap/sdk'
import { useActiveWeb3React } from '.'

/**
 * Given a name or address, does a lookup to resolve to an address and name
 * @param nameOrAddress ENS name or address
 */
export default function useETHER(): { loading: boolean; ETHER: Currency } {
  const { chainId } = useActiveWeb3React()
  if (chainId === ChainId.NOVA) {
    return {
      loading: false,
      ETHER: ETHER
    }
  }
  if (chainId === ChainId.FANTOM) {
    return {
      loading: false,
      ETHER: FANTOM
    }
  }
  if (chainId === ChainId.NEBULA) {
    return {
      loading: false,
      ETHER: NBX
    }
  }
  return {
    loading: true,
    ETHER
  }
}

export function useETHEROfChain(chainId: ChainId | undefined): { loading: boolean; ETHER: Currency } {
  if (chainId === ChainId.NOVA) {
    return {
      loading: false,
      ETHER: ETHER
    }
  }
  if (chainId === ChainId.FANTOM) {
    return {
      loading: false,
      ETHER: FANTOM
    }
  }
  if (chainId === ChainId.NEBULA) {
    return {
      loading: false,
      ETHER: NBX
    }
  }
  return {
    loading: true,
    ETHER
  }
}

export function getETHEROfChain(chainId: ChainId) {
  if (chainId === ChainId.NOVA) {
    return ETHER
  }
  if (chainId === ChainId.FANTOM) {
    return FANTOM
  }
  if (chainId === ChainId.NEBULA) {
    return NBX
  }
  return undefined
}
