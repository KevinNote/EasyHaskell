or :: Bool -> Bool -> Bool
or True  True  = True
or True  False = True
or False True  = True
or False False = False

or' :: Bool -> Bool -> Bool
or' False False = False
or' _     _ = True