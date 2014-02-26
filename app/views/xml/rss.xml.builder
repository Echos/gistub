xml.instruct! :xml, :version => "1.0" 
xml.rss("version"    => '2.0',
		 ) do
			  xml.channel do
				  xml.title "Gistub RSS"
				  xml.link (request.protocol + request.host_with_port + url_for(:rss => nil))
				  xml.description "新着 Gistです"
				  xml.language "ja-ja"
				  xml.ttl "40"
				  xml.pubDate(Time.now.to_s(:rfc822))

				  for gist in @gists
					  xml.item do
						  xml.title gist.title
						  if gist.user
							  xml.description "#{gist.user.nickname}が投稿"
						  else
							  xml.description "名無しさんが投稿"
						  end
						  xml.pubDate gist.created_at.to_s(:rfc822)
						  xml.link (request.protocol + request.host_with_port + '/gists/' + gist.id.to_s)
						  xml.guid request.protocol + request.host_with_port + '/gists/' + gist.id.to_s, :isPermaLink => 'true'
					  end
				  end
			  end
		  end
