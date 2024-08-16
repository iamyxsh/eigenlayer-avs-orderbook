// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface IOrderServiceManager {
    enum TaskStatus {
        UNFILLED,
        FILLED
    }

    // EVENTS
    event NewOrderCreated(uint256 indexed orderId, Order order);

    event OrderCompleted(
        uint256 indexed orderId,
        Order order,
        address operator
    );

    // STRUCTS
    struct Order {
        uint256 id;
        uint256 amount;
        uint256 price;
    }

    // FUNCTIONS
    // NOTE: this function creates new task.
    function createOrder(uint256 amount, uint256 price) external;

    // NOTE: this function is called by operators to respond to a task.
    function respondToOrder(
        Order calldata order,
        uint256 referenceTaskIndex,
        bytes calldata signature
    ) external;
}
