defmodule LazyDef do
  def define do
    defmodule Greet do
      def say do
        IO.puts "hello"
      end
    end
  end
end

defmodule Main do
  def run(n) do
    :timer.sleep n * 100
    LazyDef.Greet.say
  end
end

spawn(Main, :run, [0])
#=> UndefinedFunctionError

spawn(Main, :run, [1])
LazyDef.define
#=> hello

receive do
  {:ok, result} -> IO.puts result
  after 500 -> IO.puts "TimeOut"
end
