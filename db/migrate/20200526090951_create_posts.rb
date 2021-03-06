class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string  :focus
      t.text    :content
      t.datetime :datetime, default: -> { 'NOW()' }
      t.string  :name

      t.timestamps
    end
  end
end
