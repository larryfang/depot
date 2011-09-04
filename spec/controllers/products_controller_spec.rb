require 'spec_helper'

describe ProductsController do
  describe "index" do
    it "lists all the products with image, title and price information" do
      product = mock_model(Product,
                           :title =>"ruby cookbook",
                           :image_url => "http://www.abc.com",
                           :description => "it's a book about how to do ruby'",
                           :price => "12.8")
      products = []
      3.times { products << product }
      products.size.should == 3
      Product.should_receive(:all).and_return(products)
      post :index
    end
  end
  describe "post create" do
    context "when save is successful" do
      it "create a new product" do
        product = mock_model(Product)
        Product.should_receive(:new).and_return(product)
        product.should_receive(:save).and_return(true)
        post :create, :product=> {:title =>"ruby cookbook",
                                  :image_url => "http://www.abc.com",
                                  :description => "it's a book about how to do ruby'",
                                  :price => 12.8}
        response.should redirect_to(product_path(assigns(:product)))
      end
    end

    context "when save is unsuccessful" do
      it "create a new product" do
        product = mock_model(Product)
        Product.should_receive(:new).and_return(product)
        product.should_receive(:save).and_return(false)
        post :create, :product=> {:title =>"ruby cookbook",
                                  :image_url => "http://www.abc.com",
                                  :description => "it's a book about how to do ruby'",
                                  :price => 12.8}
        response.should render_template("new")
      end
    end


  end
end
