class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def total
    self.item.price * quantity
  end
  
end
