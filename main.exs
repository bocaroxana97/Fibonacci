defmodule Fibonacci do
  def fibonacci_number(n) do 
    case n do
      0 -> 0
      1 -> 1
      _ -> fibonacci_number(n-1) + fibonacci_number(n-2)
    end
  end

  def fibonacci(n) do
    Enum.reduce(0..n, [], fn x, acc -> acc ++ [fibonacci_number(x)] end)
  end

  def add_number_to_black_list(black_list, number) do 
    black_list ++ [number]
      |> Enum.uniq()
  end

  def fibonacci_without_black_list_numbers(n, black_list) do 
    Enum.filter(fibonacci(n),  fn x -> !Enum.member?(black_list, x) end) 
  end
end

IO.inspect(Fibonacci.fibonacci_number(9))
IO.puts Fibonacci.fibonacci_number(0)
IO.inspect(Fibonacci.fibonacci(9))

IO.inspect(Fibonacci.add_number_to_black_list([3, 0], 2))

IO.inspect(Fibonacci.fibonacci_without_black_list_numbers(9, [3, 0]))
