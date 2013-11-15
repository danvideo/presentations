#encoding: UTF-8

center <<-EOS
  \e[1mWeb Application Performance\e[0m
  +---------+
  | Browser |
  +---------+
  | Network |
  +---------+
  | App     |
  +---------+
  | Storage |
  +---------+
EOS

center <<-EOS
  What is fast enough?

  +--------------------------------------+
  | Delay      | User Reaction           |
  +--------------------------------------+
  | 0 - 100ms  | Instant                 |
  +--------------------------------------+
  | 100-300ms  | Small perceptible delay |
  +--------------------------------------+
  | 300-1000ms | Machine is working      |
  +--------------------------------------+
  | 1s+        | Mental context switch   |
  +--------------------------------------+
  | 10s+       | I'll come back later    |
  +--------------------------------------+
EOS

block <<-EOS
  \e[1mWhat is the best case?\e[0m
  * Do nothing = 0 latency
  * Measure RUM, 95%, 75%, compare between locations
  * Mobile vs Desktop
EOS

block <<-EOS
  \e[1mBrowser\e[0m

  * Bytes -> Characters -> Tokens -> Nodes -> Dom
  * Stream parsing and Dom building
  * Javascript will block (use defer, async)
  * Parse CSS into a tree
  * Render (paint and composite) into rasterized images. (Blink maybe multithreaded)
  * V8 VM executes javascript - Generational GC.
EOS

block <<-EOS
  \e[1mBrowser\e[0m

  * Chrome does a lot of prediction (warms up TCP/DNS)
  * LocalStorage instead of cookies
  * HTTP cache headers
  * Turbolink (Rails4) - ajax replace content to avoid reparsing
EOS

block <<-EOS
  \e[1mNetwork\e[0m

  * Light speed RTT - 200ms
  * DNS
  * TCP
    - Ack 3 way handshake
    - Congestion Window (CWND)
    - Max Transfer Unit (MTU)
  * Last mile
    * Mobile 3G, HSPA, LTE, Wifi 802.11n/ac
    * Bufferbloat
  * DOSarrest IP filtering
  * SSL negotiation
  * HTTP (watch out for redirects)
EOS

block <<-EOS
  \e[1mNetwork\e[0m

  * Websockets (persist connection, less overhead)
  * SOA/RPC protocol
    * HTTP
    * Protobuf / MessagePack
    * Typhoeus - libcurl - reuse TCP connection
  * Chunked encoding (streaming response)
  * SPDY - (HTTP/2.0)
    - Over SSL
    - Binary protocol
    - multiplexed (reuse warm connection)
  * QUIC (over UDP)
    - fast open (remove handshake RTT)
    - snapstart (speed up SSL negotiation)
  * chrome://net-internals/
  * chrome://flags
EOS

block <<-EOS
  \e[1mApplication\e[0m

  * Analyse Data access sequence (parallelize)
  * Understand Garbage Collection
  * Minimize Object generation
    - hash.merge(k: v) - antipattern
  * Less mem = less data to copy to CPU registers
  * Eager loading (but understand your index)
  * Cache - invalidation, fill race condition
EOS

block <<-EOS
  \e[1mApplication\e[0m

  * Modular code for JIT optimization
  * Balance between too many methods.
  * Avoid meta programming.
  * Memoize, dynamic programming
EOS

block <<-EOS
  \e[1mApplication Concurrency\e[0m

  * Contention
    - ConcurrentHashMap
    - message passing
    - avoid synchronize mutex
  * Evented vs Threaded
    - watch out for synchronized CPU intensive code
  * CPU context switching
  * CPU instructions per cycle
    * avoid branching
    * bit hacking
EOS

block <<-EOS
  \e[1mMySQL\e[0m

  1. Query cache (by hash)
  2. Parse SQL (prepared statements)
  3. Optimizer (looks at statistics)
  4. Index
  5. Fetch from memory pages (innodb buffer pool)
  6. Fetch from disk

EOS

block <<-EOS
  \e[1mMySQL\e[0m

  * Connection Pool
  * protocol (binary?)
  * stored procedures
  * contention / locking
  * storage engine - innodb
  * Disk - RAID, buffer, filesystem (ext4 journalling mode), SSD
  * Sequential READ (patched from FB)
EOS

block <<-EOS
  \e[1mMemcache & Redis\e[0m

  * Memcache
    * Distributed, client side hash
    * Multi get
  * Redis
    * pipeline mode
    * Lua scripts
    * data structures big O
EOS

block <<-EOS
  \e[1mData structures\e[0m

  * B+Tree - MySQL Index
  * SkipList - Redis ordered set
  * Trie - Rails routes, autocomplete
  * Hash functions (SipHash)
  * Ruby Hash vs Python Dict (double linked list)
  * Log structured merge tree (LSM)
    - LevelDB - Riak, Chrome, ActiveMQ
    - BigTable, Cassandra
EOS

block <<-EOS
  \e[1mAll together\e[0m

  * Locality
  * Warm - pipe, cache
  * Compact data - protocol, storage, retrieval
  * Respond early and streaming
  * Cache used in different layers
  * Data structure efficiency
  * Limit necessary JS/CSS for initial rendering
EOS

center <<-EOS
Thank you:

Read more...

EOS

