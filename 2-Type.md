# 2. 类型

与其他强类型语言一致，Haskell拥有其自己的类型系统。

## 内建类型

| 类型 | 类似于Java/C# | 描述 |
| ---- | --- | --- |
| Int     | int64  | 整形 |
| Integer | int64  | 整数（数学意义上） |
| Float   | float  | 单精度浮点 |
| Double  | double | 双精度浮点 |
| Bool    | bool   | 布尔值，其只可以为 True 和 False（大小写敏感） |
| Char    | char   | 字符 |
| \[T\]   | T[]    | 数组、列表 |

> Int 和 Integer 不同的点在于 Int 限制其长度，通常为64位
> 但是 Integer 则会模拟数学意义上的整数，其没有大小限制

在 Haskell 中字符串使用双引号标注，即类似于 `"Hi"`，但是根据
GHC版本不同，其类型可能为 `String` 亦或为 `[Char]`。

## 类型转换

对于Haskell，因为有强类型的存在，所以类型转换必然存在。例如
1 到底是一个浮点数还是一个整数呢？还只是一个整形呢？我们不从得知。
因此我们需要一个类型转换。

Haskell 的强制类型转换和 Java 很像，Java 中的类型转换语法为：

```java
(Type)m; // m 可以是任意类型
         // 例如 Object o = (Object)str;
```

而在Haskell中则为

```hs
x :: Type -- 例如
          -- 1 :: Int 其会将 1 转换为 Int 类型
```

为了验证这个合理性，我们可以使用字符串作为原型
> 注，在低版本的Haskell中字符串默认类型为 [Char]
> 而在新版本中为 String，本示例使用新版本

```hs
ghci> :t "x"            -- 检查 "x" 的类型
"x" :: String           -- "x" 的类型为 String
ghci> :t "x" :: [Char]  -- 检查 "x" :: [Char] 的类型
"x" :: [Char] :: [Char] -- 类型为 [Char]
```

但是并不是所有类型都可以被正确转换的，例如我们不能将
Bool 转换为 Int

```hs
ghci> :t True
True :: Bool
ghci> :t True :: Int

<interactive>:1:1: error:
    * Couldn't match expected type `Int' with actual type `Bool'
    * In the expression: True :: Int
```