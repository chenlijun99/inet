//
// Copyright (C) 2020 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.power.storage;

import inet.power.storage.SimpleCcBattery;

simple CcBatteryPack extends SimpleCcBattery
{
   parameters:
     int numberOfCells = default(1); // Number of cells in the battery pack
     string arrangement @enum("serial", "parallel") = default("serial");
     double cellNominalCapacity @unit(C) = default(7200 C); // Typical capacity of an AA battery is 2 Ah = 7200 C
     double cellNominalVoltage @unit(V) = default(1.5 V);
     double cellInternalResistance @unit(Ohm) = default(0.1 Ohm);
     nominalCapacity = default(numberOfCells * cellNominalCapacity); // Cell capacities are added when arranged in parallel
     nominalVoltage = default(arrangement == "serial" ? numberOfCells * cellNominalVoltage : cellNominalVoltage); // Voltage is added when cells are arranged in series
     internalResistance = default(arrangement == "serial" ? numberOfCells * cellInternalResistance : cellInternalResistance / numberOfCells); // Internal resistance is added when cells are arranged in series
}
