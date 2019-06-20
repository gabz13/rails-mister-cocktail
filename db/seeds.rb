require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized = open(url).read
ingredient = JSON.parse(serialized)

ingredient["drinks"].each do |hash|
   # {"strIngredient1"=>"Light rum"}
   ingredient_name = hash["strIngredient1"]

   ingredient_instance = Ingredient.create(name: ingredient_name)
   puts "Created a #{ingredient_instance.name}"
 end
