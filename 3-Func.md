# 3. 函数

Haskell 是一门面向函数式编程语言，其与面向对象语言在核心思路上存在差异
包括函数。

## 一些例子


```hs
let addOne x = x + x
```

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
-- 位于 src/3-curry.hs
addUnCurry :: (Int, Int, Int) -> Int
addUnCurry (x, y, z) = x + y + z
```

但是如果对于如果我们需要实现一个 `add(int, int)`，在非柯里化情况下，
我们需要重新写一个函数。但是如果我们实现了柯里化，则不需要。

考虑如下函数：

```hs
addCurry :: Int -> Int -> Int -> Int
addCurry x y z = x + y + z
```

我们可以非常简单的实现为

```hs
addTwo :: Int -> Int -> Int
addTwo = addCurry 0
```

柯里化的核心思路可以理解为：在 `addCurry` 传入第一个参数 `x` 时，
其消去了其类型 `Int -> Int -> Int -> Int` 中的第一个 `Int`，
返回了一个类型为 `Int -> Int -> Int` 的函数。
