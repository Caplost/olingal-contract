// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title Pool events
/// @notice Events emitted by the pool
interface IOlingalPoolEvents {

    /// @notice Emitted when the pool is initialized
    /// @param sqrtPriceX96 The initial sqrt price of the pool
    /// @param tick The initial tick of the pool
    event Initialize(uint160 sqrtPriceX96, int24 tick);

    /// @notice Emitted when liquidity is minted
    /// @param sender The sender of the transaction
    /// @param owner The owner of the liquidity
    /// @param tickLower The lower tick of the liquidity
    /// @param tickUpper The upper tick of the liquidity
    /// @param amount The amount of liquidity minted
    /// @param amount0 The amount of token0 minted
    /// @param amount1 The amount of token1 minted
    event Mint(address sender, address indexed owner, int24 indexed tickLower, int24 indexed tickUpper, uint128 amount, uint256 amount0, uint256 amount1);

    /// @notice Emitted when liquidity is burned
    /// @param owner The owner of the liquidity
    /// @param tickLower The lower tick of the liquidity
    /// @param tickUpper The upper tick of the liquidity
    /// @param amount The amount of liquidity burned
    /// @param amount0 The amount of token0 burned
    /// @param amount1 The amount of token1 burned
    event Burn(address indexed owner, int24 indexed tickLower, int24 indexed tickUpper, uint128 amount, uint256 amount0, uint256 amount1);

    /// @notice Emitted when a swap occurs
    /// @param sender The sender of the transaction
    /// @param recipient The recipient of the swap
    /// @param amount0 The amount of token0 swapped
    /// @param amount1 The amount of token1 swapped
    /// @param sqrtPriceX96 The sqrt price of the pool after the swap
    /// @param liquidity The liquidity of the pool after the swap
    /// @param tick The tick of the pool after the swap
    event Swap(address indexed sender, address indexed recipient, int256 amount0, int256 amount1, uint160 sqrtPriceX96, uint128 liquidity, int24 tick);

    /// @notice Emitted when a flash loan occurs
    /// @param sender The sender of the transaction
    /// @param recipient The recipient of the flash loan
    /// @param amount0 The amount of token0 borrowed
    /// @param amount1 The amount of token1 borrowed
    /// @param paid0 The amount of token0 paid
    /// @param paid1 The amount of token1 paid
    /// @param sqrtPriceX96 The sqrt price of the pool after the flash loan
    /// @param liquidity The liquidity of the pool after the flash loan
    /// @param tick The tick of the pool after the flash loan
    event Flash(address indexed sender, address indexed recipient, uint256 amount0, uint256 amount1, uint256 paid0, uint256 paid1, uint160 sqrtPriceX96, uint128 liquidity, int24 tick);


}