class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string          :name, null:false
      t.string          :hurigana
      t.integer         :phone
      t.integer         :zipcode
      t.string          :street_address
      t.string          :relationship
      t.text            :information

      t.timestamps
    end
  end
end
