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
end
