//
// Copyright (C) 2013 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.physicallayer.wireless.common.base.packetlevel;

import inet.physicallayer.wireless.common.contract.packetlevel.IReceiverAnalogModel;

// KLUDGE TODO delete this after wireless refactor is complete
module DummyReceiverAnalogModel like IReceiverAnalogModel
{
}

module ReceiverBase
{
    parameters:
        @display("i=block/tx");
    submodules:
        analogModel: <default("DummyReceiverAnalogModel")> like IReceiverAnalogModel if typename != "" {
            @display("p=100,100");
        }
}
