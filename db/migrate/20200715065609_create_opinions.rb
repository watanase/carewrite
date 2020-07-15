class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.string :content
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
