### Latency in Web Applications

* 0 latency = do nothing. (do as little as possible)
* Browser parsing 
  * HTML - DOM
  * CSS tree
  * execute javascript - v8
  * render into rasterized images - blink
  * Rails4 - Turbolinks - ajax replace content to avoid reparsing css, js.
  * Chrome does a lot of prediction.
 
__Network__

* Light speed (locality)
* DNS
* TCP 
  - Ack connection
  - CWND
* Bufferbloat
* Mobile 3G, HSPA, LTE, Wifi 802.11n/ac
* DosArrest - ip filtering.
* SSL
* HTTP (watch out for redirect)
* non-blocking, vs threaded
* App data access sequence.
* SOA/RPC protocol
  * HTTP
  * Protobuf / MessagePack
  * Typhoeus - libcurl - reuse TCP connection.
* chunked encoding
* SPDY
  * Over SSL
  * binary protocol
  * multiplexed (warm)
* HTTP 2.0
* QUIC (over UDP)
  * fast open (remove connect RTT)
  * snapstart 
* chrome://net-internals/ 
* chrome://flags/

__Application__

* Garbage collection - parallel, stop the world, generational. (95%tiles)
* Cache fill race condition (95%tile)
* Generating new objects - hash.merge(k: v)
* less mem = less data to copy to CPU registers.
* modular code for JIT optimization.
* balance between too much methods (extra call pointers)
* meta programming, usually bad 
* dynamic programming / memoization.
* concurrency - contention (ConcurrentHashMap, message passing)
* code path, data access sequence

__Data__

* MySQL 
  * connection pool
  * sql cache (by hash)
  * parse (prepared statements?)
  * optimizer
  * index
  * fetch data (unnecessary data)
  * protocol (binary?)
  * stored procedures
  * contention / locking
  * storage engine - innodb
  * fetch from disk (RAID, disk cache, file system)
* Memcache
  * distributed, hashed.
  * multi get
* Redis
  * connection pool
  * pipeline
  * Lua scripts
  
__Data structures__

* Mysql Index - B+tree
* Redis Hash (limiting size can optimize memory)
* Redis ordered sets - skip list

__All together__

  * Locality
  * Warm - pipe, cache
  * Compact data - protocol, storage, retrieval
  * Respond early to start download
  * fetch data from memory
  * Limit necessary JS/CSS for initial rendering.
