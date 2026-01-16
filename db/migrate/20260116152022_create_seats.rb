class CreateSeats < ActiveRecord::Migration[8.1]
  def change
    create_table :seats do |t|
      t.belongs_to :match, null: false, foreign_key: true
      t.belongs_to :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
