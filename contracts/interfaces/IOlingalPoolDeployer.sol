// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title IOlingalPoolDeployer
/// @notice Interface for the Olingal pool deployer
interface IOlingalPoolDeployer {
    /// @notice Returns the parameters of the pool
    /// @return factory The address of the factory
    /// @return token0 The address of the first token
    /// @return token1 The address of the second token
    /// @return fee The fee of the pool
    /// @return tickSpacing The tick spacing of the pool
    function parameters() external view returns (address factory, address token0, address token1, uint256 fee, int24 tickSpacing);

}