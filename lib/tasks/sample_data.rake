namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
                 
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    test_user = User.create!(name: "Test",
                 email: "test@gmail.com",
                 password: "password",
                 password_confirmation: "password")
    recipe = test_user.recipes.create(name: "Sweet Potato Hash Browns", 
      dish_type: "breakfast", season: "any", diet: "vegetarian", directions:
      "First you grate the sweet potatoes. Then you throw em in a frying pan. Then you add the juice from half a lemon and throw in some extra sharp cheddar cheese (or any cheese, depending on what you have on hand.). Just keep on frying it up until its a nice golden brown. Eat up!"
      )
    recipe.ingredients.create(
      name: "Sweet Potato", amount: "2", 
      unit: "Large"
    )
    recipe.ingredients.create(
      name: "Lemon", amount: "1/2"
    )
    recipe.ingredients.create(
      name: "Extra Sharp Cheddar Cheese", amount: "A Handful"
    )
      
  end
end

