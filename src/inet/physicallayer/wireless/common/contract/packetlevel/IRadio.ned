//
// Copyright (C) 2013 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.physicallayer.wireless.common.contract.packetlevel;

//
// Module interface for radio modules. Radio modules deal with the transmission of
// frames over a wireless medium (the radio medium).
//
// <b>Transmission</b>
//
// Upper layers (wireless L2 protocols) can send frames to the radio module.
// Frames will be encapsulated into `WirelessSignal` messages and distributed to
// other network nodes within communication range.
//
// The global ~IRadioMedium module keeps track of node positions, and knows
// which nodes are within communication and interference distance of others
// (neighbour cache). When transmitting, the radio module obtains the neighbour
// list, and sends a copy of the `WirelessSignal` to each neighbour.
//
//
// <b>Reception</b>
//
// Received `WirelessSignal` messages get delivered to the `radioIn` gate of the radio
// module. If they were found to have been received correctly, they get decapsulated
// and the frame is sent to the upper layer.
//
// Note: currently, the packet is also sent up if it was NOT received correctly,
// with its error flag set to true.
//
moduleinterface IRadio extends IPhysicalLayer
{
    parameters:
        @display("i=block/wrxtx");
        @signal[radioModeChanged](type=long);    // Type=inet::physicallayer::RadioMode
        @signal[listeningChanged](type=long);    //TODO always emit 0
        @signal[receptionStateChanged](type=long);    // Type=inet::physicallayer::ReceptionState
        @signal[transmissionStateChanged](type=long);    // Type=inet::physicallayer::TransmissionState
        @signal[radioChannelChanged](type=long);    // The long is the new channel number
        @signal[receivedSignalPartChanged](type=long);    // Type=IRadioSignal::SignalPart
        @signal[transmittedSignalPartChanged](type=long);    // Type=IRadioSignal::SignalPart
        @signal[transmissionStarted](type=cObject);     // Type=ITransmission
        @signal[transmissionEnded](type=cObject);     // Type=ITransmission
        @signal[receptionStarted](type=cObject);     // Type=IReception
        @signal[receptionEnded](type=cObject);     // Type=IReception
    gates:
        input radioIn @labels(IWirelessSignal);
}

