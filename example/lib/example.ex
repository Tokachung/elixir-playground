defmodule Example do
  use Application
  alias UUID

  # args describes data passed to the parameter. the underscore is a placeholder for the data to mute the warnings
  def start(_type, _args) do
    IO.puts(UUID.uuid4())
    Supervisor.start_link([], strategy: :one_for_one) # A supervisor is a process that supervises other processes
  end

  def hello do
    :world
  end
end
