require 'spec_helper'

describe ProductsController do
   describe "index" do
     it "lists all the products with image, title and price information"

   end
   describe "create" do
     it "create a new product" do
       product = mock_model(Product)
       Product.should_receive(:new).and_return(product)
       product.should_receive(:save)
       post :create, :product=> {:title =>"jquery cookbook",
                         :image_url => "http://www.abc.com",
                         :description => "it's a book about how to do ruby'",
                         :price => 12.3}
     end

   end
end
