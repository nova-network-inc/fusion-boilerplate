import { CurrencyAmount } from '@uniswap/sdk'
import React, { useContext } from 'react'
import { ArrowDown } from 'react-feather'
import { Text } from 'rebass'
import { ThemeContext } from 'styled-components'
import { AutoColumn } from '../Column'
import CurrencyLogo from '../CurrencyLogo'
import { RowBetween, RowFixed } from '../Row'
import { TruncatedText } from './styleds'

export default function AggregatorSwapModalHeader({
  inputAmount,
  outputAmount
}: {
  inputAmount: CurrencyAmount | undefined
  outputAmount: CurrencyAmount | undefined
}) {
  const theme = useContext(ThemeContext)

  return (
    <AutoColumn gap={'md'} style={{ marginTop: '20px' }}>
      <RowBetween align="flex-end">
        {inputAmount && (
          <RowFixed gap={'0px'}>
            <CurrencyLogo currency={inputAmount?.currency} size={'24px'} style={{ marginRight: '12px' }} />
            <TruncatedText fontSize={24} fontWeight={500} color={theme.primary1}>
              {inputAmount?.toSignificant(6)}
            </TruncatedText>
          </RowFixed>
        )}
        {inputAmount && (
          <RowFixed gap={'0px'}>
            <Text fontSize={24} fontWeight={500} style={{ marginLeft: '10px' }}>
              {inputAmount?.currency?.symbol}
            </Text>
          </RowFixed>
        )}
      </RowBetween>
      <RowFixed>
        <ArrowDown size="16" color={theme.text2} style={{ marginLeft: '4px', minWidth: '16px' }} />
      </RowFixed>
      {outputAmount && (
        <>
          <RowBetween align="flex-end">
            <RowFixed gap={'0px'}>
              <CurrencyLogo currency={outputAmount?.currency} size={'24px'} style={{ marginRight: '12px' }} />
              <TruncatedText fontSize={24} fontWeight={500} color={theme.primary1}>
                {outputAmount?.toSignificant(6)}
              </TruncatedText>
            </RowFixed>
            <RowFixed gap={'0px'}>
              <Text fontSize={24} fontWeight={500} style={{ marginLeft: '10px' }}>
                {outputAmount.currency.symbol}
              </Text>
            </RowFixed>
          </RowBetween>
        </>
      )}
    </AutoColumn>
  )
}
