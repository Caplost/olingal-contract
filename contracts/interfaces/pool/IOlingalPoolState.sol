// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;


interface IOlingalPoolState {
    /// @notice Returns the current state of the pool
    /// @return sqrtPriceX96 The current price of the pool
    /// @return tick The current tick of the pool
    /// @return observationIndex The index of the current observation
    /// @return observationCardinality The number of observations in the pool
    /// @return observationCardinalityNext The next observation cardinality
    /// @return feeProtocol The fee protocol of the pool
    /// @return unlocked Whether the pool is unlocked
    function slot0() external view returns (uint160 sqrtPriceX96, int24 tick, uint16 observationIndex, uint16 observationCardinality, uint16 observationCardinalityNext, uint8 feeProtocol, bool unlocked);

    /// @notice Returns the fee growth global for token0
    /// @return feeGrowthGlobal0X128 The fee growth global for token0
    function feeGrowthGlobal0X128() external view returns (uint256);

    /// @notice Returns the fee growth global for token1
    /// @return feeGrowthGlobal1X128 The fee growth global for token1
    function feeGrowthGlobal1X128() external view returns (uint256);

    /// @notice Returns the protocol fee
    /// @return protocolFee The protocol fee
    function protocolFee() external view returns (uint16);

    /// @notice Returns the fee growth per liquidity
    /// @param sqrtPriceX96 The sqrt price of the pool
    /// @return feeGrowthPerLiquidityInside0X128 The fee growth per liquidity inside 0
    /// @return feeGrowthPerLiquidityInside1X128 The fee growth per liquidity inside 1
    function getFeeGrowthPerLiquidity(uint160 sqrtPriceX96) external view returns (uint256, uint256);

    /// @notice Returns the liquidity of the pool
    function liquidity() external view returns (uint128);

    /// @notice Returns the tick data
    /// @param tick The tick
    /// @return liquidityGross The gross liquidity
    /// @return liquidityNet The net liquidity
    /// @return feeGrowthOutside0X128 The fee growth outside 0
    /// @return feeGrowthOutside1X128 The fee growth outside 1
    /// @return tickCumulativeOutside The tick cumulative outside
    /// @return secondsPerLiquidityOutsideX128 The seconds per liquidity outside
    /// @return secondsOutside The seconds outside
    /// @return initialized Whether the tick is initialized
    function ticks(int24 tick) external view returns (uint256 liquidityGross, int128 liquidityNet, uint256 feeGrowthOutside0X128, uint256 feeGrowthOutside1X128, int56 tickCumulativeOutside, uint160 secondsPerLiquidityOutsideX128, uint32 secondsOutside, bool initialized);
     
    /// @notice Returns the tick bitmap
    /// @param wordPosition The word position
    /// @return tickBitmap The tick bitmap
    function tickBitmap(int16 wordPosition) external view returns (uint256);
    
    /// @notice Returns the position data
    /// @param key The position key
    /// @return liquidity The liquidity of the position
    /// @return feeGrowthInside0X128 The fee growth inside 0
    /// @return feeGrowthInside1X128 The fee growth inside 1
    /// @return tokensOwed0 The tokens owed 0
    /// @return tokensOwed1 The tokens owed 1
    function positions(bytes32 key) external view returns (
        uint128 liquidity,
        uint256 feeGrowthInside0X128,
        uint256 feeGrowthInside1X128,
        uint128 tokensOwed0,
        uint128 tokensOwed1
    );

    function observations(uint256 index) external view returns (
        uint32 blockTimestamp,
        uint56 tickCumulative,
        uint160 ,
        bool initialized
    );
}