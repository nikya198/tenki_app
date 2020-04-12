class CreatePrefectures < ActiveRecord::Migration[5.1]
  def change
    create_table :prefectures do |t|
      t.string :prefectureId
      t.string :prefectureName

      t.timestamps
    end
  end
end
