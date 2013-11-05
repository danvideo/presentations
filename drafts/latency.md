### Latency

* Light speed (locality)
* DNS
* TCP 
  - Ack connection
  - CWND
* Bufferbloat
* DosArrest - ip filtering.
* SSL
* HTTP
* non-blocking, vs threaded
* App data access sequence.
* RPC protocol
  * HTTP
  * Protobuf / MessagePack
* MySQL 
  * connection pool
  * sql cache (by hash)
  * parse (prepared statements?)
  * optimizer
  * index
  * fetch data (unnecessary data)
  * protocol (binary?)
  * stored procedures
  * fetch from disk
* Memcache
  * distributed, hashed.
  * multi get
* Redis
  * connection pool
  * pipeline
  * Lua scripts
* chunked encoding
* SPDY
  * Over SSL
  * binary protocol
  * multiplexed (warm)
* HTTP 2.0
* QUIC (over UDP)
  * fast open (remove connect RTT)
  * snapstart 
* Browser parsing 
  * HTML - DOM
  * CSS tree
  * execute javascript
  * render into rasterized images
* hack on websocket.
* All together
  * Local
  * Warm
  * Compact protocol
  * Respond early to start download
  * fetch data from memory
  * Limit necessary JS/CSS for initial rendering.
