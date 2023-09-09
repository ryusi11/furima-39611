FactoryBot.define do
  factory :order_location do
    code     {Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s}
    place_id {Faker::Number.between(from: 2, to: 48)}
    city     {Faker::Address.city}
    street   {Faker::Address.street_address}
    building {Faker::Address.street_address}
    phone    {Faker::Number.number(digits: rand(10..11)).to_s}
    token    {Faker::Internet.password}
  end
end