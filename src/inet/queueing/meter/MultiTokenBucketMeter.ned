//
// Copyright (C) 2020 OpenSim Ltd.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

package inet.queueing.meter;

import inet.queueing.base.PacketMeterBase;
import inet.queueing.contract.IPacketMeter;

//
// This module labels packets according to the first token bucket that contains
// the required number of tokens. If no such token bucket is found then the
// default label is attached to the packet.
//
simple MultiTokenBucketMeter extends PacketMeterBase like IPacketMeter
{
    parameters:
        object buckets; // array of objects specifying the token buckets, see ~TokenBucketMeter for parameters
        				// example: [{initialNumTokens: 100, maxNumTokens: 1000, tokenProductionRate: 10, label: "green", excessTokenModule: ".other"}]
        double tokenConsumptionPerPacket = default(0); // how many tokens are consumed per packet
        double tokenConsumptionPerBit = default(1); // how many tokens are consumed per bit
        string defaultLabel = default(""); // the label that is attached to packets if there are not enouth tokens in the bucket, no label by default
        object labelPriority = default([]); // the list of labels in the order of priority, if specified packets can only be promoted in this order
        displayStringTextFormat = default("contains %n tk\nmetered %p pk (%l)");
        @signal[tokensChanged](type=double);
        @statistic[tokensChanged](title="tokens changed"; record=vector; interpolationmode=linear);
        @class(MultiTokenBucketMeter);
}