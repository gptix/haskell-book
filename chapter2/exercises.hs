{-
1. Given the following lines of code as they might appear in a
source file, how would you change them to use them directly in
the REPL?

half x = x / 2

-- A: N change needed.  Perhaps prior version of GHCI would need.

square x = x * x

-- A: N change needed.  Perhaps prior version of GHCI would need.

2. Write one function that has one parameter and works for all
the following expressions. Be sure to name the function.

3.14 * (5 * 5)
3.14 * (10 * 10)
3.14 * (2 * 2)
3.14 * (4 * 4)

areaOfCircle r = 3.14 * r ^ 2

3. There is a value in Prelude called pi. Rewrite your function to
use pi instead of 3.14.

areaOfCircleWithPi r = pi * r ^ 2


** Infix Operators

Operators are a subset of functions. Operators can be used 'infix'. Other functions cannot.

Some non-operator functions can be used in infix style if we wrap their names in back-ticks.

E.g.,


6 `div` 3 === div 6 3

Similarly, an operator can be used in prefix style by enclosing it in parentheses.

E.g.

(+) 100 200 === 100 + 200

* Information available about defined operators

At the REPL, the command ':info (>>>>>)' will cause the REPL to provide information about the operator '>>>>>' (this is not an actual predefined operator).

E.g.

λ> :i (+)
class Num a where 
  (+) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 6 +

'infixl' specifies left-associativity

'6' is precedence level (from (0 to 9, with higher precedence operators applied earlier).

* Exercises: Parentheses and Association
Below are some pairs of functions that are alike except for parenthe-
sization. Read them carefully and decide if the parentheses change
the results of the function. Check your work in GHCi.
1.
a) 8 + 7 * 9
b) (8 + 7) * 9
-- change

2.
a) perimeter x y = (x * 2) + (y * 2)
b) perimeter x y = x * 2 + y * 2
-- no change

3.
a) f x = x / 2 + 9
b) f x = x / (2 + 9)

-- change
