class CreateBillboardSongs < ActiveRecord::Migration
  def change
    create_table :billboard_songs do |t|
      t.string    :track, null: false
      t.string    :artist, null: false
      t.integer   :day
      t.string    :month
      t.integer   :year

      t.timestamps null: false
    end
  end
end
