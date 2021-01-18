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




    # tuples = Enum.frequencies(strand)
    new_map = Enum.frequencies(strand)
      |> Map.to_list()
      |> Map.new()

    map = Enum.reduce(new_map, map, fn({k, v}, map) ->
      map = %{map | k => v}
      IO.inspect(map, label: "Here")
    end)
    IO.inspect(map, label: "And here:")
  end

    # IO.inspect tuples
    # IO.inspect new_map

  #   map = for n <- new_map do
  #     {k, v} = n
  #     IO.puts "#{k}: #{v}"

  #     map = %{map | k => v}
  #     IO.puts("Here: #{inspect map}")
  #     map
  #   end
  #   IO.puts "I'm map: #{inspect(map)}"
  # end
end
