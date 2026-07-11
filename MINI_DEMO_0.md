# Week 1 Mini Demo 0｜作品总结与方向选择

## 1. Week 1 作品

本周完成了一个部署在 Monad Testnet 上的最小 Solidity 智能合约：

**Onchain Todo**

该合约允许每个钱包地址：

- 创建自己的 Todo；
- 将指定 Todo 标记为已完成；
- 查询自己的全部 Todo；
- 保持不同钱包地址之间的数据相互隔离。

项目 README：

[[查看 Onchain Todo 项目说明](./README.md)
](https://github.com/lpdsg/Onchain-Todo/blob/main/README.md)
---

## 2. 已完成的真实链上操作

本项目已完成以下实际操作：

1. 使用 Solidity 0.8.x 编写 Onchain Todo 合约；
2. 使用 Remix 编译合约；
3. 使用 MetaMask 连接 Monad Testnet；
4. 将合约部署到 Monad Testnet；
5. 调用 `createTodo` 创建一条链上 Todo；
6. 调用 `getMyTodos` 查询 Todo；
7. 记录合约地址和交易 Hash；
8. 在区块浏览器中验证链上交易。

### 部署信息

- 网络：Monad Testnet
- Chain ID：10143
- 合约地址：

```text
0xDFd642Cef34c954C34c5A10a6E21c7533334cd49
```
- 部署交易 Hash：

```text
0x9dfca35ba0ac11dd368382c2fd82f9fef4756182c2b6975a15c92266448ab226
```

- createTodo 交互交易 Hash：

```text
0x3ae255cfdbf2b9a84977d203837799d093ea5d145c90c77a943f715c66352f61
```

---
## 3. 哪部分由 AI 辅助完成

AI 主要辅助完成了：

根据需求生成最小 Solidity 合约初稿；
解释合约中的 struct、mapping、msg.sender、require 和 event；
梳理 Remix 编译、部署和交互步骤；
协助整理 README 和提交材料；
提供 Monad 高频交互 Demo 的方向建议。

AI 只作为辅助工具，最终部署、钱包确认、交易执行和结果检查均由我本人完成。

---
## 4. 我做出的人工判断和修改

在 AI 生成内容的基础上，我进行了以下人工检查和判断：

检查 Solidity 编译器版本是否与代码兼容；
检查 msg.sender 是否能够隔离不同用户的数据；
检查 completeTodo 是否包含 Todo 下标越界判断；
确认写入函数会产生链上交易，而读取函数不会修改链上状态；
使用课程专用钱包和测试网资产进行操作；
检查仓库中未包含私钥、助记词、API Key、Token 或 .env 文件；
实际调用合约函数并核对返回结果。

---
## 5. Week 2 方向选择

我选择的 Week 2 主方向是：

Tech

我希望继续学习智能合约、DApp、链上交互和 Web3 数据产品开发。

---
## 6. Week 2 计划推进的作品

下一阶段计划开发：

Monad 链上每日打卡与连续签到排行榜

计划包含以下功能：

连接 MetaMask 钱包；
每日链上打卡；
防止同一钱包当天重复打卡；
记录累计打卡次数；
记录连续打卡天数；
用户积分系统；
用户排行榜；
显示交易状态、交易 Hash 和区块浏览器链接。

---
## 7. 一句话说明作品如何继续迭代

Week 2 将在当前智能合约部署经验基础上，开发一个部署于 Monad Testnet 的链上每日打卡 Demo，并逐步增加连续签到、积分、排行榜和前端钱包交互功能。

## 8. Week 2 想继续推进的问题
如何在 Solidity 中限制同一个钱包每天只能打卡一次？
如何正确计算用户连续打卡天数？
积分和排行榜数据应该全部存储在链上，还是使用链上事件进行链下统计？
如何制作一个能够连接 MetaMask 并调用合约的简单前端？
如何在前端展示交易处理中、交易成功和交易失败等状态？
如何控制合约的 Gas 消耗并避免不必要的链上存储？

## 9. 安全说明

本项目使用课程专用钱包和 Monad Testnet 测试资产。

公开材料中不包含：
```text
私钥；
助记词；
API Key；
Access Token；
.env 文件；
真实资产相关敏感信息。
```
