

module Data.Defunctor (
                       -- | I want a generic way to pull values out of a functor
                       -- without explicitly saying 'fromFoo' and so forth.
                       Defunctor (..)
                      ) where

class Functor f => Defunctor f where
    from :: f a -> a
