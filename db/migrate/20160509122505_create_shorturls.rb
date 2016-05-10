class CreateShorturls < ActiveRecord::Migration
  def change
    create_table :shorturls do |t|
      t.string :originalurl
      t.string :shorturl
      t.string :clicks
      t.string :uniq_id

      t.timestamps null: false
    end
  end
end
