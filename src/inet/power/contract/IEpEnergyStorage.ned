//
// Copyright (C) 2020 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.power.contract;

//
// This interface extends the corresponding energy model interface. It requires
// implementations to describe energy consumption and energy generation with
// power [W] and storage capacity with energy [J]. The Ep is an abbreviation
// that is used for energy and power-based interfaces.
//
// @see ~IEpEnergyConsumer, ~IEpEnergySource, ~IEpEnergyGenerator, ~IEpEnergySink, ~IEpEnergyManagement
//
moduleinterface IEpEnergyStorage extends IEpEnergySource, IEpEnergySink, IEnergyStorage
{
    parameters:
        @display("i=block/plug");
        @signal[residualEnergyCapacityChanged](type=double);
}

