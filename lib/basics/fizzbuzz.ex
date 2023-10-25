defmodule Basics.Fizzbuzz do
  def run(number) do
    if number == 0 do
      IO.puts("0 -> Not Fizz, nor Buzz")
    else
      cond do
        rem(number, 3) == 0 and rem(number, 5) == 0 -> IO.puts("#{number} -> FizzBuzz")
        rem(number, 3) == 0 -> IO.puts("#{number} -> Fizz")
        rem(number, 5) == 0 -> IO.puts("#{number} -> Buzz")
        true -> IO.puts("#{number} -> Not Fizz, nor Buzz")
      end
    end
  end

  def run_2(list) do
    list
    |> Enum.map(fn number -> run(number) end)
  end

  def generate_list do
    Enum.to_list(1..100)
  end
end
