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

