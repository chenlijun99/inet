//
// Copyright (C) 2012 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.networklayer.configurator.nexthop;

import inet.networklayer.configurator.base.L3NetworkConfiguratorBase;

//
// Adds routes to a ~NextHopRoutingTable similarly to how ~Ipv4NetworkConfigurator adds
// static routes to the ~Ipv4RoutingTable.
//
simple NextHopNetworkConfigurator extends L3NetworkConfiguratorBase
{
    parameters:
        @class(NextHopNetworkConfigurator);
        @display("i=block/cogwheel");
        xml config = default(xml("<config/>")); // XML configuration parameters
        bool addStaticRoutes = default(true);  // Add static routes to the routing tables of all nodes to route to all destination interfaces (only where applicable; turn off when config file contains manual routes)
        bool dumpTopology = default(false);  // Print the extracted network topology to the module output
        bool dumpRoutes = default(false);    // Print the configured and optimized routing tables for all nodes to the module output
}
