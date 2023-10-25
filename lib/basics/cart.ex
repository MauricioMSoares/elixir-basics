defmodule Basics.Cart do
  alias Basics.Cart

  def add_product(product, cart) do
    Enum.reduce([product | cart], [], fn item, list ->
      [item | list]
    end)
  end

  def remove_product(product_name, cart) do
    Enum.reduce(cart, [], fn
      item, list when item.name != product_name ->
        [item | list]

      _, list ->
        list
    end)
  end

  def remove_first(cart) do
    {_, new_cart} =
      Enum.reduce(cart, {false, []}, fn
        item, {false, acc} -> {true, acc}
        item, {true, acc} -> {true, [item | acc]}
      end)
  end

  def run do
    cart = []
    IO.inspect(cart)

    cart = Cart.add_product(%{name: "Pizza", price: 19.90}, cart)
    IO.inspect(cart)

    cart = Cart.add_product(%{name: "Cake", price: 14.90}, cart)
    IO.inspect(cart)

    cart = Cart.add_product(%{name: "Pasta", price: 22.90}, cart)
    IO.inspect(cart)

    cart = Cart.remove_product("Cake", cart)
    IO.inspect(cart)

    cart = Cart.remove_first(cart)
    IO.inspect(cart)
  end
end
