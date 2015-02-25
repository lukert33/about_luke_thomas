class CreateRatios < ActiveRecord::Migration
  def change
    create_table :ratios do |t|
      t.float  :number, null: false
      t.text   :description, null: false

      t.timestamps null: false
    end
  end
end
