// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

interface IOlingalFactory {

    /// @notice Emitted when a pool is created
    /// @param pool The address of the pool
    /// @param token0 The address of the first token
    /// @param token1 The address of the second token
    /// @param fee The fee of the pool
    /// @param tickSpacing The tick spacing of the pool
    event PoolCreated(address indexed pool, address token0, address token1, uint256 fee, int24 tickSpacing);

    /// @notice Emitted when a fee amount is enabled
    /// @param fee The fee of the pool
    /// @param tickSpacing The tick spacing of the pool
    event FeeAmountEnabled(uint24 indexed fee, int24 indexed tickSpacing);


    event OwnerChanged(address indexed previousOwner, address indexed newOwner);

    /// @notice Returns the owner of the factory
    /// @return The address of the owner
    function owner() external view returns (address);

    /// @notice Returns the tick spacing for a given fee
    /// @param fee The fee of the pool
    /// @return The tick spacing of the pool
    function feeAmountTickSpacing(uint24 fee) external view returns (int24);

    /// @notice Returns the address of a pool for a given pair of tokens and fee
    /// @param token0 The address of the first token
    /// @param token1 The address of the second token
    /// @param fee The fee of the pool
    /// @return pool The address of the pool
    function getPool(address token0, address token1, uint256 fee) external view returns (address pool);

    /// @notice Creates a pool for a given pair of tokens and fee
    /// @param token0 The address of the first token
    /// @param token1 The address of the second token
    /// @param fee The fee of the pool
    /// @return pool The address of the pool
    function createPool(address token0, address token1, uint256 fee) external returns (address pool);

    /// @notice Sets the owner of the factory
    /// @param _owner The address of the new owner
    function setOwner(address _owner) external;

    /// @notice Enables a fee amount for a given tick spacing
    /// @param fee The fee of the pool
    /// @param tickSpacing The tick spacing of the pool
    function enableFeeAmount(uint256 fee, int24 tickSpacing) external;

 




}