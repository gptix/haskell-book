module Learn where

x = 10
   * 5 + y

myResult = x * 5

y = 10

{- Common practice in Haskell:

- Capitalize module names
- camelCase variable names
- (syntax) indentation matters
- (syntax) letter case matters
- trailing whitespace is considered bad style
WARNING: Indentation can easily go wrong in a copy-and-paste job as well.



Exercises: Heal the Sick
The following code samples are broken and won’t compile. The first
two are as you might enter into the REPL; the third is from a source
file. Find the mistakes and fix them so that they will.

1. let area x = 3. 14 * (x * x)
   area x = 3.14 * (x * x) -- REPL no longer needs 'let', and space was inside pi

2. let double x = b * 2
   double x = x * 2 -- REPL no longer needs 'let', and 'b' was not a parameter to double.


3.
x = 7
 y = 10
f = x + y

'y' mis-aligned


-}
