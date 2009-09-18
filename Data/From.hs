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

class From a b | a -> b where
    from :: a -> b


-- | A more flexible version of 'From' using phantom types
--
-- > data Foo a = Foo Int | Bar String
-- >
-- > data IntT
-- > data StringT
-- >
-- > instance FromTagged (Foo IntT) Int where
-- >     fromTagged (Foo a) = a
-- >
-- > instance FromTagged (Foo StringT) String where
-- >     fromTagged (Bar a) = a
-- >
-- > test = let foo = Foo 42      :: Foo IntT
-- >            bar = Bar "hello" :: Foo StringT
-- >        in (fromTagged foo, fromTagged bar)
-- > =====> (42,"hello")

class FromTagged a b | a -> b where
    fromTagged :: a -> b
