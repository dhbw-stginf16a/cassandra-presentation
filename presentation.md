---
author: David Marchi, Daniel Schaefer, Erik Zeiske
title: Introducing Apache Cassandra
date: April 10, 2019
---

## Agenda

> - ???
> - ???

---

# Overview of C*

---

## History

- 2008, Developed by Facebook for inbox searching
- 2010, Proper Apache project
- Mainly developed and supported by Datastax
- 2014, 9th most popular database (db-engines.com)

---

## Deployments

Widely used by large companies in big clusters:

- Apple: >75k Cassandra nodes with 10PB in production (several clusters with 1000+ nodes)
- CERN: Backend storage for ATLAS detector
- Netflix: 2,500 nodes, 420 TB, over 1 trillion requests per day (Oracle to Cassandra)
- eBay: 6 billion writes and 5 bn read daily (single Cassandra table that is 40TB)

https://cdsweb.cern.ch/record/1432912/files/ATL-DAQ-SLIDE-2012-067.pdf
https://www.slideshare.net/adrianco/migrating-netflix-from-oracle-to-global-cassandra/28-Remote_Copies_Cassandra_duplicates_across
https://www.slideshare.net/jaykumarpatel/cassandra-at-ebay-13920376
https://www.datastax.com/resources/casestudies/ebay

---

## Key features

- Database with tables
- Wide column store
- NOT relational
- Distributed
- Free and open source (Apache License 2.0)
- For big data (e.g. compatible with Hadoop MapReduce)

---

## Wide Column Store

- **NOT** A columnar database (like Vertica)
- Like a RDMBS but **not** relational

# Pros/Cons

---

# Comparison to RDBMS

---

## Modeling Data

---

## CQL
  - (vs SQL)

---

# How data is written

![](https://docs.datastax.com/en/cassandra/3.0/cassandra/images/dml_write-process_12.png)

---

# How data is read

![](https://docs.datastax.com/en/cassandra/3.0/cassandra/images/dml_caching-reads_12.png)

---

# Demo

---

# Distributed

---

## Ring

![](http://abiasforaction.net/wp-content/uploads/2015/01/Cassandra-Ring.jpg)

---

### Virtual Nodes

![](https://engineeringblog.yelp.com/images/posts/monitoring-cassandra-at-scale/cassandra_ring.png)

---

## Rebalancing

![](https://www.datastax.com/wp-content/uploads/2012/02/numofmoves.png)

---

## CAP

- AP by default
- can act like PC
- AC not possible

---

## Qorums

- Parition level
- Read CL
- Write CL

  - How it's written to disk
  - ...

https://codahale.com/you-cant-sacrifice-partition-tolerance/

---

## Examples of how data is written and read

---

### Quorums

Single datacenter cluster with 3 replica nodes and consistency set to ONE

![](https://docs.datastax.com/en/cassandra/3.0/cassandra/images/arc_write-singleDCConOne.png)

---

### Node Down

![Hinted Handoff](https://docs.datastax.com/en/cassandra/3.0/cassandra/images/dml_hinted_handoff.png)

---

### Secondary Index

![](https://www.datastax.com/wp-content/uploads/2017/01/Native2i-Distributed-Index-3.png)

---

# Comparison to similar DBs
- HBase
- Scylla
- Google Bigtable

---

# Conclusion
