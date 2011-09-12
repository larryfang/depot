module CartsHelper
  def calculate
   cart =  Cart.find(session[:cart_id])
   cart.line_items.inject(0) do |total,item|
     total + item.product.price * item.quantity
   end

  end
end
