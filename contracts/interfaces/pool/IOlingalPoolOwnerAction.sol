// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title Pool owner actions
/// @notice Contains actions that can only be performed by the pool owner
interface IOlingalPoolOwnerAction {

    /// @notice Sets the fee protocol
    /// @param feeProtocol0 The fee protocol for token0
    /// @param feeProtocol1 The fee protocol for token1 
    function setFeeProtocol(uint8 feeProtocol0, uint8 feeProtocol1) external;

    /// @notice Collects protocol fees
    /// @param recipient The recipient of the fees
    /// @param amount0Requested The amount of token0 requested
    /// @param amount1Requested The amount of token1 requested
    /// @return amount0 The amount of token0 collected
    /// @return amount1 The amount of token1 collected
    function collectProtocol(
        address recipient,
        uint128 amount0Requested,
        uint128 amount1Requested    
    )external returns (uint128 amount0, uint128 amount1);

}