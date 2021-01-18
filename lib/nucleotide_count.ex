defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, fn(x, acc) ->
      if(x == nucleotide) do
        acc + 1
      else
        acc
      end
    end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    map = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    # IO.puts strand

    _map = Enum.reduce(strand, map, fn x, map ->
      Map.update!(map, x, fn n -> n + 1 end)
    end)

    # _map = Enum.reduce(~c[CGTA], map, fn(x, map) ->
    #   count = Enum.count(strand, fn(i) -> i == x end)
    #   _map = %{map | x => count}
    # end)




    # tuples = Enum.frequencies(strand)
    # new_map = Enum.frequencies(strand)
    #   |> Map.to_list()
    #   |> Map.new()

    # _map = Enum.reduce(new_map, map, fn({k, v}, map) ->
    #   map = %{map | k => v}
    #   IO.inspect(map, label: "Here")
    # end)
  end
end
