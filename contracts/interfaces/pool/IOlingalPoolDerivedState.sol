// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title Pool state derived from the pool state which is not stored
/// @notice Contains view functions to compute derived state based on the pool state rather than stored on the block chain.
/// the functions here here have variable gas costs.
interface IOlingalPoolDerivedState {
    /// @notice Returns the tick cumulative and seconds per liquidity cumulative
    /// @param secondsAgos The seconds ago
    /// @return tickCumulatives The tick cumulative
    /// @return secondsPerLiquidityCumulatives The seconds per liquidity cumulative
    function observe(uint32[] memory secondsAgos) external view returns (int56[] memory tickCumulatives, uint160[] memory secondsPerLiquidityCumulatives);

    /// @notice Returns the liquidity snapshot, fee growth inside 0 and fee growth inside 1
    /// @param tickLower The lower tick
    /// @param tickUpper The upper tick
    /// @return liquiditySnapshot The liquidity snapshot
    /// @return feeGrowthInside0X128 The fee growth inside 0
    /// @return feeGrowthInside1X128 The fee growth inside 1
    function snapshotCumulativesInside(int24 tickLower, int24 tickUpper) external view returns (uint128 liquiditySnapshot, uint256 feeGrowthInside0X128, uint256 feeGrowthInside1X128);

}
