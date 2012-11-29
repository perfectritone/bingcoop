FactoryGirl.define do
  factory :user do
    name                  "David Frey"
    email                 "dfrey1@binghamton.edu"
    password              "thisismypassword"
    password_confirmation "thisismypassword"
  end
end
