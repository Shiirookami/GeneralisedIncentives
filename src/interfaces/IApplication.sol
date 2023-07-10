// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IApplication {
    /// @notice Handles the acknowledgement from the destination
    /// @dev acknowledgement is exactly the output of receiveMessage except if receiveMessage reverted, then it is 0x00.
    /// If an acknowledgement isn't needed, this can be implemented as {}.
    /// This function can be called by someone else again. Ensure that if this endpoint is called twice with the same message nothing bad happens.
    /// @param destinationIdentifier An identifier for the destination chain.
    /// @param acknowledgement The acknowledgement sent back by receiveMessage. Is 0x00 if receiveMessage reverted. 
    function ackMessage(bytes32 destinationIdentifier, bytes calldata acknowledgement) external;

    /// @notice receiveMessage from a cross-chain call.
    /// @dev The application needs to check the fromApplication combined with sourceIdentifierbytes to figure out if the call is authenticated.
    function receiveMessage(bytes32 sourceIdentifierbytes, bytes calldata fromApplication, bytes calldata message) external returns(bytes memory acknowledgement);
}