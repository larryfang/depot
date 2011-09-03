require "spec_helper"

describe "products/index.html.erb" do

  it "should display all products with image and product name" do
    products=[]
    product = mock_model(Product,
    :title =>"ruby cookbook",
    :image_url => "http://www.abc.com",
    :description => "it's a book about how to do ruby'")
    assign(:products, products<<product)
    render
    rendered.should contain("Listing products")
  end
end