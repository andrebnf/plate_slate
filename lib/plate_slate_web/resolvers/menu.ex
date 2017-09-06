defmodule PlateSlateWeb.Resolvers.Menu do
  alias PlateSlate.Menu

  def menu_items(_parent_or_root_value, args, _) do
    {:ok, Menu.list_menu_items(args)}
  end

end
