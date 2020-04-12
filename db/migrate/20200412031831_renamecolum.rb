class Renamecolum < ActiveRecord::Migration[5.1]
  def change
    rename_column :prefectures, :prefectureId, :prefecture_id
    rename_column :prefectures, :prefectureName, :prefecture_name
    rename_column :cities, :cityName, :city_name
    rename_column :cities, :cityId, :city_id
    rename_column :cities, :wardId, :ward_id
    rename_column :cities, :prefectureId, :prefecture_id
  end
end
