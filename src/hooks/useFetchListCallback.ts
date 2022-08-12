import { nanoid } from '@reduxjs/toolkit'
import { ChainId } from '@uniswap/sdk'
import { TokenList } from '@uniswap/token-lists'
import { useCallback } from 'react'
import { useDispatch } from 'react-redux'
import { getNetworkLibrary, NETWORK_CHAIN_ID } from '../connectors'
import { AppDispatch } from '../state'
import { fetchTokenList } from '../state/lists/actions'
import getTokenList from '../utils/getTokenList'
import resolveENSContentHash from '../utils/resolveENSContentHash'
import { useActiveWeb3React } from './index'
// import tokens from '../constants/tokens/tokens.json'

export function useFetchListCallback(): (listUrl: string) => Promise<TokenList> {
  const { chainId, library } = useActiveWeb3React()
  const dispatch = useDispatch<AppDispatch>()

  const ensResolver = useCallback(
    (ensName: string) => {
      if (!library || chainId !== ChainId.NOVA) {
        if (NETWORK_CHAIN_ID === ChainId.NOVA) {
          const networkLibrary = getNetworkLibrary()
          if (networkLibrary) {
            return resolveENSContentHash(ensName, networkLibrary)
          }
        }
        throw new Error('Could not construct mainnet ENS resolver')
      }
      // return resolveENSContentHash(ensName, library)
      return new Promise<string>(resolve => resolve(''))
    },
    [chainId, library]
  )

  return useCallback(
    async (listUrl: string) => {
      const requestId = nanoid()
      dispatch(fetchTokenList.pending({ requestId, url: listUrl }))
      // if (tokens) {
      //   dispatch(fetchTokenList.fulfilled({ url: listUrl, tokenList: tokens, requestId }))
      //   return tokens
      // }
      return getTokenList(listUrl, ensResolver)
        .then(tokenList => {
          dispatch(fetchTokenList.fulfilled({ url: listUrl, tokenList, requestId }))
          return tokenList
        })
        .catch(error => {
          console.debug(`Failed to get list at url ${listUrl}`, error)
          dispatch(fetchTokenList.rejected({ url: listUrl, requestId, errorMessage: error.message }))
          throw error
        })
    },
    [dispatch, ensResolver]
  )
}
