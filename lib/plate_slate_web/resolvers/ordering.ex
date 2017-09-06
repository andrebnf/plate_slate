defmodule PlateSlateWeb.Resolvers.Ordering do
  alias PlateSlate.Ordering

  # last arg -> %{context: context} (%Absinthe.Resolution{})
  def place_order(_, args, _) do
    Ordering.create_order(args)
  end

end
