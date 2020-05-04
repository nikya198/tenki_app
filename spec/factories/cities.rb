FactoryBot.define do
    factory :city1, class: City do
      city_id {"4610"}
      city_name {"川崎市 中原区"}
      prefecture_id {"14"}
      ward_id {"14133"}
    end
    factory :city2, class: City do
        city_id {"4610"}
        city_name {"横浜市 西区"}
        prefecture_id {"14"}
        ward_id {"14103"}
      end
    factory :city3, class: City do
      city_id {"4410"}
      city_name {"渋谷区"}
      prefecture_id {"13"}
      ward_id {"13133"}
    end
    factory :city4, class: City do
        city_id {"4610"}
        city_name {"文京区"}
        prefecture_id {"13"}
        ward_id {"13105"}
    end
end