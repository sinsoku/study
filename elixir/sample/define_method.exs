defmodule Def do
  defmacro m(name) do
    quote bind_quoted: [name: name] do
      def unquote(:"m_#{name}")(), do: unquote(name)
    end
  end
end

defmodule A do
  def run do
    defmodule B do
      require Def
      Enum.shuffle(1..5)
      |> Enum.take(2)
      |> Enum.each(&Def.m(&1))
    end
  end
end

A.run
IO.inspect A.B.m_1
