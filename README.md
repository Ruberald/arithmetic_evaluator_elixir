# Arithmetic Evaluator

A purely functional RPN generator and evaluator written in Elixir.

```
$ git clone https://github.com/Ruberald/arithmetic_evaluator_elixir.git
$ cd arithmetic_evaluator_elixir

// Make sure you have elixir and mix installed
$ mix run -e "ArithmeticEvaluator.run"
```

### Sample output
```
Enter the expression: 3 * 4 * 4 - 45 / 3 + 2
Generated RPN:
["3", "4", "*", "4", "*", "45", "3", "/", "-", "2", "+"]
Result: 35.0
```
