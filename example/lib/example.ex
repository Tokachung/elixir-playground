defmodule Example do

  def hello do
    :world # An interactive session will show this. but this won't if the file is run directly
    IO.puts(:world) # this wills show up if the file is run direclty

  end
end

Example.hello() # Any code here is only executed at compile time, not runtime

# mix run -e "code" <-- inline execution
# mix run <- compiles, and then runs the code. consequent runs will not recompile unless there are changes
