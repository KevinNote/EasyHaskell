# 3. 函数

Haskell 是一门面向函数式编程语言，其与面向对象语言在核心思路上存在差异
包括函数。

## 函数的定义

与 Java 不同，Haskell函数的定义在 GHCi 中通常使用 `let` 关键词，通常来说是

```hs
let 名字 参数1 参数2 参数3 = 函数内容
```

举个例子：

```hs
let addOne x = x + 1
```

但是如果是写成 `.hs` 文件的话，则不需要 `let`

如

```hs
addOne x = x + 1
```

## 类型

由于 Haskell 有着很强的类型能力，所以如果不好好标注函数类型，你也会看不懂。
正常来说我们需要在函数定义前定义其类型

```hs
-- 文件位于 src/3-addOne.hs
addOne Int -> Int  -- 定义其类型为输入一个 Int 返回一个 Int
addOne x = x + 1   -- 函数定义
```

Haskell 的类型标注是非常特殊的，尤其是柯里化后的函数。参见后节。

## 多态性/Polymorphism

Haskell 的多态性类似于 Java 和 C# 中的泛型/Generic，
例如合并两个数组的函数 `++`，其类型为

```hs
ghci> :t (++)
(++) :: [a] -> [a] -> [a]
```

其表示接受 2 个类型为 `a` 的数组并返回一个 `[a]`。

其中类型 `a` 是一个多态的类型，其可以被替换为任意类型，
例如，可以将 `a` 编程 `Int` 类型：

```hs
(++) :: [Int] -> [Int] -> [Int]
```

而对于其中包含类似 `a` 类型的函数，其被称为 polymorphic。

## 柯里化

柯里化是接受多个参数的函数变换成接受一个单一参数（最初函数的第一个参数）的函数。


考虑 Java 函数

```java
int add(int x, int y, int z) {
   return x + y + z;
}
```

我们可以认为其类型为 `(Int, Int, Int) -> Int`，
即我们输入 3 个 `Int` 类型的变量形成的元组，最后返回一个 Int。

```hs
-- 文件位于 src/3-curry.hs
addUnCurry :: (Int, Int, Int) -> Int
addUnCurry (x, y, z) = x + y + z
```

但是如果对于如果我们需要实现一个 `add(int, int)`，在非柯里化情况下，
我们需要重新写一个函数。但是如果我们实现了柯里化，则不需要。

考虑如下函数：

```hs
-- 文件位于 src/3-curry.hs
addCurry :: Int -> Int -> Int -> Int
addCurry x y z = x + y + z
```

我们可以非常简单的实现为

```hs
-- 文件位于 src/3-curry.hs
addTwo :: Int -> Int -> Int
addTwo = addCurry 0
```

柯里化的核心思路可以理解为：在 `addCurry` 传入第一个参数 `x` 时，
其消去了其类型 `Int -> Int -> Int -> Int` 中的第一个 `Int`，
返回了一个类型为 `Int -> Int -> Int` 的函数。

