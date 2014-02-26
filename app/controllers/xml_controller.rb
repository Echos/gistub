class XmlController < ApplicationController
  def rss
    @feed_title = "gistub RSS"
    @gists = Gist.recent.page(1).per(10)

	  render :layout => false

  end
end
