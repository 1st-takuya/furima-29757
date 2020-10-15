FactoryBot.define do
  factory :order_address do
    token          {"tok_abcdefghijk00000000000000000"}
    postal_code    { "123-4567" }
    shipping_id    { 1 }
    municipality   { "名古屋" }
    house_number   {"1-2-3"} 
    phone_number   { "09012345678" }
  end
end
