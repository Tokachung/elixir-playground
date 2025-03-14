defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    correct = :rand.uniform(10) - 1
    IO.inspect(correct)
    guess = IO.gets("Guess a number between 0 and 10: ") |> String.trim() |> Integer.parse()
    IO.inspect(guess)

    case guess do
      {result, _} -> IO.puts("parse succesful #{result}")
      if result === correct do
        IO.puts("You guessed correctly!")
      else
        IO.puts("You guessed wrong!")
      end

      :error -> IO.puts("parse failed")
    end
  end
end
