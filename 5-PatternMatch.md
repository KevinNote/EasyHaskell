# 5. 模式匹配

模式匹配的用处是：函数的参数有多种可能的形式，调用时自动找到匹配的形式并调用。

举个最简单的例子，例如阶乘，即 `n!`，如果使用 Java 书写，则为

```java
int fac(int x) {
    if (x == 0) return 1;   // 不考虑 n 输入非法数据
    return x * fac (x - 1);
}
```

我们可以将这个函数看成两部分
- L2：当输入为 0 时返回 1
- L3：其他情况返回 `x * fac (x - 1)`

在Haskell中，我们可以定义其为

```hs
-- 文件位于 src/5-fac.hs
fac :: Int -> Int
fac 0 = 1               -- 情况1
fac x = x * fac (x - 1) -- 情况2
```

需要注意的是这里并**不能调换位置**，Haskell的模式匹配是依照顺序进行的，也就是
Haskell 会优先匹配 `fac 0`，只有当其匹配失败才会匹配 `fac x`，
如果调换顺序则会导致 `fac x` 会一直被匹配到而无法匹配到 `fac 0` 从而使函数失效。

借助模式匹配的顺序规则，我们可以简化二进制操作符 or，也就是 `||` 操作符

```hs
-- 文件位于 src/5-binary.hs
or :: Bool -> Bool -> Bool
or True  True  = True
or True  False = True
or False True  = True
or False False = False

or' :: Bool -> Bool -> Bool
or' False False = False
or' _     _ = True           -- _ 表示这个参数是弃元
```

~~简单来说就是，模式匹配就是你把所有情况写全了自动匹配，自动打表~~