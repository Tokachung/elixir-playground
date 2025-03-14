defmodule Example do
  require Integer
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def print_numbers(numbers) do
    numbers |> Enum.join(" ") |> IO.puts() # The |> operator is used to pass the result of the left-hand side to the right-hand side to chain functions
  end

  def get_numbers_from_user do
    IO.puts("Enter a list of numbers separated by spaces: ")
    user_input = IO.gets("") |> String.trim()
    String.split(user_input, " ") |> Enum.map(&String.to_integer/1)
  end

  def main do
    numbers = get_numbers_from_user()
    IO.inspect(sum_and_average(numbers))
    {sum, average} = sum_and_average(numbers)
    IO.puts("Sum: #{sum}, average: #{average}")
  end


end
