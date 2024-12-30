// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

import "./pool/IOlingalPoolState.sol";
import "./pool/IOlingalPoolImmutable.sol";
import "./pool/IOlingalPoolActions.sol";
import "./pool/IOlingalPoolEvents.sol";
import "./pool/IOlingalPoolDerivedState.sol";
import "./pool/IOlingalPoolOwnerAction.sol";
interface IOlingalPool is 
    IOlingalPoolState, 
    IOlingalPoolImmutable, 
    IOlingalPoolActions, 
    IOlingalPoolOwnerAction,
    IOlingalPoolEvents, 
    IOlingalPoolDerivedState
 {


}