class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string          :name, null:false
      t.string          :hurigana
      t.string          :password_digest, null:false
      t.references      :company, foreign_key: true
      t.integer         :gender
      t.date            :birthday
      t.integer         :zipcode
      t.string          :street_address
      t.integer         :care_required
      t.integer         :status
      t.date            :occupancy
      t.integer         :room_number
      t.string          :login_id,  null:false, unique:true

      t.timestamps
    end
  end
end
