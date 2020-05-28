class AddNameToPostReaders < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_readers, :companies, foreign_key: true
  end
end
