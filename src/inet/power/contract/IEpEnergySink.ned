//
// Copyright (C) 2020 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.power.contract;

//
// This interface extends the corresponding energy model interface. It requires
// implementations to describe energy consumption and energy generation with
// power [W] and storage capacity with energy [J]. The abbreviation Ep is used
// for energy and power based interfaces.
//
// @see ~IEpEnergyConsumer, ~IEpEnergySource, ~IEpEnergyGenerator, ~IEpEnergyStorage, ~IEpEnergyManagement
//
moduleinterface IEpEnergySink extends IEnergySink
{
    parameters:
        @display("i=block/plug");
        @signal[powerGenerationChanged](type=double);
}

