require 'spec_helper'

describe StoreController do

  describe "GET 'index'" do
    it "should be successful" do
      Product.should_receive(:order)
      get 'index'
      response.should be_success
    end
  end

end
