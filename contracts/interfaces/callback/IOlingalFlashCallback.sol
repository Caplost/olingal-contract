// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title IOlingalFlashCallback
/// @notice Interface for the callback function of the olingalFlashCallback #flash must implement this interface
interface IOlingalFlashCallback {
    /// @notice Called to `msg.sender` after transferring to the recipient.
    /// @dev In the implementation you must pay the tokens owed for the liquidity.
    /// @param fee0 The fee amount in token0
    /// @param fee1 The fee amount in token1
    /// @param data Any data passed through by the caller
    function olingalFlashCallback(uint256 fee0, uint256 fee1, bytes calldata data) external;
}
