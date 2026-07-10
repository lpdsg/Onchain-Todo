## 1. 我使用的 Prompt

请帮我生成一个适合 Solidity 初学者的最小 Onchain Todo 合约。

要求：
1. 使用 Solidity 0.8.x。
2. 每个钱包地址只能查看和操作自己的 Todo。
3. 每条 Todo 包含：
   - text：任务内容
   - isCompleted：是否完成
   - createdAt：创建时间
4. 提供以下函数：
   - createTodo：创建 Todo
   - completeTodo：完成指定 Todo
   - getMyTodos：查询当前地址的所有 Todo
5. 创建和完成 Todo 时分别触发事件。
6. completeTodo 需要检查 Todo 下标是否存在。
7. 不需要管理员、Token、收费、删除和修改功能。
8. 代码尽量简单，变量和函数命名清晰。
9. 请输出完整合约代码，并解释合约结构和每个函数的作用。
10. 请提醒我哪些地方需要人工检查，不要假设 AI 生成的代码一定正确。


## 2. AI 生成的主要输出

AI 根据 Prompt 生成了一个最小版 Onchain Todo 智能合约，主要包括：

- 使用 `Todo` 结构体保存任务内容、完成状态和创建时间。
- 使用 `mapping(address => Todo[])` 为每个钱包地址分别保存 Todo。
- 提供 `createTodo` 函数创建任务。
- 提供 `completeTodo` 函数完成指定任务。
- 提供 `getMyTodos` 函数查询当前钱包地址的全部 Todo。
- 创建任务时触发 `TodoCreated` 事件。
- 完成任务时触发 `TodoCompleted` 事件。
- 使用 `require` 检查 Todo 下标是否存在。
- 没有加入管理员、Token、收费、删除、修改等额外功能。

## 3. 合约源码

```solidity
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
```

## 4. 我做过的人工修改或判断说明

这次没有对 AI 生成的核心代码做大幅修改，主要进行了以下人工判断和验证：
1. 我确认合约只保留了创建、完成和查询 Todo 的最小功能，没有加入管理员、Token、收费、删除或修改等复杂逻辑。
2. 我检查了 `mapping(address => Todo[])` 的设计，判断它可以让不同钱包地址分别保存自己的 Todo。
3. 我在 Remix 中实际编译合约，确认代码可以成功编译，没有出现语法错误或类型错误。
4. 我部署合约并测试了 `createTodo`、`completeTodo` 和 `getMyTodos`，确认函数行为符合预期。
5. 我输入不存在的 Todo 下标 `99`，确认交易会 revert，说明边界检查有效。
6. 我切换不同测试账户，确认 Account 2 无法看到 Account 1 的 Todo，数据隔离符合预期。
7. 我保留了 `private userTodos`、事件和 `require` 检查，因为这些设计简单、必要，而且便于后续查询和调试。

## 5. AI 生成代码需要人工检查的地方

1. **检查合约是否能够编译**

   AI 生成的 Solidity 代码可能存在语法错误、版本不兼容或类型错误，因此不能只看代码表面，需要在 Remix 中实际编译。本次合约已经成功编译。

2. **检查函数是否符合预期**

   需要实际测试 `createTodo`、`completeTodo` 和 `getMyTodos`，确认创建、完成和查询功能都能正确运行。本次测试中，Todo 可以成功创建，完成状态可以从 `false` 变成 `true`。

3. **检查权限和数据隔离**

   需要确认一个钱包地址不能修改或查看其他地址的 Todo。本次通过切换 Account 1 和 Account 2 进行测试，确认两个账户的数据相互隔离。

4. **检查数组下标和异常输入**

   `completeTodo` 接收 Todo 下标，如果不检查下标，可能发生数组越界。本次输入不存在的下标 `99` 后交易发生 revert，说明 `require` 检查有效。

5. **检查是否存在不必要的复杂逻辑**

   AI 有时会加入管理员、权限库、Token、收费或删除逻辑。本次合约只保留创建、完成和查询功能，符合最小合约要求。

6. **检查变量和函数命名是否清晰**

   本次使用了 `Todo`、`userTodos`、`createTodo`、`completeTodo` 和 `getMyTodos` 等名称，能够直接表达用途，适合初学者阅读。

7. **检查潜在的 Gas 和数据规模问题**

   `getMyTodos` 会一次返回当前用户的全部 Todo。如果某个用户创建大量 Todo，读取的数据量和 Gas 可能增加。对于本次最小练习可以接受，但真实项目中需要考虑分页查询。


