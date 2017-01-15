  json.id         category.id
  json.name       category.name
  json.created_at category.created_at

  json.nb_products category.products.where(is_live: true).length
