defmodule Times do
  defmacro times_n(base) do
    quote bind_quoted: [base: base] do
      def unquote(:"times_#{base}")(n), do: unquote(base) * n
    end
  end
end

defmodule Foo do
  def x do
    defmodule Piyo do
      require Times
      Enum.shuffle(1..5) |> Enum.take(2) |> Enum.each(&Times.times_n(&1))
    end
  end
end

defmodule Bar do
  def times_after_wait do
    receive do
      {sender, n} ->
        :timer.sleep 1 * 100
        send sender, { :ok, Foo.Piyo.times_4(n) }
    end
  end
end

pid = spawn(Bar, :times_after_wait, [])
IO.inspect self
IO.inspect pid

send pid, {self, 3}
Foo.x

receive do
  {:ok, result} ->
    IO.puts result
  after 500 ->
    IO.puts "error"
end
