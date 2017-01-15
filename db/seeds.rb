# User.destroy_all
Collection.destroy_all
Category.destroy_all
# Product.destroy_all
# Collectioner.destroy_all
# Interview.destroy_all

# USER - should not work as not in array + should print and save token
password = '12345678'
p user     = User.create(email: 'me@me.com', password: password)
p user     = User.create(email: 'yo@me.com', password: password)
p user     = User.create(email: 'to@me.com', password: password)
p "token to be recorded: #{user.tokens}"

# CATEGORIES
['fashion', 'men', 'women', 'furniture', 'clothing', 'shoes', 'art', 'decoration'].each do |category|
  p Category.create(name: category)
end

# COLLECTIONER
5.times do
  first_name  = Faker::Name.first_name
  last_name   = Faker::Name.last_name
  email       = Faker::Internet.email
  p Collectioner.create(
      first_name: first_name,
      last_name: last_name,
      email: email
    )
end

# COLLECTION
10.times do
  color_light  = Faker::Color.hex_color
  color_dark   = Faker::Color.hex_color
  is_live      = [true, false, true].sample
  title        = Faker::Name.title
  collectioner = Collectioner.all.sample
  p Collection.create(
      collectioner: collectioner,
      color_light: color_light,
      is_live: is_live,
      color_dark: color_dark,
      title: title
    )
end

# PRODUCT
150.times do
  title       = Faker::Commerce.product_name
  collection  = Collection.all.sample
  price       = Faker::Commerce.price.to_f
  is_live     = [true, false].sample
  description = Faker::Hipster.sentences(4).join(' ')
  shop_url    = Faker::Internet.url('mock.com')
  product = Product.create(
      title: title,
      price: price,
      is_live: is_live,
      description: description,
      collection: collection,
      shop_url: shop_url
  )
  # should randomize sample(2) categories to check whether works for all configurations (including 0?)
  product.categories << Category.all.sample((1..3).to_a.sample)
  p product
end

# INTERVIEW
Collection.all.each do |collection|
  placement = 0
  (1..3).to_a.sample.times do
    question  = "#{Faker::Hipster.words(6).join(' ')}?"
    answer    = Faker::Hipster.sentences(8).join(' ')
    placement += 1
    picture   = "random picture"
    interview = Interview.create(
      collection: collection,
      question: question,
      answer: answer,
      placement: placement,
      picture: picture
    )
    p interview
  end
end


# Newsletter.create(email:"adrien.devilloutreys@fifty-five.com")











