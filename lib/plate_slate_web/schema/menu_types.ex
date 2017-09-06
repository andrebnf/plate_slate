defmodule PlateSlateWeb.Schema.MenuTypes do
    # only use top level Schema on top level schema.ex
  use Absinthe.Schema.Notation

  input_object :menu_items_filter do
    field :matching, :string
    field :priced_above, :decimal
    field :priced_below, :decimal
  end

  @desc """
  Tasty thing to eat
  """
  object :menu_item do
    field :id, :id
    @desc "Name description"
    field :name, :string
    field :description, :string
    field :price, :decimal
  end
end
