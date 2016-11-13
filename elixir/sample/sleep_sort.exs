defmodule SleepSort do
  def sort(collection) do
    me = self
    collection
    |> Enum.map(fn (n) ->
        spawn_link fn -> (send me, { self, :timer.sleep(n * 10) && n }) end
      end)
    |> Enum.map(fn (_pid) ->
        receive do { _pid, result } -> result end
      end)
  end
end

range = 1..20
collection = Enum.shuffle(range)
IO.inspect collection
#=> [6, 13, 17, 10, 1, 16, 15, 14, 12, 11, 18, 8, 3, 5, 4, 20, 9, 7, 2, 19]
sorted = SleepSort.sort(collection)
IO.inspect sorted
#=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
IO.inspect Enum.to_list(range) == sorted
#=> true
