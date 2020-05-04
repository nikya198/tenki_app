FactoryBot.define do
    factory :prefecture1, class: Prefecture do
      prefecture_name {'東京'}
      prefecture_id {'13'}
    end
    factory :prefecture2, class: Prefecture do
        prefecture_name {"神奈川"}
        prefecture_id {'14'}
    end
end