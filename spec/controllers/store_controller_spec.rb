require 'spec_helper'

describe StoreController do
  render_views
  describe "GET 'index'" do
    it "should be successful" do
      products=[]
      product = mock_model(Product,
                           :title =>"ruby cookbook",
                           :image_url => "http://www.abc.com",
                           :description => "it's a book about how to do ruby'",
                           :price => 12.6)
      @products = Product.stub(:order).and_return(products << product)
      get 'index'
      response.should be_success
      response.should have_selector('h3', :content => 'ruby cookbook')
      response.should have_selector('.price', :content => '12.6')
    end
  end

end
