json.user do
  json.partial! partial: './api/v1/shared/current_user', locals: { current_user: @current_user }
end

json.details do
  json.partial! partial: './api/v1/shared/collection', locals: { collection: @collection }
end

json.collectioner do
  json.partial! partial: './api/v1/shared/collectioner', locals: { collectioner: @collection.collectioner }
end

json.products do
  @collection.products.each do |product|
    json.set! product.id.to_s.to_sym do
      json.partial! partial: './api/v1/shared/product', locals: { product: product }
    end
  end
end

