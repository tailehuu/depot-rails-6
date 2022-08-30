class CombineItemsInCart < ActiveRecord::Migration[6.0]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          # delete all
          cart.line_items.where(product_id: product_id).delete_all

          # create new line_item with quantity = quantity
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    LineItem.where('quantity > 1').each do |line_item|
      line_item.quantity.times do
        # create n times
        LineItem.create!(
          product_id: line_item.product_id,
          cart_id: line_item.cart_id,
          quantity: 1
        )
      end

      # delete line_item
      line_item.destroy
    end
  end
end
