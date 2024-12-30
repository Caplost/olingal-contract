// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

interface IOlingalPoolImmutable {

    /// @notice The factory that created the pool,must be immutable,and must address of the factory
    /// @return factory The factory address
    function factory() external view returns (address);

    /// @notice Returns the token0 address
    /// @return token0 The token0 address
    function token0() external view returns (address);

    /// @notice Returns the token1 address
    /// @return token1 The token1 address
    function token1() external view returns (address);

    /// @notice Returns the fee
    /// @return fee The fee
    function fee() external view returns (uint256);

    /// @notice Returns the tick spacing
    /// @return tickSpacing The tick spacing
    function tickSpacing() external view returns (int24);

    /// @notice Returns the maximum liquidity per tick
    /// @return maxLiquidityPerTick The maximum liquidity per tick
    function maxLiquidityPerTick() external view returns (uint128);

}