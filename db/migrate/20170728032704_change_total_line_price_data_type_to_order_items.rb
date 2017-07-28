class ChangeTotalLinePriceDataTypeToOrderItems < ActiveRecord::Migration
  def change
    change_column :order_items, :total_line_price, :decimal
  end
end
