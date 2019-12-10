class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :cityName
      t.string :cityId

      t.timestamps
    end
  end
end
