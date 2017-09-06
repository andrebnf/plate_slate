# Absinthe notes

`mix phx.gen.context Menu Category categories name:string`

`mix phx.gen.schema Menu.Item items name:string description:string category_id:references:categories`

`menuItems(matching: String): [MenuItem]` # returns a list of MenuItem

`non_null(:string)` non_null -> modifier

`get` for queries

`post` for mutations
