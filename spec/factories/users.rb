FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password  {"Yatuhashi09"}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"一真"}
    L_name {"ヤマダ"}
    F_name {"カズマ"}
    birthday {"1999-01-24"}
  end
end