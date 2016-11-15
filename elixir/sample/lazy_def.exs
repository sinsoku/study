defmodule LazyDef do
  def define do
    defmodule Greet do
      def say do
        IO.puts "hello"
      end
    end
  end
end

try do
  LazyDef.Greet.say
rescue
  UndefinedFunctionError -> IO.puts "UndefinedFunctionError"
end
#=> UndefinedFunctionError

LazyDef.define
LazyDef.Greet.say
#=> hello
