class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.integer :position, null: false
      t.references :game, index: true, null: false, foreign_key: true
      t.references :correct_choice, null: true, foreign_key: { to_table: :choices }

      t.timestamps
    end
  end
end
