defmodule Times do
  defmacro times_n(base) do
    method_name = String.to_atom("times_#{base}")
    code = [do: {:def, [line: 0],
             [{method_name, [line: 0], [{:n, [line: 0], nil}]},
               [do: {:*, [line: 0], [base, {:n, [line: 0], nil}]}]]}]
    code
  end
end
defmodule Test do
  require Times
  Times.times_n(3)
  Times.times_n(4)
end

IO.puts Test.times_3(4)
IO.puts Test.times_4(5)
