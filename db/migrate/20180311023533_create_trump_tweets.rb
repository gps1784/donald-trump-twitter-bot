class CreateTrumpTweets < ActiveRecord::Migration
  def change
    create_table :trump_tweets, id: false do |t|
      t.integer  :id,           null: false, unique: true, options: 'PRIMARY KEY', limit: 8
      t.boolean  :parsed,       null: false
      t.integer  :retweets,     null: false, default: 0
      t.datetime :published_at, null: false
      t.text     :text,         null: false, limit: 511
    end
  end
end
