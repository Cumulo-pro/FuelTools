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

## BYZANTINE VALIDATORS  
*cometbft_consensus_byzantine_validators*   

**Fuel Byzantine Validators Metric:** A metric that counts the number of validators who attempted to double sign in the Fuel network. Double signing refers to a validator signing two conflicting blocks, which is a violation of consensus rules. If the value is 0, it means that no validators have attempted to double sign.  

## BYZANTINE VALIDATORS POWER  
*cometbft_consensus_byzantine_validators_power*  

**Fuel Byzantine Validators Power Metric:** A metric that tracks the total power of the validators who attempted to double sign in the Fuel network. Validator power represents the weight of a validator in the consensus mechanism. If the value is 0, it means that no Byzantine validators exist, and hence there is no associated power.

## CHAIN SIZE  
*cometbft_consensus_chain_size_bytes*  

**Fuel Chain Size Metric:** A metric that tracks the total size of the chain in bytes. This includes all blocks and data stored in the blockchain. Monitoring the chain size is important for understanding the growth of the blockchain and ensuring it remains manageable for all nodes.  

## DUPLICATE BLOCK PARTS  
*cometbft_consensus_duplicate_block_part*  

**Fuel Duplicate Block Parts Metric:** A metric that tracks the number of duplicate block parts received by the node. Duplicate parts occur when the same piece of a block is transmitted multiple times, either due to network issues or inefficiencies in block propagation.  

## DUPLICATE VOTES  
*cometbft_consensus_duplicate_vote*  

**Fuel Duplicate Votes Metric:** A metric that counts the number of duplicate votes received by the node. Duplicate votes occur when the same vote is transmitted more than once, which can happen due to network issues or miscommunication between validators.  

## CHAIN HEIGHT  
*cometbft_consensus_height*  

**Fuel Chain Height Metric:** A metric that tracks the current height of the blockchain. The blockchain height represents the number of blocks in the chain and is an essential indicator of the network's progress. This metric helps in monitoring the advancement of the blockchain and determining how far a node is from the latest block.  

## LATE VOTES  
*cometbft_consensus_late_votes*  

**Fuel Late Votes Metric:** A metric that tracks the number of votes received by the node that correspond to earlier heights and rounds than the node is currently in. This can happen when votes are delayed due to network issues or miscommunication. It is crucial for monitoring whether votes are being processed within the correct consensus window.  

## LATEST BLOCK HEIGHT  
*cometbft_consensus_latest_block_height*  

**Fuel Latest Block Height Metric:** A metric that tracks the latest block height in the blockchain. The latest block height indicates the most recent block that has been added to the chain. It is a vital metric for synchronizing nodes and ensuring that they are up to date with the latest block.  

## MISSING VALIDATORS  
*cometbft_consensus_missing_validators*  

**Fuel Missing Validators Metric:** A metric that tracks the number of validators who did not sign the current block. When this value is 0, it indicates that all validators have signed the block. If this value is greater than 0, it implies that some validators have failed to sign the block, which could affect the overall consensus process.  

## MISSING VALIDATORS POWER  
*cometbft_consensus_missing_validators_power*  

**Fuel Missing Validators Power Metric:** A metric that tracks the total power of the validators who did not sign the current block. Validator power represents the weight of a validator's vote in the consensus process. If the value is 0, it indicates that no validators are missing, and their power is included in the consensus.  

## NUMBER OF TRANSACTIONS  
*cometbft_consensus_num_txs*  

**Fuel Number of Transactions Metric:** A metric that tracks the total number of transactions processed by the network. This helps monitor the transaction volume and assess the overall activity on the blockchain. A higher number of transactions indicates more activity on the chain.  




