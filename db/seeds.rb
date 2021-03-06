admin = User.find_or_create_by_name!(
  "admin",
   email: "example@railstutorial.org",
   password: "foobar",
   password_confirmation: "foobar"
) { |u| u.toggle!(:admin) }

tinamarie = User.find_or_create_by_name!(
  "Tinamarie",
  email: "tmcderm1@binghamton.edu",
  password: "password",
  password_confirmation: "password"
)

recipe_0 = Recipe.find_or_create_by_name!("Sweet Potato Hash Browns", 
  dish_type: "breakfast", season: "", diet: "vegetarian", 
  directions: "First you grate the sweet potatoes. Then you throw em in a frying pan. Then you add the juice from half a lemon and throw in some extra sharp cheddar cheese (or any cheese, depending on what you have on hand.). Just keep on frying it up until its a nice golden brown. Eat up!"
) { |r| r.user_id = tinamarie.id }
Ingredient.find_or_create_by_name!( "Sweet Potato", amount: "2", unit: "Large" ) { |i| i.recipe_id = recipe_0.id }
Ingredient.find_or_create_by_name!( "Lemon", amount: "1/2" ) { |i| i.recipe_id = recipe_0.id }
Ingredient.find_or_create_by_name!( "Extra Sharp Cheddar Cheese", amount: "A Handful" ) { |i| i.recipe_id = recipe_0.id }

recipe_1 = Recipe.find_or_create_by_name!("Egg Nog", 
  dish_type: "dessert", season: "winter", diet: "vegetarian",  gluten_free: true, raw: false,
  directions: "Mix the eggs, nutmeg, and sugar together until they foam, you can use an electric hand mixer, or just your hand! Add in the milk and continue mixing until all ingredients are blended well. Taste and be amazed at how easy it was to make your own! Try to use raw milk and farm fresh eggs from places you know and trust for the best egg nog, and because it's healthier! Serve and sprinkle with more nutmeg."
) { |r| r.user_id = tinamarie.id }

Ingredient.find_or_create_by_name!( "Eggs", amount: "6", unit: "Large" ) { |i| i.recipe_id = recipe_1.id }
Ingredient.find_or_create_by_name!( "Sugar", amount: "3/4", unit: "Cups" ) { |i| i.recipe_id = recipe_1.id }
Ingredient.find_or_create_by_name!( "Milk", amount: "4-5", unit: "Cups" ) { |i| i.recipe_id = recipe_1.id }
Ingredient.find_or_create_by_name!( "Nutmeg", amount: "1", unit: "Teaspoon" ) { |i| i.recipe_id = recipe_1.id }

recipe_2 = Recipe.find_or_create_by_name!("Energy Bites", 
  dish_type: "snack", season: "", diet: "vegan",  gluten_free: true, raw: true,
  directions: "You can add or take away some ingredients if you want to, to make it really tasty and nut allergy free you can replace the nut butter with tahini.\n First mix all the dry ingredients together in a bowl (oats, flax, cinnamon, cacao, and chocolate chips). You can also substitute the chocolate chips for raisins, cranberries, blueberries, or anything else you love. Meanwhile, melt together the wet ingredients on low to medium heat.\n Once you have melted the wet ingredients pour them over the dry ingredients and mix thoroughly. Once mixed, press into a large container (preferrably glass) and score into squares, balls, or bars (or any shape you want to have fun with!)\n Seal and cool in the fridge until hardened."
) { |r| r.user_id = tinamarie.id }
Ingredient.find_or_create_by_name!( "Rolled Oats", amount: "2", unit: "Cups" ) { |i| i.recipe_id = recipe_2.id }
Ingredient.find_or_create_by_name!( "Ground Flaxseeds", amount: "1/4", unit: "Cups" ) { |i| i.recipe_id = recipe_2.id }
Ingredient.find_or_create_by_name!( "Cinnamon", amount: "1/8", unit: "Cups" ) { |i| i.recipe_id = recipe_2.id }
Ingredient.find_or_create_by_name!( "Raw Cacao", amount: "1/8", unit: "Cups" ) { |i| i.recipe_id = recipe_2.id }
Ingredient.find_or_create_by_name!( "Mini Chocolate Chips", amount: "3/4", unit: "Cups" ) { |i| i.recipe_id = recipe_2.id }
Ingredient.find_or_create_by_name!( "Peanut Butter (or other nut butter)", amount: "1", unit: "Cup" ) { |i| i.recipe_id = recipe_2.id }
Ingredient.find_or_create_by_name!( "Raw local Honey, or Maple Syrup to make it vegan", amount: "2/3", unit: "Cups" ) { |i| i.recipe_id = recipe_2.id }
Ingredient.find_or_create_by_name!( "Vanilla", amount: "2", unit: "teaspoons" ) { |i| i.recipe_id = recipe_2.id }

recipe_3 = Recipe.find_or_create_by_name!("Yummy Oatmeal", 
  dish_type: "breakfast", season: "", diet: "vegan",  gluten_free: true, raw: false,
  directions: "Heat your choice of milk in a medium saucepan until it boils. Add in your oats and let simmer for about 5 minutes, or until they reach your desired consistancy. Add the rest of your ingredients. Adjust the amount of extra ingredients to your liking. I like to add a little bit more cold milk to cool down and add to thin out my oatmeal a bit."
) { |r| r.user_id = tinamarie.id }
Ingredient.find_or_create_by_name!( "Almond Milk", amount: "2", unit: "Cups" ) { |i| i.recipe_id = recipe_3.id }
Ingredient.find_or_create_by_name!( "Rolled Oats", amount: "1", unit: "Cup" ) { |i| i.recipe_id = recipe_3.id }
Ingredient.find_or_create_by_name!( "Cinnamon", amount: "1", unit: "Tablespoon" ) { |i| i.recipe_id = recipe_3.id }
Ingredient.find_or_create_by_name!( "Cacao Powder", amount: "1", unit: "Tablespoon" ) { |i| i.recipe_id = recipe_3.id }
Ingredient.find_or_create_by_name!( "Raisons or Dried Cranberries", amount: "1/4-1/2", unit: "Cups" ) { |i| i.recipe_id = recipe_3.id }
Ingredient.find_or_create_by_name!( "Chopped Walnuts", amount: "1/4-1/2", unit: "Cups" ) { |i| i.recipe_id = recipe_3.id }

recipe_4 = Recipe.find_or_create_by_name!("Roasted Butternut Squash", 
  dish_type: "side", season: "fall", diet: "vegan",  gluten_free: true, raw: false,
  directions: "Pre-heat oven to 425 degrees. Remove skin from butternut squash with a sharp knife. Compost seeds or use them in some other way. Cut squash into cubes, about 3/4 inch square or so. Mix all ingredients together and spread onto a cookie sheet. (Consider using foil on the sheet, or spraying with cooking oil for easier clean up.) Bake for 13 minutes, then flip cubes with a spatula. Bake for another 13-15 minutes. Remove from oven and enjoy!"
) { |r| r.user_id = tinamarie.id }
Ingredient.find_or_create_by_name!( "Butternut Squash", amount: "2", unit: "Cups" ) { |i| i.recipe_id = recipe_4.id }
Ingredient.find_or_create_by_name!( "Olive Oil", amount: "1", unit: "Tablespoon" ) { |i| i.recipe_id = recipe_4.id }
Ingredient.find_or_create_by_name!( "Salt and Pepper", amount: "To taste (try 1 tsp salt, 1/2 tsp pepper)" ) { |i| i.recipe_id = recipe_4.id }

Semester.find_or_create_by_id( 1, year: 2012, semester: 1, first_day: 243, last_day: 349 )
Semester.find_or_create_by_id( 2, year: 2013, semester: 0, first_day: 24, last_day: 130 )
Semester.find_or_create_by_id( 3, year: 2013, semester: 1, first_day: 238, last_day: 348 )
Semester.find_or_create_by_id( 4, year: 2014, semester: 0, first_day: 27, last_day: 129 )
Semester.find_or_create_by_id( 5, year: 2014, semester: 1, first_day: 245, last_day: 346 )

# Buy Bulk:
Website.find_or_create_by_name( "Frontier Co-Op", location: "Indiana", url: "http://www.frontiercoop.com", kind: "bulk" ) { |i| i.user_id = admin.id }
Website.find_or_create_by_name( "Mountian Rose Herbs", location: "Oregon", url: "http://www.mountainroseherbs.com", kind: "bulk" ) { |i| i.user_id = admin.id }
Website.find_or_create_by_name( "Starwest Botanical", location: "California", url: "http://www.starwest-botanicals.com", kind: "bulk" ) { |i| i.user_id = admin.id }
Website.find_or_create_by_name( "Tierra Farm", location: "New York", url: "http://www.tierrafarm.com", kind: "bulk" ) { |i| i.user_id = admin.id }

# Natural Body Care:
Website.find_or_create_by_name( "Earth Roots", location: "Asheville, NC", url: "http://www.earthrootsherbal.com", kind: "body" ) { |i| i.user_id = admin.id }
Website.find_or_create_by_name( "Wild Weeds", location: "Blue Lake, CA", url: "http://www.wildweeds.com", kind: "body" ) { |i| i.user_id = admin.id }

# Informational:
Website.find_or_create_by_name( "Susun Weed", location: "", url: "http://www.susunweed.com",  kind: "informational" ) { |i| i.user_id = admin.id }
Website.find_or_create_by_name( "Sage Mountian Retreat Center", location: "", url: "http://www.sagemountain.com", kind: "informational" ) { |i| i.user_id = admin.id }
Website.find_or_create_by_name( "Shalom Mountain Retreat Center", location: "", url: "http://www.shalommountain.com", kind: "informational" ) { |i| i.user_id = admin.id }
Website.find_or_create_by_name( "Mother Earth News", location: "", url: "http://www.motherearthnews.com", kind: "informational" ) { |i| i.user_id = admin.id }
Website.find_or_create_by_name( "SubMediaTV", location: "", url: "http://www.submedia.tv", kind: "informational" ) { |i| i.user_id = admin.id }

# Medicinal Herbs:
Book.find_or_create_by_name( "The Green Pharmacy", author: "James A. Duke", kind: "medicinal" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name( "Healing Wise", author: "Susun Weed", kind: "medicinal" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name( "Down There: Sexual and Reproductive Health the Wise Woman Way", author: "Susun Weed", kind: "medicinal" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name( "Herbal Recipes for Vibrant Health ", author: "Rosemary Gladstar", kind: "medicinal" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name( "Herbal Antibiotics", author: "James A. Duke", kind: "medicinal" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name( "Herbal Healing for Women", author: "Rosemary Gladstar", kind: "medicinal" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name( "Herbal Remedies for Children's Health", author: "Rosemary Gladstar", kind: "medicinal" ) { |i| i.user_id = admin.id }

# Environmental Authors/Books:
Book.find_or_create_by_name_and_author( name: "", author: "Michael Pollen", kind: "environmental" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name_and_author( name: "", author: "Derrick Jensen", kind: "environmental" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name_and_author( name: "", author: "Aric McBay", kind: "environmental" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name_and_author( name: "", author: "Edward Abbey", kind: "environmental" ) { |i| i.user_id = admin.id }
Book.find_or_create_by_name( "Animal, Vegetable, Miracle", author: "Barbara Kingslover", kind: "environmental" ) { |i| i.user_id = admin.id }

#Documentary Films
Movie.find_or_create_by_name( "Forks Over Knives", kind: "documentary" ) { |i| i.user_id = admin.id }
Movie.find_or_create_by_name( "Food Inc.", kind: "documentary" ) { |i| i.user_id = admin.id }
Movie.find_or_create_by_name( "Pickaxe", kind: "documentary", url: "http://www.youtube.com/watch?v=FIQZY593YGw" ) { |i| i.user_id = admin.id }
Movie.find_or_create_by_name( "END:CIV", kind: "documentary", url: "http://www.youtube.com/watch?v=3hx-G1uhRqA" ) { |i| i.user_id = admin.id }

#Movies
Movie.find_or_create_by_name( "Into the Wild", kind: "drama" ) { |i| i.user_id = admin.id }
Movie.find_or_create_by_name( "Bold Native", kind: "drama" ) { |i| i.user_id = admin.id }
Movie.find_or_create_by_name( "The Road", kind: "drama" ) { |i| i.user_id = admin.id }


# MENU

# Pizza
Product.find_or_create_by_name( "Smoked Mozzarella", food_type: "pizza", description: "Made with local and organic tomatoes and smoked mozzarella cheese", diet: "vegetarian", price: "5" ) 
Product.find_or_create_by_name( "Raw Milk Cheddar", food_type: "pizza", description: "Made with local and organic tomatoes and raw milk cheddar cheese", diet: "vegetarian", price: "5" ) 
Product.find_or_create_by_name( "vegan Mozzarella", food_type: "pizza", description: "Made with local and organic tomatoes and daiya mozzarelle style shreds", diet: "vegan", price: "5" ) 

# Beverages
Product.find_or_create_by_name( "Edensoy Chocolate Soymilk", food_type: "beverage", description: "Organic and delicious", diet: "vegan", price: "1.33" ) 
Product.find_or_create_by_name( "Edensoy Extra Original Soymilk", food_type: "beverage", description: "Organic and delicious", diet: "vegan", price: "1.33" ) 
Product.find_or_create_by_name( "Edensoy Extra Vanilla Soymilk", food_type: "beverage", description: "Organic and delicious", diet: "vegan", price: "1.33" ) 
Product.find_or_create_by_name( "GT's Kombucha", food_type: "beverage", description: "An organic and raw effervescent fermented tea-based beverage", diet: "vegan", price: "3.52" ) 
Product.find_or_create_by_name( "Guyaki Yerba Mate", food_type: "beverage", description: "Organic and Fair Trade tea (contains caffeine)", diet: "vegan", price: "2.71" ) 
Product.find_or_create_by_name( "Mamma Chia (various flavors)", food_type: "beverage", description: "A chia seed based beverage made with organic ingredients. Contains 2000mg of Omega-3s, 10g fiber, 4g protein, and high in antioxidants", diet: "vegan", price: "3.13" ) 
Product.find_or_create_by_name( "Oogave", food_type: "beverage", description: "Organic agave sweetened soda (we carry Grapefruit, Root Beer, and Cola)", diet: "vegan", price: "1.57" ) 
Product.find_or_create_by_name( " Red Jacket Orchards Apple Cider", food_type: "beverage", description: "Fresh pressed juice from Geneva, NY", diet: "vegan", price: "1.79" ) 
Product.find_or_create_by_name( "Red Jacket Orchards Raspberry Apple Juice", food_type: "beverage", description: "Fresh pressed juice from Geneva, NY", diet: "vegan", price: "1.79" ) 
Product.find_or_create_by_name( "Red Jacket Orchards Strawberry Apple Juice", food_type: "beverage", description: "Fresh pressed juice from Geneva, NY", diet: "vegan", price: "1.79" ) 
Product.find_or_create_by_name( "Steaz Green Tea Raspberry Soda", food_type: "beverage", description: "Made with organic and fair trade ingredients and fortified with B vitamins", diet: "vegan", price: "1.57" ) 

# Dessert & Snacks

Product.find_or_create_by_name( "Luna Bar", food_type: "dessert_or_snack", description: "Tasty whole nutrition bars made with 70% organic ingredients (we have many flavors!)", diet: "vegan", price: "1.58" )
Product.find_or_create_by_name( "Luna & Larry's Coconut Bliss Bar", food_type: "dessert_or_snack", description: "Fair trade & organic frozen treats (Naked Coconut or Dark Chocolate)", diet: "vegan", price: "1.59" )
Product.find_or_create_by_name( "Raw Revolution Bars", food_type: "dessert_or_snack", description: "Organic live food bar (chocolate hazelnut and chocolate coconut)", diet: "vegan", price: "2.07" )
Product.find_or_create_by_name( "Z Bars", food_type: "dessert_or_snack", description: "Organic snack bar (various flavors)", diet: "vegan", price: "0.93" )
