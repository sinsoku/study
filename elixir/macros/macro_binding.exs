defmodule My do
  defmacro mydef(name) do
    IO.puts("* macro")
    quote bind_quoted: [nam: name] do
      IO.puts("* bind_quoted")
      def unquote(nam)(), do: IO.puts("* do") && unquote(nam)
    end
  end
end

defmodule Test do
  require My
  IO.puts("* Test")
  [ :fred, :bert ] |> Enum.each(&My.mydef(&1))
end

IO.puts Test.fred
# * macro
# * Test
# * bind_quoted
# * bind_quoted
# * do
# fred
