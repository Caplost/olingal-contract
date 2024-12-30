// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

import "./NoDelegateCall.sol";
import "./interfaces/IOlingalFactory.sol";
import "./interfaces/IOlingalPoolDeployer.sol";

contract OlingalFactory is IOlingalFactory, OlingalPoolDeployer, NoDelegateCall {
    address public override owner;

    mapping(uint24 => int24) public override feeAmountTickSpacing;

    mapping(address => mapping(address => mapping(uint256 => address))) public override getPool;

    constructor() {
        owner = msg.sender;
        emit OwnerChanged(address(0), msg.sender);
        feeAmountTickSpacing[500] = 10;
        feeAmountTickSpacing[3000] = 200;
        feeAmountTickSpacing[10000] = 500;
    }

    function createPool(address token0, address token1, uint256 fee) external override noDelegateCall returns (address pool) {
        require(token0 != token1, "Olingal: identical tokens");
        (address token0_, address token1_) = token0 < token1 ? (token0, token1) : (token1, token0);
        require(token0_ != address(0) && token1_ != address(0), "Olingal: zero address");
        //get tickSpacing saved in feeAmountTickSpacing for save gas
        int24 tickSpacing = feeAmountTickSpacing[uint24(fee)];
        require(tickSpacing != 0, "Olingal: invalid fee");
        require(getPool[token0_][token1_][fee] == address(0), "Olingal: pool already exists");
        // @TODO: check tickSpacing is valid
        pool = deploy(token0_, token1_, fee, tickSpacing);
        getPool[token0_][token1_][fee] = pool;
         // populate mapping in the reverse direction, deliberate choice to avoid the cost of comparing addresses
        getPool[token1_][token0_][fee] = pool;
        emit PoolCreated(token0_, token1_, fee, tickSpacing, pool);
    }

    function setOwner(address newOwner) external override {
        require(msg.sender == owner, "Olingal: only owner");
        emit OwnerChanged(owner, newOwner);
        owner = newOwner;
    }

    function enableFeeAmount(uint24 fee, int24 tickSpacing) external override {
        require(msg.sender == owner, "Olingal: only owner");
        require(fee < 1000000, "Olingal: fee too high");
        require(tickSpacing > 0 && tickSpacing <16384, "Olingal: tick spacing too low");
        require(feeAmountTickSpacing[fee] == 0, "Olingal: fee already enabled");
        feeAmountTickSpacing[fee] = tickSpacing;
        emit FeeAmountEnabled(fee, tickSpacing);
    }



    
}