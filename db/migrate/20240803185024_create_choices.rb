class CreateChoices < ActiveRecord::Migration[7.2]
  def change
    create_table :choices do |t|
      t.string :text, null: false
      t.integer :position, null: false
      t.references :question, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
