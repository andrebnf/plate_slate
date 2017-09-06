defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema

  import Ecto.Query
  alias PlateSlate.{Menu, Repo}

  query do
    field :menu_items, list_of(:menu_item) do
      arg :matching, :string
      resolve fn _, args, _ -> menu_item_resolver(nil, args, nil) end
    end
  end

  @desc """
  Tasty thing to eat
  """
  object :menu_item do
    field :id, :id
    @desc "Name description"
    field :name, :string
    field :description, :string
    field :price, :float
  end


  defp menu_item_resolver(_, %{matching: term}, _) do
    query =
      Menu.Item
      |> where([item], ilike(item.name, ^"%#{term}%"))

    {:ok, Repo.all(query)}
  end
  defp menu_item_resolver(_, _, _), do: {:ok, Repo.all(Menu.Item)}

end
