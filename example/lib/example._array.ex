# defmodule Example do
#   require Integer
#   use Application

#   def start(_type, _args) do
#     Example.main()
#     Supervisor.start_link([], strategy: :one_for_one)
#   end

#   def main do
#     grades = [25, 50, 75, 100]
#     new = for n <- grades, do: n + 10
#     IO.inspect(grades)
#     new = new ++ [125, 185] # Append 125 to the list
#     IO.inspect(new)
#     final = [5 | new]
#     IO.inspect(final)
#     even = for n <- final, Integer.is_even(n), do: n*1.0
#     IO.inspect(even)
#   end
# end
