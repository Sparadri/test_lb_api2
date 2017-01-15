# add all number of products

json.nb_products Product.where(is_live: true).length

# current user information
json.current_user do
  json.partial! partial: './api/v1/shared/current_user', locals: { current_user: @current_user }
end

# categories information
json.set! :categories do
  Category.all.each do |category|
    json.set! category.id.to_s.to_sym do
      json.partial! partial: './api/v1/shared/category', locals: { category: category }
    end
  end
end

# collectioners information
json.collectioners do
  Collectioner.all.each do |collectioner|
    json.set! collectioner.id.to_s.to_sym do
      json.partial! partial: './api/v1/shared/collectioner', locals: { collectioner: collectioner }
    end
  end
end

# product information
json.products do
  @filtered_products.each do |product|
    json.set! product.id.to_s.to_sym do

      json.details do
        json.partial! partial: './api/v1/shared/product', locals: { product: product }
      end

      json.collectioner do
        json.partial! partial: './api/v1/shared/collectioner', locals: { collectioner: product.collection.collectioner }
      end

      json.collection do
        json.partial! partial: './api/v1/shared/collection', locals: { collection: product.collection }
      end

      json.categories do
        product.categories.each do |category|
          json.set! category.id.to_s.to_sym do
            json.partial! partial: './api/v1/shared/category', locals: { category: category }
          end
        end
      end
    end
  end
end
