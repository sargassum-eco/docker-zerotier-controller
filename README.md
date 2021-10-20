# docker-zerotier-controller

Docker image to run an isolated ZeroTier-One instance purely as a network controller

This is a modification of the official ZeroTier docker container to specialize it for
one purpose only: acting as an isolated network controller. Because it doesn't need
to join any networks, elevated permissions don't need to be granted. Additionally,
this modified image makes the HTTP API accessible over port 8001 for communication
outside the Docker container.

## Usage

You will need to attach a volume to `/var/lib/zerotier-one` for the controller
to persist its data. For example:
```
docker run --name zerotier-one --net=host \
  -v /var/lib/zerotier-one:/var/lib/zerotier-one sargassum-eco/zerotier-controller
```

In the future there may be an optional way to set the authtoken through an environment variable.
Additionally, there may be a CapRover one-click app.

## License

Copyright Prakash Lab and the Sargassum project contributors.

SPDX-License-Identifier: Apache-2.0 OR BlueOak-1.0.0

You can use this project either under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0) or under the [Blue Oak Model License 1.0.0](https://blueoakcouncil.org/license/1.0.0); you get to decide. We chose the Apache license because it's OSI-approved, and because it goes well together with the [Solderpad Hardware License](http://solderpad.org/licenses/SHL-2.1/), which is a license for open hardware used in other related projects but not this project. We prefer the Blue Oak Model License because it's easier to read and understand.
