import { Interface } from '@ethersproject/abi'
import AGGREGATOR_ABI from './aggregator.json'

const AGGREGATOR_INTERFACE = new Interface(AGGREGATOR_ABI)

export default AGGREGATOR_INTERFACE
export { AGGREGATOR_ABI }
