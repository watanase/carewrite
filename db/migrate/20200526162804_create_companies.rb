class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :password_digest, null:false
      t.string :name, null:false

      t.timestamps
    end
  end
end
