class ChangeRatioNumtype < ActiveRecord::Migration
  def change
    change_column :ratios, :number, :string
    add_column :ratios, :numfloat, :float
  end
end
