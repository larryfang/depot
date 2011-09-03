require "spec_helper"

describe "products/new.html.erb" do

  it "renders a form to create a new product" do
    product = mock_model(Product,
                         :title =>"jquery cookbook",
                         :image_url => "http://www.abc.com",
                         :description => "it's a book about how to do ruby'",
                         :price => 12.34)
    assign(:product, product.as_new_record)
    render
    rendered.should have_selector("form",
                                  :method=> "post",
                                  :action=> products_path
                    ) do |form|
      form.should have_selector("input", :type=>"submit")
      form.should have_selector("input", :id=>"product_title", :name=>"product[title]")
    end
  end
end