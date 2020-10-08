FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}                 # 修正前
    email                 {"aaa@gmail.com"}                                 #{Faker::Internet.free_email}     修正前
    password              {"aaa111"}                                        #{Faker::Internet.password(min_length: 6)}          修正前
    password_confirmation {password}                                        #{"000000"}           修正前
    first_name            {"山田"}                                           #{Faker::Name.first_name}
    last_name             {"太郎"}                                           #{Faker::Name.last_name }
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birth_day             {"2020-10-31"}                                    #{Faker::Date.birthday(min_age:18, max_age:65 )} 
  end
end