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

Semester.find_or_create_by_id( 1, year: 2012, semester: 1, first_day: 243, last_day: 349 )
Semester.find_or_create_by_id( 2, year: 2013, semester: 0, first_day: 24, last_day: 130 )
Semester.find_or_create_by_id( 3, year: 2013, semester: 1, first_day: 238, last_day: 348 )
Semester.find_or_create_by_id( 4, year: 2014, semester: 0, first_day: 27, last_day: 129 )
Semester.find_or_create_by_id( 5, year: 2014, semester: 1, first_day: 245, last_day: 346 )
