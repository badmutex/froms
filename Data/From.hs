{-# LANGUAGE
  FunctionalDependencies
  , MultiParamTypeClasses
  #-}

module Data.From where

-- | Simple extractor class
--
-- > data Foo = Foo String
-- > instance From Foo String where
-- >     from (Foo s) = s
-- >
-- > ---------------------------------------------
-- >
-- > data IntT
-- > data StringT
-- >
-- > instance From (Foo IntT) Int where
-- >     From (Foo a) = a
-- >
-- > instance From (Foo StringT) String where
-- >     From (Bar a) = a
-- >
-- > test = let foo = Foo 42      :: Foo IntT
-- >            bar = Bar "hello" :: Foo StringT
-- >        in (from foo, from bar)
-- > =====> (42,"hello")

class From a b | a -> b where
    from :: a -> b
