# 1. 我们的第一步：认识 GHCi

打开命令行或者终端输入 `ghci` 后我们会进入 ghci 内，
其会标注 GHC 版本等信息

```hs
C:\Users\Kevin>ghci
GHCi, version 9.2.4: https://www.haskell.org/ghc/  :? for help
ghci>
```

GHCi 是 Haskell 的 REPL（Read Eval Print Loop：交互式解释器）。
用白话来说就是，我们可以在 GHCi 中进行一些 Haskell 编程。

## 一些 GHCi 的命令

与纯粹的 Haskell 不同，GHCi 拥有一些自己的指令，而这些指令以`:` 开头：

```hs
ghci> let d x = x + x  -- 这是 Haskell
ghci> :type d          -- :type 是 Haskell 指令
d :: Num a => a -> a   -- 命令返回结果
```

### 获取类型（`:t`/`:type`）

我们可以使用 `:type` 或者 `:t` 获取类型

```hs
ghci> :t True
True :: Bool  -- True 的类型为 Bool
```

### 获取信息（`:i`/`:info`）

```hs
ghci> :i Bool
ghci> :i Bool
type Bool :: *
data Bool = False | True
        -- Defined in `GHC.Types'
instance Eq Bool -- Defined in `GHC.Classes'
instance Ord Bool -- Defined in `GHC.Classes'
instance Enum Bool -- Defined in `GHC.Enum'
instance Show Bool -- Defined in `GHC.Show'
instance Read Bool -- Defined in `GHC.Read'
instance Bounded Bool -- Defined in `GHC.Enum'
```

### 退出 GHCi（`:q`/`:quit`）

```hs
ghci> :q
Leaving GHCi.
```

### 重载模块（`:r`/`:reload`）

如果使用了 `ghci <filename>` 装在了对应文件的函数，如果我们修改了
文件，那么 ghci 并不会自动重新编译，因此需要重载文件。

