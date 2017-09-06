defmodule PlateSlateWeb.Schema.MenuTypes do
  # only use top level Schema on top level schema.ex
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PlateSlate.Repo

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
    field :name, :string # do
    #   resolve fn menu_item, _args, _ ->
    #     {:ok, Map.get(menu_item, :name)} # gets the return of Menu Item
    #   end
    # end
    field :description, :string
    field :price, :decimal
    field :category, :category, resolve: assoc(:category)

    # field :category, :category do
    #   resolve fn menu_item, _, _ ->
    #     fun = {__MODULE__, :batch_get, PlateSlate.Menu.Category}
    #     batch(fun, menu_item.category_id, fn batch_result ->
    #       {:ok, Map.get(batch_result, menu_item.category_id)}
    #     end)
    #   end
    # end
  end

  object :category do
    field :name, :string
  end

  # defp batch_get(schema, category_ids) do
  #   import Ecto.Query
  #
  #   schema
  #   |> where([c], c.id in ^Enum.uniq(category_ids))
  #   |> Repo.all
  #   |> Map.new(fn category -> {category.id, category} end)
  #   |> IO.inspect
  # end
end
