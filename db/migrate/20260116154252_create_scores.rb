class CreateScores < ActiveRecord::Migration[8.1]
  def change
    create_table :scores do |t|
      t.belongs_to :round, null: false, foreign_key: true
      t.belongs_to :player, null: false, foreign_key: true
      t.integer :knocks, null: false, default: 0
      t.integer :clean_canastas, null: false, default: 0
      t.integer :dirty_canastas, null: false, default: 0
      t.integer :full_canastas, null: false, default: 0
      t.integer :half_canastas, null: false, default: 0
      t.integer :card_points, null: false, default: 0
      t.integer :debt_points, null: false, default: 0

      t.timestamps
    end
  end
end
