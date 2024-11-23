// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * Errors
 */
error Raffle__NotEnoughETH();
error Raffle__NotEnoughTimeHasPassed();

/**
 * @title Raffle
 * @author Nikolay P. Ivanov
 * @notice This contract is for creating a raffle.
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    uint256 private immutable i_entranceFee;
    /**
     * @dev The interval between raffles in seconds
     */
    uint256 private immutable i_interval;

    address payable[] private s_players;
    uint256 private s_lastTimestamp;

    /* Events */
    event RaffleEnter(address indexed player);

    constructor(uint256 _entranceFee, uint256 interval) {
        i_entranceFee = _entranceFee;
        i_interval = interval;

        s_lastTimestamp = block.timestamp;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) revert Raffle__NotEnoughETH();

        s_players.push(payable(msg.sender));

        emit RaffleEnter(msg.sender);
    }

    // 1. Get random number
    // 2. Use random number to pick a player
    // 3. Be automatically called
    function pickWinner() public {
        // Check the interval
        if (block.timestamp - s_lastTimestamp > i_interval) revert Raffle__NotEnoughTimeHasPassed();

        // Get random number

        s_lastTimestamp = block.timestamp;
    }

    /**
     * Getters
     */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
