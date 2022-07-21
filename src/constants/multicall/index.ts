import { ChainId } from '@uniswap/sdk'
import MULTICALL_ABI from './abi.json'

const MULTICALL_NETWORKS: { [chainId in ChainId]: string } = {
  [ChainId.NOVA]: '0x7A5a7579eb8DdEd352848cFDD0a5530C4e56FF7f',
  [ChainId.FANTOM]: '0x7A5a7579eb8DdEd352848cFDD0a5530C4e56FF7f',
  [ChainId.NEBULA]: '0x7A5a7579eb8DdEd352848cFDD0a5530C4e56FF7f'
}

export { MULTICALL_ABI, MULTICALL_NETWORKS }
