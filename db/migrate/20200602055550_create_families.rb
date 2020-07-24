class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string          :name, null:false
      t.string          :furigana
      t.string          :phone
      t.string         :zipcode
      t.string          :street_address
      t.string          :relationship
      t.text            :information
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
