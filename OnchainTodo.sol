// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OnchainTodo {
    struct Todo {
        string text;
        bool isCompleted;
        uint256 createdAt;
    }

    mapping(address => Todo[]) private userTodos;

    event TodoCreated(
        address indexed user,
        uint256 indexed todoId,
        string text
    );

    event TodoCompleted(
        address indexed user,
        uint256 indexed todoId
    );

    function createTodo(string calldata _text) external {
        userTodos[msg.sender].push(
            Todo({
                text: _text,
                isCompleted: false,
                createdAt: block.timestamp
            })
        );

        uint256 todoId = userTodos[msg.sender].length - 1;

        emit TodoCreated(msg.sender, todoId, _text);
    }

    function completeTodo(uint256 _todoId) external {
        require(
            _todoId < userTodos[msg.sender].length,
            "Todo does not exist"
        );

        userTodos[msg.sender][_todoId].isCompleted = true;

        emit TodoCompleted(msg.sender, _todoId);
    }

    function getMyTodos() external view returns (Todo[] memory) {
        return userTodos[msg.sender];
    }
}
