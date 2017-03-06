class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user, index: true
      t.integer :destroyes_subs
      t.boolean :win

      t.timestamps
    end
  end
end
