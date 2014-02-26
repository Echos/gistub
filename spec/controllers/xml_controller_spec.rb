require 'spec_helper'

describe XmlController do

  describe "GET 'rss'" do
    it "returns http success" do
      get 'rss'
      response.should be_success
    end
  end

end
