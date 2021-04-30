class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :original_url, null: false
      t.string :shortened_url, null: false, unique: true, index: true
      t.string :password, null: false

      t.timestamps
    end
  end
end
