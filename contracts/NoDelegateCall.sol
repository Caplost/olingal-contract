// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

/// @title NoDelegateCall
/// @notice A contract that prevents delegate calls
abstract contract NoDelegateCall {
    /// @notice The address of the implementation
    /// @dev The address of the implementation
    address private immutable _implementation;


    /// @notice The constructor sets the implementation address to the address of the contract
    /// @dev The constructor sets the implementation address to the address of the contract
    constructor() {
        _implementation = address(this);
    }

    function checkNotDelegateCall() private view {
        require(address(this) == _implementation, "Delegate call not allowed");
    }


    /// @notice Prevents delegate calls
    /// @dev Prevents delegate calls
    modifier noDelegateCall() {
        require(address(this) == _implementation, "Delegate call not allowed");
        _;
    }

    function delegateCall(address target, bytes memory data) internal returns (bytes memory) {
        (bool success, bytes memory result) = target.delegatecall(data);
        require(success, "Delegate call failed");
        return result;
    }
}
