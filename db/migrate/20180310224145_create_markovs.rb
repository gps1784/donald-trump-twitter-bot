class CreateMarkovs < ActiveRecord::Migration
  def change
    create_table :markovs do |t|
      t.string  :current,                    null: false
      t.string  :next,                       null: false
      t.integer :frequency,  default: 0,     null: false
      t.boolean :recent,     default: false, null: false
      t.integer :anger,      default: 0,     null: false
      t.integer :fear,       default: 0,     null: false
      t.integer :joy,        default: 0,     null: false
      t.integer :sadness,    default: 0,     null: false
      t.integer :analytical, default: 0,     null: false
      t.integer :confident,  default: 0,     null: false
      t.integer :tentative,  default: 0,     null: false
    end
    add_index :markovs, :current
  end
end
