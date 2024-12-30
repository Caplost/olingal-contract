// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title IOlingalMintCallback
/// @notice Interface for the callback function of the olingalMintCallback #mint must implement this interface
interface IOlingalMintCallback {
    /// @notice Called to `msg.sender` after minting liquidity to the recipient.
    /// @dev In the implementation you must pay the tokens owed for the liquidity.
    /// @param amount0Owed The amount of token0 owed to the pool by the recipient
    /// @param amount1Owed The amount of token1 owed to the pool by the recipient
    /// @param data Any data passed through by the caller
    function olingalMintCallback(uint256 amount0Owed, uint256 amount1Owed, bytes calldata data) external;
}
