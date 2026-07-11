# Onchain Todo

这是一个部署在 Monad Testnet 上的最小 Solidity Todo 合约。

## 1. 合约功能

该合约允许每个钱包地址：

- 创建自己的 Todo
- 将指定 Todo 标记为已完成
- 查询自己的全部 Todo

不同钱包地址的数据相互隔离。

## 2. 合约结构

每条 Todo 包含：

- `text`：任务内容
- `isCompleted`：是否完成
- `createdAt`：创建时间

主要函数：

- `createTodo(string _text)`：创建新的 Todo
- `completeTodo(uint256 _todoId)`：完成指定 Todo
- `getMyTodos()`：查询当前钱包地址的全部 Todo

## 3. 部署信息

网络：

```text
Monad Testnet
Chain ID：

10143

合约地址：

0xDFd642Cef34c954C34c5A10a6E21c7533334cd49

部署交易 hash：

0x9dfca35ba0ac11dd368382c2fd82f9fef4756182c2b6975a15c92266448ab226
```

## 4. 部署步骤
在 Remix 中打开 OnchainTodo.sol
使用 Solidity 0.8.x 编译合约
在 Deploy & Run Transactions 中选择 Browser Extension / MetaMask
将钱包网络切换到 Monad Testnet
确认课程专用钱包中有测试 MON
点击 Deploy
在 MetaMask 中确认交易
部署成功后记录合约地址和部署交易 hash

## 5. 合约交互
Write Function

```调用函数：

createTodo("部署到 Monad Testnet")

交互交易 hash：

0x3ae255cfdbf2b9a84977d203837799d093ea5d145c90c77a943f715c66352f61
Read Function

调用函数：

getMyTodos()

返回结果：

部署到 Monad Testnet, false, 1783761015

含义：

Todo 内容：部署到 Monad Testnet
完成状态：false
创建时间戳：1783761015
```

## 6. 完整链路
合约源码
→ Remix 编译
→ MetaMask 连接 Monad Testnet
→ 部署合约
→ 获得合约地址
→ 调用 write function
→ 调用 read function
→ 在区块浏览器中验证交易

## 7. 安全说明

本项目使用课程专用钱包和 Monad Testnet 测试资产。

仓库中未提交：

私钥
助记词
API Key
Access Token
.env 文件
真实资产相关敏感信息
