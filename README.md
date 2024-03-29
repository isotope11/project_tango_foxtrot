## project_tango_foxtrot

SOA-ish website platform built on dcell/celluloid in the style of amazon.

### Inspiration

- Amazon's [general architecture](http://queue.acm.org/detail.cfm?id=1142065) is awesome.
  - Every component on an amazon page (menu, cart, related items, etc) is its
    own service.
  - Any request to amazon.com fires off ~100 or so requests to various services
    responsible for each part of the page (on the backend).
  - The page itself has a timeout set, say of 150ms.  When that timeout is hit,
    any of the services that haven't yet returned are just omitted from the
    rendered page.
- [DCell / Celluloid](http://celluloid.io) is fantastic and makes ruby seem
  better.
  - Celluloid is an Akka-like framework to make Plain Old Ruby Objects able to
    run concurrently as Actors.
  - An Actor runs in his own thread.
  - DCell lets you distribute these Celluloid Actors as services all over the
    network, not just on the same machine.  Distributed Objects generally.

### Expectations

- Build a website using the mechanisms outlined / enabled by this framework / lib, and this proof of concept should work:
  - want to build a basic webservice and test its throughput with ab (obv. using my dcell objects).  Once that's stable, launch same service on another machine in the network.  No other configuration.  See throughput ~double

### License

This project is released under the MIT License.  See LICENSE for details.
