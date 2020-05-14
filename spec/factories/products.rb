FactoryBot.define do
  factory :product do
    product_name      {"hoge"}
    explanation       {Faker::Lorem.sentence}
    status            {"新品、未使用"}
    postage           {"送料込み（出品者負担）"}
    delivery_method   {"レターパック"}
    delivery_origin   {"1"}
    arrival_date      {"４〜７日で発送"}
    price             {"9999"}
    buyer_id          {1}

    # アソシエーション
    user
    category

    # 1枚の画像をアップロードする
    trait :product do
      after(:build) do |item|
        File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
          item.images.attach(io: f, filename: "Unknown.jpeg", content_type: 'image/jpeg')
        end
      end
    end

    # 11枚の画像をアップロードする
    trait :product do
      after(:build) do |item|
        11.times do
          File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
            item.images.attach(io: f, filename: "Unknown.jpeg", content_type: 'image/jpeg')
          end
        end
      end
    end
  end
end