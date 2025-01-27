# Fuel Squencer metrics FAQ


## SYNC STATUS  
*cometbft_blocksync_syncing* 

**Fuel Block Synchronisation Metric:** A metric that indicates whether a node in the Fuel consensus system is syncing blocks. When this metric has a value of 1, it means that the node is actively syncing blocks. Conversely, a value of 0 indicates that the node is not currently syncing blocks. Block synchronization is the process by which a node updates its copy of the blockchain by downloading the most recent blocks from other nodes in the network.  

Value: 
- SYNC (syncing blocks)
- NO SYNC (not syncing blocks)

![image](https://github.com/user-attachments/assets/830410f6-e7f6-41a4-87af-21bba00ce2ad)

## BLOCK GOSSIP  
*cometbft_consensus_block_gossip_parts_received*  

**Fuel Block Gossip Metric:** A metric that tracks the number of block parts received by the node. The metric distinguishes between parts that are relevant to the block the node is trying to gather and those that are not.

-When the matches_current label is set to true, it indicates that the block part is relevant to the block the node is currently trying to gather.  
-When the matches_current label is set to false, it indicates that the block part is not relevant to the current block being gathered.  

Value:

matches_current="true": The received block part is relevant to the current block being gathered.  
matches_current="false": The received block part is not relevant to the current block.

![image](https://github.com/user-attachments/assets/e825d855-9588-414c-b7fc-79839506cd17)

## BLOCK INTERVAL
*cometbft_consensus_block_interval_seconds*  

**Fuel Block Interval Metric:** A metric that tracks the time between the current block and the last block. This metric is provided as a histogram, which allows for the measurement of block intervals within specific time ranges. The histogram has multiple buckets, each corresponding to a time interval, and counts the number of blocks whose interval falls within that range.  

This metric helps in understanding the performance and frequency of block production in the network, with shorter intervals indicating faster block production and larger intervals showing slower block creation.  

Buckets:  

le="0.005": Blocks with an interval of 0.005 seconds or less.  
le="0.01": Blocks with an interval of 0.01 seconds or less.  
le="0.025": Blocks with an interval of 0.025 seconds or less.  
le="0.05": Blocks with an interval of 0.05 seconds or less.  
le="0.1": Blocks with an interval of 0.1 seconds or less.  
le="0.25": Blocks with an interval of 0.25 seconds or less.  
le="0.5": Blocks with an interval of 0.5 seconds or less.  
le="1": Blocks with an interval of 1 second or less.  
le="2.5": Blocks with an interval of 2.5 seconds or less.  
le="5": Blocks with an interval of 5 seconds or less.  
le="10": Blocks with an interval of 10 seconds or less.  
le="+Inf": Blocks with any interval (greater than 10 seconds).  

Sum and Count:  
- sum: The total sum of all block intervals.  
- count: The total number of blocks recorded.   

## BLOCK SIZE  
*cometbft_consensus_block_size_bytes*  

**Fuel Block Size Metric:** A metric that tracks the size of the blocks in the Fuel network. This metric is reported in bytes and indicates the size of the current block being processed by the consensus protocol. Monitoring the block size helps ensure that blocks remain within acceptable limits for efficient processing and that the network can handle the volume of data generated.  

![image](https://github.com/user-attachments/assets/a8d5448a-03b9-4ba3-8f30-bbe3a93b501e)

## BYZANTINE VALIDATORS  
*cometbft_consensus_byzantine_validators*   

**Fuel Byzantine Validators Metric:** A metric that counts the number of validators who attempted to double sign in the Fuel network. Double signing refers to a validator signing two conflicting blocks, which is a violation of consensus rules. If the value is 0, it means that no validators have attempted to double sign.  

![image](https://github.com/user-attachments/assets/7e060114-b415-4e44-acd8-404eec893cb4)

## BYZANTINE VALIDATORS POWER  
*cometbft_consensus_byzantine_validators_power*  

**Fuel Byzantine Validators Power Metric:** A metric that tracks the total power of the validators who attempted to double sign in the Fuel network. Validator power represents the weight of a validator in the consensus mechanism. If the value is 0, it means that no Byzantine validators exist, and hence there is no associated power.

![image](https://github.com/user-attachments/assets/bd24bae0-2dc9-4f6f-b1fa-389ec07d23fa)

## CHAIN SIZE  
*cometbft_consensus_chain_size_bytes*  

**Fuel Chain Size Metric:** A metric that tracks the total size of the chain in bytes. This includes all blocks and data stored in the blockchain. Monitoring the chain size is important for understanding the growth of the blockchain and ensuring it remains manageable for all nodes.  

![image](https://github.com/user-attachments/assets/3bcbab6f-7cdd-4392-ae3d-11f9e5cc5ac4)

## DUPLICATE BLOCK PARTS  
*cometbft_consensus_duplicate_block_part*  

**Fuel Duplicate Block Parts Metric:** A metric that tracks the number of duplicate block parts received by the node. Duplicate parts occur when the same piece of a block is transmitted multiple times, either due to network issues or inefficiencies in block propagation.  

![image](https://github.com/user-attachments/assets/1b5d0a68-540f-46b1-8e48-3f3b96481353)

## DUPLICATE VOTES  
*cometbft_consensus_duplicate_vote*  

**Fuel Duplicate Votes Metric:** A metric that counts the number of duplicate votes received by the node. Duplicate votes occur when the same vote is transmitted more than once, which can happen due to network issues or miscommunication between validators.  

![image](https://github.com/user-attachments/assets/5b018677-3319-41cb-a209-5e688980039a)

## CHAIN HEIGHT  
*cometbft_consensus_height*  

**Fuel Chain Height Metric:** A metric that tracks the current height of the blockchain. The blockchain height represents the number of blocks in the chain and is an essential indicator of the network's progress. This metric helps in monitoring the advancement of the blockchain and determining how far a node is from the latest block.  

![image](https://github.com/user-attachments/assets/8813d52f-bdb5-45ea-bd3e-29659ad646ab)

## LATE VOTES  
*cometbft_consensus_late_votes*  

**Fuel Late Votes Metric:** A metric that tracks the number of votes received by the node that correspond to earlier heights and rounds than the node is currently in. This can happen when votes are delayed due to network issues or miscommunication. It is crucial for monitoring whether votes are being processed within the correct consensus window.  

![image](https://github.com/user-attachments/assets/e51e6d0c-87d3-4267-8248-b95e40c957e1)

## LATEST BLOCK HEIGHT  
*cometbft_consensus_latest_block_height*  

**Fuel Latest Block Height Metric:** A metric that tracks the latest block height in the blockchain. The latest block height indicates the most recent block that has been added to the chain. It is a vital metric for synchronizing nodes and ensuring that they are up to date with the latest block.  

![image](https://github.com/user-attachments/assets/0111d18a-b15c-44f6-8839-f560f5759ca4)

## MISSING VALIDATORS  
*cometbft_consensus_missing_validators*  

**Fuel Missing Validators Metric:** A metric that tracks the number of validators who did not sign the current block. When this value is 0, it indicates that all validators have signed the block. If this value is greater than 0, it implies that some validators have failed to sign the block, which could affect the overall consensus process.  

![image](https://github.com/user-attachments/assets/0319be1b-9b12-4763-a83d-20722650260c)

## MISSING VALIDATORS POWER  
*cometbft_consensus_missing_validators_power*  

**Fuel Missing Validators Power Metric:** A metric that tracks the total power of the validators who did not sign the current block. Validator power represents the weight of a validator's vote in the consensus process. If the value is 0, it indicates that no validators are missing, and their power is included in the consensus.  

![image](https://github.com/user-attachments/assets/fa662f24-46a9-4cb7-930e-2b48143069cb)

## NUMBER OF TRANSACTIONS  
*cometbft_consensus_num_txs*  

**Fuel Number of Transactions Metric:** A metric that tracks the total number of transactions processed by the network. This helps monitor the transaction volume and assess the overall activity on the blockchain. A higher number of transactions indicates more activity on the chain.  

![image](https://github.com/user-attachments/assets/187abae6-28b9-4d1a-9ad9-61a2c0e0266d)

## PROPOSAL RECEIVE COUNT
*cometbft_consensus_proposal_receive_count*  

**Fuel Proposal Receive Count Metric:**  
A metric that tracks the total number of proposals received by the node since the process started. The metric is annotated by the status of the proposal, which can either be "accepted" or "rejected".  

-When the proposal is accepted, it means that the proposal was successfully processed and agreed upon by the node.  
-When the proposal is rejected, it indicates that the proposal was not accepted due to various reasons, such as consensus issues or validation failures.  
Monitoring this metric helps track the node's participation in the consensus process and the success rate of proposals it has received.

Labels:  
-chain_id: The ID of the chain, in this case seq-mainnet-1.  
-status: The status of the proposal, either accepted or rejected.  

![image](https://github.com/user-attachments/assets/dd4a1d02-0610-4bdd-8654-33a31c695e39)

## TOTAL TRANSACTIONS  
*cometbft_consensus_total_txs*  

**Fuel Total Transactions Metric:** A metric that tracks the total number of transactions processed by the network. This metric helps in monitoring the overall transaction activity on the blockchain, giving insights into the level of usage and activity within the network.  

![image](https://github.com/user-attachments/assets/c22dae89-8bea-4b21-99ea-37a1d2343d94)

## VALIDATOR LAST SIGNED HEIGHT  
*cometbft_consensus_validator_last_signed_height*  

**Fuel Validator Last Signed Height Metric:** A metric that tracks the last height signed by a specific validator. This helps monitor whether the validator is keeping up with the chain and participating in signing blocks. The height represents the most recent block that the validator has signed.  

![image](https://github.com/user-attachments/assets/2adb139d-0611-4936-8dc2-5cf0dc2d4d2c)

## VALIDATOR MISSED BLOCKS  
*cometbft_consensus_validator_missed_blocks*  

**Fuel Validator Missed Blocks Metric:** A metric that tracks the number of blocks missed by a specific validator. If the validator is not signing blocks or fails to participate in the consensus process, the missed blocks count will increase. Monitoring this metric is important for assessing the reliability and performance of validators.  

![image](https://github.com/user-attachments/assets/df0d1559-aced-40da-90bc-9000b4d50ec2)

## VALIDATOR POWER  
*cometbft_consensus_validator_power*  

**Fuel Validator Power Metric:** A metric that tracks the power of a specific validator. Validator power represents the weight of the validator's vote in the consensus mechanism. This power is typically determined by the amount of staked tokens or other mechanisms within the consensus protocol.  

![image](https://github.com/user-attachments/assets/3800b545-02ca-46a1-984d-6cd54df21b0d)

## NUMBER OF VALIDATORS  
*cometbft_consensus_validators*  

**Fuel Number of Validators Metric:** A metric that tracks the total number of validators participating in the network. This helps monitor the decentralization of the network and the number of entities responsible for validating and securing the blockchain.  

![image](https://github.com/user-attachments/assets/ed921347-64ab-4410-a3bb-71aea08b31aa)

## TOTAL VALIDATORS POWER  
*cometbft_consensus_validators_power*  

**Fuel Total Validators Power Metric:** A metric that tracks the total power of all validators in the network. This represents the combined weight of all validators' votes in the consensus process, which affects the overall decision-making and finality of blocks in the blockchain.  

![image](https://github.com/user-attachments/assets/fed89975-96c6-4be6-920d-b578280f1659)

## ACTIVE OUTBOUND CONNECTIONS (MEMPOOL)  
*cometbft_mempool_active_outbound_connections*

**Fuel Active Outbound Connections in Mempool Metric:** A metric that tracks the number of active outbound connections used for gossiping transactions in the mempool. This metric helps monitor the network's activity regarding transaction propagation.  

![image](https://github.com/user-attachments/assets/d0547dcf-c88d-4c49-adba-763566305eb8)

## FAILED TRANSACTIONS (MEMPOOL)  
*cometbft_mempool_failed_txs*  

**Fuel Failed Transactions Metric:** A metric that tracks the number of transactions that failed to be processed in the mempool. Failed transactions can occur due to network issues, validation failures, or other factors.  

![image](https://github.com/user-attachments/assets/03988ac9-6a42-468c-97a9-044ab5412ff1)

## MEMPOOL RECHECK TIMES
*cometbft_mempool_recheck_times*  

**Fuel Mempool Recheck Times Metric:** A metric that tracks the number of times transactions have been rechecked in the mempool. Rechecks are typically performed to validate or confirm the status of transactions that were previously pending.  

## MEMPOOL SIZE
*cometbft_mempool_size*  

**Fuel Mempool Size Metric:** A metric that tracks the number of uncommitted transactions in the mempool. This metric is useful for assessing the current transaction load on the network and understanding the state of pending transactions.    

## MEMPOOL SIZE (BYTES)  
*cometbft_mempool_size_bytes*

**Fuel Mempool Size in Bytes Metric:** A metric that tracks the total size of the mempool in bytes. Monitoring the size of the mempool is important for understanding the resource usage and ensuring that the node can handle the load of pending transactions efficiently.  

![image](https://github.com/user-attachments/assets/f5832ae6-0b3c-45fb-8dc6-254534bbe98a)

## PEER CONNECTIONS  
*cometbft_p2p_peers*   

**CometBFT Peer Connections Metric:** A gauge metric that tracks the number of active peer connections in the P2P layer of the network. This metric provides insight into the connectivity of the node with the network. Monitoring the number of peers is critical to ensure sufficient connections for block propagation, data exchange, and overall network health.    

![image](https://github.com/user-attachments/assets/4fa0b5a7-44ce-4ed0-a81c-c1aa505c245c)

## AVERAGE BLOCK PROCESSING TIME
*cometbft_state_block_processing_time_sum / cometbft_state_block_processing_time_count*  

This metric represents the average time spent processing a single block during the FinalizeBlock phase. It is calculated by dividing the total processing time (cometbft_state_block_processing_time_sum) by the total number of blocks processed (cometbft_state_block_processing_time_count).  
Usage in a panel: This metric is ideal for monitoring the efficiency of block processing. By tracking the average time per block, you can identify performance trends or detect unusual spikes that may indicate potential issues with the node.  

![image](https://github.com/user-attachments/assets/0cae009c-99f5-4b21-b9f2-a143522d90f6)

## VALIDATOR SET UPDATES  
*cometbft_state_validator_set_updates*  

**CometBFT Validator Set Updates Metric:** A counter metric that tracks the total number of validator set updates returned by the application since the node process started. Validator set updates occur when there are changes in the validator composition, such as adding or removing validators or modifying their voting power. Monitoring this metric is essential for understanding network governance dynamics and ensuring a healthy and secure validator set.  

## MINTED TOKENS  
*sequencer_begin_block_minted_tokens*  

**Sequencer Minted Tokens Metric:** A gauge metric that tracks the number of tokens minted at the beginning of a block by the sequencer. This metric is useful for understanding token issuance within the network and monitoring the rate of new token creation.   

![image](https://github.com/user-attachments/assets/5539c899-20b9-4019-8d4a-f6bd36445d2e)

## ETHEREUM EVENT INDEX OFFSET
*sequencer_store_ethereum_event_index_offset*  

**Sequencer Ethereum Event Index Offset Metric:** A gauge metric that tracks the current offset of indexed Ethereum events. This metric is useful for ensuring the sequencer is correctly tracking Ethereum event logs and maintaining synchronization with the Ethereum network.  

## INJECTED TRANSACTIONS  
*sequencer_store_index_num_injected_txs_total*  

**Sequencer Injected Transactions Metric:** A gauge metric that tracks the total number of injected transactions in the sequencer's index. This metric helps monitor how many transactions have been programmatically or manually injected into the network for processing.    

![image](https://github.com/user-attachments/assets/167e5b4c-d3c9-4c24-9032-16e53da57332)

## LAST CONSENSUS TRANSACTION SEQUENCE
*sequencer_store_last_consensus_txs_sequence*  

**Sequencer Last Consensus Transaction Sequence Metric:** A gauge metric that tracks the sequence number of the last consensus transaction processed by the sequencer. This metric is important for identifying the latest consensus state and monitoring transaction flow.  

![image](https://github.com/user-attachments/assets/58bacb6e-d4cb-49ed-937e-d0dbd6ea139b)

## LAST ETHEREUM BLOCK SYNCED
*sequencer_store_last_ethereum_block_synced*

**Sequencer Last Ethereum Block Synced Metric:** A gauge metric that tracks the latest Ethereum block synchronized by the sequencer. This metric is critical for monitoring the sync status of the sequencer with the Ethereum network.  

![image](https://github.com/user-attachments/assets/83d7bd97-a62a-4f9b-bfd9-4d8ec016521a)

## LAST ETHEREUM NONCE
*sequencer_store_last_ethereum_nonce*  

**Sequencer Last Ethereum Nonce Metric:** A gauge metric that tracks the latest Ethereum nonce observed by the sequencer. This metric provides insight into Ethereum transaction progress and nonce management.  

![image](https://github.com/user-attachments/assets/7857d203-e2c4-4bd1-9420-1641a709df8e)

## TIME SINCE LAST ETHEREUM UPDATE
**sequencer_store_time_since_last_eth_update**  

**Sequencer Time Since Last Ethereum Update Metric:** A gauge metric that tracks the time elapsed (in seconds) since the last Ethereum update processed by the sequencer. This metric is useful for identifying delays or lags in updating Ethereum-related data.  

## TRANSACTION COUNT
*tx_count*  

**Transaction Count Metric:** A counter metric that tracks the total number of transactions processed by the network since the process started. This metric provides an overall view of network activity and transaction throughput.  

![image](https://github.com/user-attachments/assets/c65b5417-8ad7-4d28-9b64-588447eb9455)

## GAS USED
*tx_gas_used*  

**Transaction Gas Used Metric:** A gauge metric that tracks the total amount of gas used by the latest transaction processed. Monitoring this metric is critical for analyzing the cost of transactions and network resource utilization.  

## GAS WANTED
*tx_gas_wanted*  

**Transaction Gas Wanted Metric:** A gauge metric that tracks the amount of gas requested by the latest transaction. This metric helps identify transaction demands and trends in gas consumption.  

## SUCCESSFUL TRANSACTIONS
*tx_successful*  

**Successful Transactions Metric:** A counter metric that tracks the total number of successfully processed transactions. This metric provides an indication of the network's efficiency and ability to handle transactions without errors.  




