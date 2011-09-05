require 'spec_helper'

describe "store/index.html.erb" do
  it "display all products order by product title" do
    products=[]
    product = mock_model(Product,
                         :title =>"ruby cookbook",
                         :image_url => "http://www.abc.com",
                         :description => "it's a book about how to do ruby'",
                         :price => 12.6)
    assign(:products, products<<product)
    render
    rendered.should contain(product.title)
    rendered.should contain(product.description)
    rendered.should contain(product.price.to_s)
  end
end

