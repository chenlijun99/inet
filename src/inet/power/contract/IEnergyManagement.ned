//
// Copyright (C) 2020 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.power.contract;

//
// The energy management models monitor an energy storage, estimate its state,
// and control the consumers and generators to protect the energy storage from
// operating outside its safe operating area.
//
// @see ~IEnergyConsumer, ~IEnergySource, ~IEnergyGenerator, ~IEnergySink, ~IEnergyStorage
//
moduleinterface IEnergyManagement
{
    parameters:
        @display("i=block/plug");
}

