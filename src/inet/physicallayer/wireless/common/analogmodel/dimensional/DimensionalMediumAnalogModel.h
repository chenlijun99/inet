//
// Copyright (C) 2013 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


#ifndef __INET_DIMENSIONALMEDIUMANALOGMODEL_H
#define __INET_DIMENSIONALMEDIUMANALOGMODEL_H

#include "inet/physicallayer/wireless/common/base/packetlevel/DimensionalAnalogModelBase.h"

namespace inet {

namespace physicallayer {

class INET_API DimensionalMediumAnalogModel : public DimensionalAnalogModelBase
{
  public:
    virtual std::ostream& printToStream(std::ostream& stream, int level, int evFlags = 0) const override;

    virtual const IReception *computeReception(const IRadio *radio, const ITransmission *transmission, const IArrival *arrival) const override;
};

} // namespace physicallayer

} // namespace inet

#endif

