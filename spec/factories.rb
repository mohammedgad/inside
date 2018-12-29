FactoryBot.define do
  factory :coach do
    name  { Faker::StarWars.character }
  end

  factory :student do
    name  { Faker::StarWars.character }
  end
end