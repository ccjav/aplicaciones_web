class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :twitter_user, index: true
      t.string :tweets
      
      t.timestamps
    end
  end
end
