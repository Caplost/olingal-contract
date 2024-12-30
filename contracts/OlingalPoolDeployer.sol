// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

import "./interfaces/IOlingalPoolDeployer.sol";
import "./OlingalPool.sol";

contract OlingalPoolDeployer is IOlingalPoolDeployer {

    struct Parameters {
        address factory;
        address token0;
        address token1;
        uint256 fee;
        int24 tickSpacing;
    }

    Parameters public override parameters;

    function deploy(address factory, address token0, address token1, uint256 fee, int24 tickSpacing) internal returns (address pool) {
        parameters = Parameters({
            factory: factory,
            token0: token0,
            token1: token1,
            fee: fee,
            tickSpacing: tickSpacing
        });
        // @TODO: check tickSpacing is valid
        pool = address(new OlingalPool(factory, token0, token1, fee, tickSpacing));
        delete parameters;  
    }
}