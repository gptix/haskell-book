sayHello :: String -> IO ()
sayHello x =
  putStrLn ("Hello " ++ x ++ "!")

{-

* Terminology
- function - a relation between one set of values and another set of values, by which one of the first set is 'mapped' to one (and only one) of the second set.
- parameter - a symbol used to represent, in the body of a function, a variable.
- argument - a value that 'populates' a parameter in the body of a function during evaluation
- value - a symbol (that might have deeper semantics) that is used during evaluation of a function
- 'binding' is the act of assigning, as an argument to replace a parameter, a value 'passed' to a function.

E.g., for the function 'koo x = x + 1' 'x' is a parameter. If 'koo' is called with ('applied to') the value '13', then
- 13 is a value
- 13 is passed in to be bound to the parameter 'x'
- 13 replaces each instance of 'x' in the body of the function
- so the function evaluates to
-- 13 + 1, which further simplifies to
-- 14

* Haskell functions take one value and return one value

A function is an expression that can be applied to an argument. If a function is applied to an argument, it returns a result. A function, whenever applied to any particular argument, will always return a specific result.

In Haskell (based on lambda calculus) each function takes one value and returns one result.

* Currying
In Haskell, a function that seems to take more than one value (e.g., n values) is actually a set of curried functions, each of which takes one value and returns a value of another function, which apparently takes one fewer values, until the last parameter is consumed, and a concrete value is returned.

 foo x y z = x + y + x  seems to be a function that takes three parameters.

 foo's type signature might be
 foo :: Int -> Int -> Int -> Int -- which can be read as
 foo takes an Int and returns a function that takes an Int and returns a function that takes an Int and returns an Int
 foo takes an Int and returns (a function that takes an Int and returns (a function that takes an Int and returns (an Int)))

 We can "partially apply" foo by providing fewer than three parameters.
 foo 2 3
 would return a function that takes an Int (and then evaluates using the '+' operators) and returns an Int
 the type signature of
 foo 2 3
 might be
 foo 2 3 :: Int -> Int
 which can be read "foo 2 3 is a function that takes an Int and returns an Int"

 Defining a function, as in defining foo, allows us to "call" foo, pass values via defined parameters to be used as arguments, and carry out evaluation as in lambda calculus.

 In
 foo 2 3 5
 '2', '3', and '5' are passed in and used as values for 'x', 'y', and 'z'
 so
 foo 2 3 5
 simplifies to
 2 + 3 + 5
 and then to
 10

 or,
 foo 2 3 5
 evaluates to
 (\w v -> 2 + w + v) 3 5
 and then to
 (\q -> 2 + 3 + q) 5
 and then to
 2 + 3 + 5
 and then to
 10

**  Functions can be supplied to other functions.

 goo :: Int -> Int -> Int
 goo x y = x * y

 foo x y f z :: t1 -> t2 -> (t1 -> t2 -> Int) -> Int -> Int
 "foo is a function that takes a value of some type t1 and returns (a function that takes a value of some type t2 and returns (a function that takes a function that takes a t1 Int and returns (a function that takes a t2 and returns an Int) and takes an Int and returns an Int"
 note that foo does not require x and y to be of any type other than those that 'fit' the function passed as f.

 foo x y f z = (f x y) + z -- f is a function

 foo 2 3 goo 5 = -- goo is a function passed in via the parameter 'f'
 note that the types of '2' and '3' match the types of values expected by 'goo'

 (goo 2 3) + 5
 (2 * 3) + 5
 (6) + 5
 11

* Haskell syntax for defining functions
 e.g.
triple z = z * 3

** Head
'triple' is a label used to store the function
 'z' is a label used to represent, within the body of the function definition, the single parameter expected by the function.

** '='
'=' divides the 'head' of the function, consisitng of the name of the function plus parameters, from the 'body' of the function, which specifies operations to be carried out based on values passed as arguments via parameters.
-- NOTE: '=' does not test for equality; '==' does so.

** Body
'z * 3' is the body of the function, defining how the parameter passed will be transformed.

** Result
the result of the transformation according to the body will be returned as the 'evaluation' or 'value' of a call to the function.
Note: Every function in haskell must return exactly one value.

** Capitalization matters.

** Definitions of functions are lexical in scope. Functions can be defined within 'outer' functions, and will operate correctly within the scope of either
- the function in which they are defined, or
- global scope
-}

{-
λ> :load test.hs
[1 of 1] Compiling Main             ( test.hs, interpreted )
Ok, modules loaded: Main.
Collecting type info for 1 module(s) ... 
λ> sayHello "Jud"
Hello Jud!
λ> :m
λ> 1
1
λ> 1 + 2
3
λ> (1 + 2) * 4
12
λ> ((1 + 2) * 3) + 100
109
λ> foo x y z = x + y + z
λ> :t foo
foo :: Num a => a -> a -> a -> a
λ> :t foo 2 3
foo 2 3 :: Num a => a -> a
λ> foo 2 3 5
10
λ> foo x y f z = (f x y) + z
λ> goo x y = x * y
λ> foo 2 3 goo 5
11
λ> goo 2 3
6
λ> :t foo
foo :: Num a => t1 -> t -> (t1 -> t -> a) -> a -> a
λ> hoo x y = if ((x == "a") && (y == "b")) then 1 else 2
λ> foo "a" "b" hoo 3
4
λ> :t hoo
hoo :: Num t => [Char] -> [Char] -> t
λ> hoo x y = if ((x == 'a') && (y == 'b')) then 1 else 2
λ> :t hoo
hoo :: Num t => Char -> Char -> t
λ> foo 'a' 'b' hoo 3
4
λ>
-}








