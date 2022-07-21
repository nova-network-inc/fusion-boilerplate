import { CurrencyAmount } from '@uniswap/sdk'
import React, { useCallback } from 'react'
import { Text } from 'rebass'
import { ButtonError } from '../Button'
import TransactionConfirmationModal, {
  ConfirmationModalContent,
  TransactionErrorContent
} from '../TransactionConfirmationModal'
import AggregatorSwapModalHeader from './AggregatorSwapModalHeader'

/**
 * Returns true if the trade requires a confirmation of details before we can submit it
 * @param tradeA trade A
 * @param tradeB trade B
 */
// function tradeMeaningfullyDiffers(tradeA: Trade, tradeB: Trade): boolean {
//   return (
//     tradeA.tradeType !== tradeB.tradeType ||
//     !currencyEquals(tradeA.inputAmount.currency, tradeB.inputAmount.currency) ||
//     !tradeA.inputAmount.equalTo(tradeB.inputAmount) ||
//     !currencyEquals(tradeA.outputAmount.currency, tradeB.outputAmount.currency) ||
//     !tradeA.outputAmount.equalTo(tradeB.outputAmount)
//   )
// }

export default function AggregatorConfirmSwapModal({
  inputAmount,
  outputAmount,
  onConfirm,
  onDismiss,
  swapErrorMessage,
  isOpen,
  attemptingTxn,
  txHash
}: {
  inputAmount: CurrencyAmount | undefined
  outputAmount: CurrencyAmount | undefined
  isOpen: boolean
  attemptingTxn: boolean
  txHash: string | undefined
  onConfirm: () => void
  swapErrorMessage: string | undefined
  onDismiss: () => void
}) {
  const modalHeader = useCallback(() => {
    return <AggregatorSwapModalHeader inputAmount={inputAmount} outputAmount={outputAmount} />
  }, [inputAmount, outputAmount])

  const modalBottom = useCallback(() => {
    return (
      <ButtonError onClick={onConfirm} style={{ margin: '10px 0 0 0' }} id="confirm-swap-or-send">
        <Text fontSize={20} fontWeight={500}>
          {'Confirm Swap'}
        </Text>
      </ButtonError>
    )
  }, [onConfirm])

  // text to show while loading
  const pendingText = `Swapping ${inputAmount?.toSignificant(6)} ${
    inputAmount?.currency?.symbol
  } for ${outputAmount?.toSignificant(6)} ${outputAmount?.currency?.symbol}`

  const confirmationContent = useCallback(
    () =>
      swapErrorMessage ? (
        <TransactionErrorContent onDismiss={onDismiss} message={swapErrorMessage} />
      ) : (
        <ConfirmationModalContent
          title="Confirm Swap"
          onDismiss={onDismiss}
          topContent={modalHeader}
          bottomContent={modalBottom}
        />
      ),
    [onDismiss, modalBottom, modalHeader, swapErrorMessage]
  )

  return (
    <TransactionConfirmationModal
      isOpen={isOpen}
      onDismiss={onDismiss}
      attemptingTxn={attemptingTxn}
      hash={txHash}
      content={confirmationContent}
      pendingText={pendingText}
    />
  )
}
