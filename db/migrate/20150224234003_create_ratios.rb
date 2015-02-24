class CreateRatios < ActiveRecord::Migration
  def change
    create_table :ratios do |t|
      t.float  :number
      t.text   :description

      t.timestamps null: false
    end
  end
end
