FactoryBot.define do
  factory :goal do
    public? { true }
    user_id { 1 }
    description { Faker::JapaneseMedia::OnePiece.quote }
  end
end
