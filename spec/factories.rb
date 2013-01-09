FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@gmail.com" }
    password              "password"
    password_confirmation "password"
  end
  
  factory :recipe do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Recipe ##{n}" }
    user
    dish_type "breakfast"
    season ""
    diet "vegetarian"
    directions "First you grate the sweet potatoes. Then you throw em in a frying pan. Then you add the juice from half a lemon and throw in some extra sharp cheddar cheese (or any cheese, depending on what you have on hand.). Just keep on frying it up until its a nice golden brown. Eat up!"
  end
  
  factory :ingredient do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Ingredient ##{n}" }
    recipe
    amount "5"
  end
  
  factory :suggestion do
    sequence(:id) { |n| n }
    name Faker::Name.name
    sequence(:email) { |n| "johnsmith#{n}@gmail.com" }
    sequence(:message) { |n| "This message is ##{n}" }
  end
end
