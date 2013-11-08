### Latency in Web Applications

* 0 latency = do nothing. (do as little as possible)
* Measure RUM, 95%, 75%, compare between locations, mobile vs desktop.

__Browser__

* Browser parsing 
  * HTML - DOM
  * CSS tree
  * execute javascript - v8
  * render (paint and composite) into rasterized images - blink (multithreaded)
  * Rails4 - Turbolinks - ajax replace content to avoid reparsing css, js.
  * Chrome does a lot of prediction.
  * HTTP cache headers (we're not doing them)
  * LocalStorage
 
__Network__

* Light speed (locality)
* DNS
* TCP 
  - Ack connection
  - CWND
  - MTU
* Bufferbloat
* Mobile 3G, HSPA, LTE, Wifi 802.11n/ac
* DosArrest - ip filtering.
* SSL
* HTTP (watch out for redirect)
* websocket less overhead than ajax.
* App data access sequence.
* SOA/RPC protocol
  * HTTP
  * Protobuf / MessagePack
  * Typhoeus - libcurl - reuse TCP connection.
* chunked encoding (facebook BigPipe, PageSpeed)
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
* non blocking vs threaded (watch out for synchronised cpu intensive code)
* CPU - IPC, instructions per cycle
* bit hacking.

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
  * fetch from disk (RAID, disk buffer, file system (journalling mode), SSD)
  * true sequential read (patch from Facebook)
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
* trie - autocomplete, Rails routes
* Ruby Hash - doubling linked list, thats why they are ordered but also why slower than Python Dict.

__All together__

  * Locality
  * Warm - pipe, cache
  * Compact data - protocol, storage, retrieval
  * Respond early to start download
  * fetch data from memory
  * Limit necessary JS/CSS for initial rendering.
