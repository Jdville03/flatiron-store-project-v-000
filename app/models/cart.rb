class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
    if line_item = self.line_items.find_by(item_id: item_id)
      line_item.quantity += 1
      line_item
    else
      self.line_items.build(item_id: item_id)
    end
  end

  def total
    self.line_items.inject(0){|sum, line_item| sum + line_item.total}
  end

  def checkout
    remove_inventory
    self.user.remove_cart
    self.update(status: 'submitted')
  end

  private

    def remove_inventory
      self.line_items.each do |line_item|
        line_item.item.remove(line_item.quantity)
      end
    end

end
