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
