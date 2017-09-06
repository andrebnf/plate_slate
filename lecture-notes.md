# Absinthe notes

`mix phx.gen.context Menu Category categories name:string`

`mix phx.gen.schema Menu.Item items name:string description:string category_id:references:categories`

`menuItems(matching: String): [MenuItem]` # returns a list of MenuItem

`non_null(:string)` non_null -> modifier

`get` for queries

`post` for mutations


```
mutation($items:[PlaceOrderInput!]!) { } # non null list of non null
```

```
mutation($items:[PlaceOrderInput!]!) { # non null list of non null
  placeOrder(items:$items, customerNumber: 4) {
    orderedAt
    items {
      price
      menuItem {
        name
        category { name }
      }
    }
  }
}

--

{
  "items": [{
  	"menuItemId": 4, "quantity": 1
  }, {
    "menuItemId": 14, "quantity": 2
  }]
}

```
