//
// SPDX-License-Identifier: LGPL-3.0-or-later
//
//***************************************************************************
//* file:        MoBanCoordinator.ned
//*
//* author:      Majid Nabi <m.nabi@tue.nl>
//*
//*              http://www.es.ele.tue.nl/nes
//*
//*
//* copyright:   (C) 2010 Electronic Systems group(ES),
//*              Eindhoven University of Technology (TU/e), the Netherlands.
//*
//*
//***************************************************************************
//* part of:    MoBAN (Mobility Model for wireless Body Area Networks)
//* description:     Coordinator module of the MoBAN mobility model
//***************************************************************************
//* Citation of the following publication is appreciated if you use MoBAN for
//* a publication of your own.
//*
//* M. Nabi, M. Geilen, T. Basten. MoBAN: A Configurable Mobility Model for Wireless Body Area Networks.
//* In Proc. of the 4th Int'l Conf. on Simulation Tools and Techniques, SIMUTools 2011, Barcelona, Spain, 2011.
//*
//* BibTeX:
//*    @inproceedings{MoBAN,
//*     author = "M. Nabi and M. Geilen and T. Basten.",
//*     title = "{MoBAN}: A Configurable Mobility Model for Wireless Body Area Networks.",
//*        booktitle = "Proceedings of the 4th Int'l Conf. on Simulation Tools and Techniques.",
//*        series = {SIMUTools '11},
//*        isbn = {978-963-9799-41-7},
//*    year = {2011},
//*        location = {Barcelona, Spain},
//*    publisher = {ICST} }
//*
//**************************************************************************/

package inet.mobility.group;

import inet.mobility.base.MovingMobilityBase;

// This is the coordinator module of the MoBAN mobility model. It should be instantiated in the top level simulation network in MiXiM, once per WBAN.
// The coordinator module is the main module that provides the group mobility and correlation between nodes in a WBAN.
// In the initialization phase, it reads three user-defined input files which are the posture specification file, a configuration file which includes all
// required parameters for specific distributions, and the previously logged mobility pattern if it is requested to use a logged pattern.
// Note that all WBAN instances may use the same input files if they are exactly in the same situation.
//
// After the initialization phase, the MoBAN coordinator decides about the posture and the position of the logical center of the group (WBAN).
// The absolute position of the reference point of each belonging node is calculated by adding the current position of the logical center
// to the reference point of that node in the selected posture. The coordinator publishes the position of the reference point as well as
// the speed and the radius of the local movement of nodes.
simple MoBanCoordinator extends MovingMobilityBase
{
    parameters:
        xml postureSpecFile;        // The input file that includes the specification of all postures
        xml configFile;             // The configuration file for setting probability vectors, distributions, and correlations
        bool useMobilityPattern;    // Set if the logged mobility pattern is used.
        string mobilityPatternFile; // The input file for the mobility pattern if it is going to be used.
        @class(MoBanCoordinator);
}
