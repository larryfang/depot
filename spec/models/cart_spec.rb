require 'spec_helper'

describe Cart do
  it "should have multiple line items created" do
    cart = Cart.create
    line_item1 =  LineItem.create(:product_id => 1, :cart => cart)
    line_item2 =  LineItem.create(:product_id => 2, :cart => cart)
    cart.line_items.find_by_product_id(1).should_not be_nil
    cart.line_items.find_by_product_id(2).should_not be_nil

  end
end
