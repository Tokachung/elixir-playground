defmodule Example do
  use Application

  # args describes data passed to the parameter. the underscore is a placeholder for the data to mute the warnings
  def start(_type, _args) do
    Example.main() # Call the main function
    Supervisor.start_link([], strategy: :one_for_one) # A supervisor is a process that supervises other processes
  end

  def main do
    time = DateTime.new!(Date.new!(2026, 1, 1), Time.new!(0,0,0,0), "Etc/UTC")
    time_till = DateTime.diff(time, DateTime.utc_now())
    IO.puts(time_till)

    days = div(time_till, 86400) # Calculate days
    IO.puts(days)
    hours = div(rem(time_till, 86400), 60 * 60) #
    IO.puts(hours)
    mins = div(rem(time_till, 3600), 60)
    IO.puts(mins)
    seconds = rem(time_till, 60)
    IO.puts(seconds)

    IO.puts("Time until new year: #{days} days, #{hours} hours, #{mins} minutes, #{seconds} seconds")
  end
end

"""
When we run mix, it will start the application by calling the function in the Example module, because we specified the module in the application function in mix.exs.
The start function in the Example module will call the main function, which will output "example output" to the console.
The start function will then start a supervisor process that will supervise other processes in the application.
"""
