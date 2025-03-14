defmodule Example do
  use Application

  # args describes data passed to the parameter. the underscore is a placeholder for the data to mute the warnings
  def start(_type, _args) do
    Example.main() # Call the main function
    Supervisor.start_link([], strategy: :one_for_one) # A supervisor is a process that supervises other processes
  end

  def main do
    name = "Caleb";
    status = Enum.random([:gold, :silver, :bronze, :banned])

    case status do
      :gold -> IO.puts("Welcome to the fancy lounge, #{name}")
      :banned -> IO.puts("You are banned, #{name}")
      _ -> IO.puts("You are a peasant, #{name}")
    end
  end
end

"""
When we run mix, it will start the application by calling the function in the Example module, because we specified the module in the application function in mix.exs.
The start function in the Example module will call the main function, which will output "example output" to the console.
The start function will then start a supervisor process that will supervise other processes in the application.
"""
