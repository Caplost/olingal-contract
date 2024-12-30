// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title IOlingalSwapCallback
/// @notice Interface for the callback function of the olingalSwapCallback #swap must implement this interface
interface IOlingalSwapCallback {
    /// @notice Called to `msg.sender` after executing a swap via IOlingalSwapRouter#swap.
    /// @dev In the implementation you must pay the tokens owed for the swap.
    /// @param amount0Delta The amount of token0 that was sent (negative) or must be received (positive) by the pool by the end of the swap. If positive, the callback must send that amount of token0 to the pool.
    /// @param amount1Delta The amount of token1 that was sent (negative) or must be received (positive) by the pool by the end of the swap. If positive, the callback must send that amount of token1 to the pool.
    /// @param data Any data passed through by the caller via the IOlingalSwapRouter#swap call
    function olingalSwapCallback(int256 amount0Delta, int256 amount1Delta, bytes calldata data) external;
}