//
// Copyright (C) 2013 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.physicallayer.wireless.common.base.packetlevel;

import inet.physicallayer.wireless.common.contract.packetlevel.ITransmitterAnalogModel;

// KLUDGE TODO delete this after wireless refactor is complete
module DummyTransmitterAnalogModel like ITransmitterAnalogModel
{
}

module TransmitterBase
{
    parameters:
        @display("i=block/tx");
    submodules:
        analogModel: <default("DummyTransmitterAnalogModel")> like ITransmitterAnalogModel if typename != "" {
            @display("p=100,100");
        }
}
