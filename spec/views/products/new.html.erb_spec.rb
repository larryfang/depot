require "spec_helper"

describe "products/new.html.erb" do
  let(:product) {stub_model(Product,
                         :title =>"jquery cookbook",
                         :image_url => "http://www.abc.com",
                         :description => "it's a book about how to do ruby'",
                         :price => 12.3)
                  }
  before do
    assign(:product, product.as_new_record)
  end
  it "renders a form to create a new product" do

    render
    rendered.should have_selector("form",
                                  :method=> "post",
                                  :action=> products_path
                    ) do |form|
      form.should have_selector("input", :type=>"submit")
      form.should have_selector("input", :id=>"product_title",
                                :name=>"product[title]")
    end
  end

  it "renders a text field with price" do
    #the following method is only useful when using mock_model
    #product.stub(:price).and_return(12.3)
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input",
                              :name =>"product[price]",
                              :value=> "12.3")
    end
  end
end