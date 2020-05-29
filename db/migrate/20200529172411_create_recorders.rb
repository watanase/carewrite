class CreateRecorders < ActiveRecord::Migration[5.2]
  def change
    create_table :recorders do |t|
      t.string :name, null:false
      t.string :password_digest, null:false
      t.references :companies, foreign_key: true

      t.timestamps
    end
  end
end
