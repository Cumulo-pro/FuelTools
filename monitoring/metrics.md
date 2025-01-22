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

