defmodule BasicsTest do
  alias Basics

  use ExUnit.Case
  doctest Basics

  test "report_by_city/1" do
    list = [
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

    assert Basics.report_by_city(list) == [%{city: "SP", count: 4}, %{city: "FLN", count: 1}]
  end
end
