// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Raffle
 * @author Nikolay P. Ivanov
 * @notice This contract is for creating a raffle.
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 _entranceFee) {
        i_entranceFee = _entranceFee;
    }

    function enterRaffle() public payable {}
    function pickWinner() public {}

    /**
     * Getters
     */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
