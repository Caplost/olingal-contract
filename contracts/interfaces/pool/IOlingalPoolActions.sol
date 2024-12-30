// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title IOlingalPoolActions Permissions for pool actions
/// @notice Interface for the actions that can be performed on a pool
interface IOlingalPoolActions {
    /// @notice Sets the initial price for the pool
    /// @dev Price is represented as a sqrt price X96 Q64.96 value
    /// @param sqrtPriceX96 The initial price for the pool
    function initialize(uint160 sqrtPriceX96) external;

    /// @notice Adds liquidity to the pool for the given recipient/tickLower/tickUpper position  
    /// @param recipient The address of the recipient of the liquidity
    /// @param tickLower The lower tick of the position
    /// @param tickUpper The upper tick of the position
    /// @param liquidity The amount of liquidity to add
    /// @param data Any data passed through by the caller
    /// @return amount0 The amount of token0 added
    /// @return amount1 The amount of token1 added
    function mint(
        address recipient,
        int256 tickLower,
        int256 tickUpper,
        uint128 liquidity,
        bytes calldata data 
    ) external returns (uint256 amount0, uint256 amount1);


    /// @notice Collects tokens owed to a position
    /// @param recipient The address of the recipient of the tokens
    /// @param tickLower The lower tick of the position
    /// @param tickUpper The upper tick of the position
    /// @param amount0Requested The maximum amount of token0 to collect
    /// @param amount1Requested The maximum amount of token1 to collect
    /// @return amount0 The amount of token0 collected
    /// @return amount1 The amount of token1 collected
    function collect(
        address recipient,
        int24 tickLower,
        int24 tickUpper,
        uint128 amount0Requested,
        uint128 amount1Requested
    )external returns (uint128 amount0, uint128 amount1);

    /// @notice Burns liquidity from a position
    /// @param tickLower The lower tick of the position
    /// @param tickUpper The upper tick of the position
    /// @param liquidity The amount of liquidity to burn
    /// @return amount0 The amount of token0 burned
    /// @return amount1 The amount of token1 burned
    function burn(
        int24 tickLower,
        int24 tickUpper,
        uint128 liquidity
    ) external returns(uint256 amount0,uint256 amount1);

    /// @notice Swap tokens between the pool  
    /// @param recipient The address of the recipient of the tokens
    /// @param zeroForOne Whether the swap is for token0 to token1
    /// @param amountSpecified The amount of tokens to swap
    /// @param sqrtPriceLimitX96 The limit price for the swap
    /// @param data Any data passed through by the caller
    /// @return amount0 The amount of token0 swapped
    /// @return amount1 The amount of token1 swapped
    function swap(
        address recipient,
        bool zeroForOne,
        int256 amountSpecified,
        uint160 sqrtPriceLimitX96,
        bytes calldata data
    ) external returns (int256 amount0, int256 amount1);


    /// @notice Flash loan to the pool
    /// @param recipient The address of the recipient of the flash loan
    /// @param amount0 The amount of token0 to borrow
    /// @param amount1 The amount of token1 to borrow
    /// @param data Any data passed through by the caller
    function flash(address recipient, uint256 amount0, uint256 amount1, bytes calldata data) external;


    /// @notice Increases the observation cardinality for the next observation
    /// @param observationCardinalityNext The next observation cardinality
    function increaseObservationCardinalityNext(uint16 observationCardinalityNext) external;


        



}
