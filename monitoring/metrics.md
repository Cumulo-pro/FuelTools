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



