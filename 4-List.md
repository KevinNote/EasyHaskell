# 列表的一些用法

## 连接两个列表（`[a] ++ [a]`）

类型 `[a] -> [a] -> [a]`

Haskell 中使用 `++` 进行两个同类型的表列增加，e.g.

```hs
ghci> let x = [1, 2, 3]
ghci> let y = [4, 5, 6]
ghci> x ++ y
[1,2,3,4,5,6]
```

## 增加元素到头部（`a : [a]`）

类型 `a -> [a] -> [a]`

Haskell 使用 `:` 将左侧的Operand添加到右侧的Operand上：

```hs
ghci> let x = [1, 2, 3]
ghci> 0 : x
[0,1,2,3]
```

## 获取数组长度（`length [a]`）

类型 `[a] -> Int`

```hs
ghci> let x = [1, 2, 3]
ghci> length x
3
```

## 取出前 n 个元素（`take Int [a]`）

类型 `Int -> [a] -> [a]`

```hs
ghci> let x = [1, 2, 3]
ghci> take 2 x
[1,2]
ghci> take 5 x  -- 取出的 n 大于数组的长度
[1,2,3]
```

## 取出第一个元素（`head [a]`）

类型 `[a] -> Int`

```hs
ghci> let x = [1, 2, 3]
ghci> head x
1
ghci> let y = []  -- 如果为空情况
ghci> head y
*** Exception: Prelude.head: empty list
```

## 取出除第一个元素（`tail [a]`）

类型 `[a] -> [a]`

```hs
ghci> let x = [1, 2, 3]
ghci> tail x
[2,3]
ghci> let y = []  -- 如果为空情况
ghci> tail y
*** Exception: Prelude.head: empty list
```

## 惰性求值/Lazy Evaluation

Haskell 是一门非常🐂的语言，其支持数组的惰性求值。简单来说，
对于一个长度为 n 的数组，如果我们只需要操作前 m 个元素，那么
后面的 n - m 个元素 Haskell 会默认不执行求值。正因为此特性，
Haskell 支持了无穷数组（Infinite List）。

为了验证其，我们可以编写函数 `from`，其类型为 `Int -> [Int]`，
来返回一个从输入开始一直到无穷的函数

```hs
-- 位于 src/4-from.hs
-- ghci src/4-from.hs 可以自动装载此程序
from :: Int -> [Int]
from x = x : from (x + 1)
```

如果我们直接运行 `from 1`，终端会输出 `[1,2,3,4,5,6,7,8,9,10,...`
并且不会停止，其表示了这个数组极度的长以至于很难一次性打印完。

但是如果我们执行 `take 3 (from 1)`， 也就是我们从 `[1,2,3,4,5,6,7,8,9,10,...` 这个数组取出前3个，结果非常Amazing啊，Haskell并没有对整个数组执行
求值，而是只求了其中前三位（因为返回速度真的很快！）

```hs
ghci> take 3 (from 1)
[1,2,3]
```