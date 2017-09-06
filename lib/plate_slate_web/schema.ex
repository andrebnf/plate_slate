defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  alias PlateSlateWeb.Resolvers

  import_types __MODULE__.MenuTypes
  import_types __MODULE__.OrderingTypes
  import_types Absinthe.Type.Custom

  query do
    field :menu_items, list_of(:menu_item) do
      arg :filter, :menu_items_filter
      arg :order, :sort_order, default_value: :asc
      resolve &Resolvers.Menu.menu_items/3
    end
  end

  mutation do
    field :place_order, :order do
      arg :items, non_null(list_of(:place_order_input))
      arg :customer_number, non_null(:integer)
      resolve &Resolvers.Ordering.place_order/3
    end
  end

  enum :sort_order do
    value :asc
    value :desc
  end

  # scalar :decimal do
  #   # parse fn(input) -> ... end # input is struct (a part of absinthe ast) - blueprint tree
  #   # serialize fn(value) -> ... end # value is what is was parsed (literal or variable value returned)
  #
  #   parse fn input ->
  #     input.value |> Decimal.parse
  #   end
  #   serialize fn value ->
  #     to_string(value)
  #   end
  # end
end
