class CreateNotepadPages < ActiveRecord::Migration[6.0]
  def change
    create_table :notepad_pages do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.text :content
      t.references :notepad, null: false

      t.timestamps
    end
  end
end
