# 5. 模式匹配

## Pattern Maching

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

## Guard

Guard 比较牛逼

其结构类似于

```hs
func x | condition1 = return1
       | condition2 = return2
       | condition3 = return3
       | ....
       | otherwise  = returnN
```

以判断一个数是否为2的power为例

```hs
-- 文件位于 src/guard.hs
isPowerOfTwo :: Int -> Bool
isPowerOfTwo x | x == 1 = True  -- 情况1：如果是 1，则为 2^0，所以是
               | even x = isPowerOfTwo (x `div` 2) -- 情况2：如果是偶数则除2递归
               | otherwise = False -- 情况3：如果不是1并且不能被2整除则一定不是2的power，返回 False
```

需要注意的是 Guard 的匹配也是顺序匹配的。

## 列表匹配

经过上面的学习，可以尝试思考我们拥有个列表，我们需要获取其长度而不使用
`length`函数，我们可以怎么做？

```hs
-- 文件位于 src/len.hs
len :: [a] -> Int
len [] = 0                 -- 匹配空列表
len (x : xs) = 1 + len xs  -- [a] equiv. a1 : (a2 : ... (an : []))
```

