module Data.Defunctor where


-- | I want a generic way to pull values out of a functor
-- without explicitly saying @fromFoo@ and so forth.
--
-- A Defunctor should alway be able to support the 'pull' operation,
-- so the 'Maybe' monad is not a candidate for an instance.
--
-- > data Foo a = Foo a
-- >
-- > instance Functor Foo where
-- >     fmap f (Foo a) = Foo (f a)
-- >
-- > instance From (Foo a) a where
-- >     from (Foo a) = a
-- >
-- > instance Defunctor Foo where
-- >     pull = from
-- >
-- > test = let foo = Foo 42
-- >        in (from foo, pull foo)
-- > =====> (42,42)

class Functor f => Defunctor f where
    pull :: f a -> a
