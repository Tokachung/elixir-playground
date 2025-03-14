# Define a struct for the Membership module
defmodule Membership do
  defstruct [:type, :price]
end

# Define a struct for the User module
defmodule User do
  defstruct [:name, :membership]
end


defmodule Example do
  use Application

  # args describes data passed to the parameter. the underscore is a placeholder for the data to mute the warnings
  def start(_type, _args) do
    Example.main() # Call the main function
    Supervisor.start_link([], strategy: :one_for_one) # A supervisor is a process that supervises other processes
  end

  def main do
    gold_membership = %Membership{type: :gold, price: 100}
    silver_membership = %Membership{type: :silver, price: 80}
    bronze_membership = %Membership{type: :bronze, price: 50}
    none_membership = %Membership{type: :none, price: 0}

    users = [
      %User{name: "Shawn", membership: gold_membership},
      %User{name: "John", membership: silver_membership},
      %User{name: "Jane", membership: bronze_membership},
      %User{name: "Alice", membership: none_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} has a #{membership.type} membership, paying #{membership.price} dollars a month.")
    end)

  end
end

"""
When we run mix, it will start the application by calling the function in the Example module, because we specified the module in the application function in mix.exs.
The start function in the Example module will call the main function, which will output "example output" to the console.
The start function will then start a supervisor process that will supervise other processes in the application.
"""
