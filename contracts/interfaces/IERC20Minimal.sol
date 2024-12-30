// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

interface IERC20Minimal {

    /// @notice Emitted when tokens are transferred from one address to another
    /// @param from The address of the sender
    /// @param to The address of the receiver
    /// @param value The amount of tokens transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    /// @notice Emitted when an allowance is set for a spender
    /// @param owner The address of the owner
    /// @param spender The address of the spender
    /// @param value The amount of tokens approved
    event Approval(address indexed owner, address indexed spender, uint256 value);
    /// @notice Returns the balance of the specified account
    /// @param account The address of the account
    /// @return The balance of the account
    function balanceOf(address account) external view returns (uint256);

    /// @notice Transfers the specified amount of tokens to the specified address
    /// @param to The address to transfer the tokens to
    /// @param amount The amount of tokens to transfer
    /// @return True if the transfer is successful, false otherwise
    function transfer(address to, uint256 amount) external returns (bool);

    /// @notice Returns the allowance of the specified spender for the specified owner
    /// @param owner The address of the owner
    /// @param spender The address of the spender
    /// @return The allowance of the spender for the owner
    function allowance(address owner, address spender) external view returns (uint256);

    /// @notice Approves the specified spender to spend the specified amount of tokens on behalf of the caller
    /// @param spender The address of the spender
    /// @param amount The amount of tokens to approve
    /// @return True if the approval is successful, false otherwise
    function approve(address spender, uint256 amount) external returns (bool);

    /// @notice Transfers the specified amount of tokens from the specified address to the specified address
    /// @param from The address to transfer the tokens from
    /// @param to The address to transfer the tokens to
    /// @param amount The amount of tokens to transfer
    /// @return True if the transfer is successful, false otherwise
    function transferFrom(address from, address to, uint256 amount) external returns (bool);


}