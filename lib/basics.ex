defmodule Basics do
  def consulta_db() do
    [
      %{
        name: "antonio",
        age: 34,
        city: "FLN"
      },
      %{
        name: "mauricio",
        age: 21,
        city: "SP"
      },
      %{
        name: "roger",
        age: 35,
        city: "SP"
      },
      %{
        name: "mayumi",
        age: 21,
        city: "SP"
      },
      %{
        name: "vini",
        age: 40,
        city: "SP"
      }
    ]
  end

  def report_by_city(list) do
    filtered_list =
      list
      |> Enum.group_by(fn person -> person.city end)
      |> Enum.map(fn {city, grouped_list} -> %{city: city, count: length(grouped_list)} end)
      |> Enum.reverse

    IO.inspect(filtered_list)
  end

  def report_by_city_2(list) do
    group_by_city = 
      list 
      |> Enum.group_by(fn person -> person.city end)

    count_by_city =
      group_by_city
      |> Enum.map(fn {city, grouped_list} -> %{city: city, count: length(grouped_list)} end)

    IO.inspect(count_by_city)
  end

  def report_by_city_3(list) do
    IO.inspect(Enum.map(Enum.group_by(list, fn person -> person.city end), fn {city, grouped_list} -> %{city: city, count: length(grouped_list)} end))
  end

  def report_by_city_reduce(list) do
    reduced_list =
      list
      |> Enum.reduce(%{}, fn person, acc ->
        city = person.city
        count = Map.update(acc, city, 1, fn count -> count + 1 end)
      end)
      |> Map.to_list()
      |> Enum.map(fn {city, count} -> %{city: city, count: count} end)
      |> Enum.reverse

    IO.inspect(reduced_list)
  end

  # Basics.report_by_city(Basics.consulta_db)
end
