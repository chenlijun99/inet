//
// Copyright (C) 2020 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.applications.tcpapp;

import inet.applications.contract.IApp;
import inet.queueing.contract.IActivePacketSource;
import inet.queueing.contract.IPacketScheduler;
import inet.queueing.contract.IPassivePacketSink;

//
// This client application contains a configurable pre-composed telnet traffic
// source and traffic sink.
//
// @see ~TelnetServerApp
//
module TelnetClientApp like IApp
{
    parameters:
        @display("i=block/app");
    gates:
        input socketIn;
        output socketOut;
    submodules:
        characterProducer: <default("ActivePacketSource")> like IActivePacketSource {
            parameters:
                packetLength = 1B;
                packetData = intuniform(97, 122); // Lower case ASCII characters
                productionInterval = uniform(0.1s, 0.2s); // Typing speed between 5 and 10 characters per second
                @display("p=100,100");
        }
        enterProducer: <default("ActivePacketSource")> like IActivePacketSource {
            parameters:
                packetLength = 1B;
                packetData = 13; // Enter character
                productionInterval = 0.1s;
                @display("p=300,100");
        }
        emptyProducer: <default("EmptyPacketSource")> like IActivePacketSource {
            parameters:
                @display("p=500,100");
        }
        scheduler: <default("MarkovScheduler")> like IPacketScheduler {
            parameters:
                transitionProbabilities = "0 1 0 0 0 1 1 0 0"; // Character -> enter -> wait -> character
                waitIntervals = "uniform(0,3) 0 uniform(10,30)";
                @display("p=300,200");
        }
        consumer: <default("PassivePacketSink")> like IPassivePacketSink {
            parameters:
                @display("p=100,200");
        }
        io: TcpClientSocketIo {
            parameters:
                @display("p=200,300");
        }
    connections:
        characterProducer.out --> scheduler.in++;
        enterProducer.out --> scheduler.in++;
        emptyProducer.out --> scheduler.in++;
        scheduler.out --> { @display("m=s"); } --> io.trafficIn;
        io.trafficOut --> { @display("m=s"); } --> consumer.in;
        io.socketOut --> { @display("m=s"); } --> socketOut;
        socketIn --> { @display("m=s"); } --> io.socketIn;
}
