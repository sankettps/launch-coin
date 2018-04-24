class HomeController < ApplicationController
	def homepage
		# xml = HTTParty.get("https://news.bitcoin.com/feed/").body
		# xml = HTTParty.get("https://cointelegraph.com/rss").body
		# puts "<**************************************#{xml}******************************>"
		# if xml.present?
		# 	@feed = Feedjira::Feed.parse(xml) rescue nil
		# 	@news_feeds = {}
		# 	if @feed.present?
		# 		puts "<=====================#{@feed.entries.first.image}===================>"
		# 		@feed.entries.first(2).each_with_index do |feed,index|
		# 			@news_feeds["#{index}"]={}
		# 			@news_feeds["#{index}"]["title"] = feed.title
		# 			@news_feeds["#{index}"]["description"] = feed.summary
		# 			@news_feeds["#{index}"]["published_at"] = feed.published
		# 			@news_feeds["#{index}"]["image"] = feed.image
		# 			# jQuery = RubyCheerio.new(feed.summary)
		# 			# @news_feeds["#{index}"]["image"] = jQuery.find('img')[0].prop('img','src')
		# 		end
		# 	end
		# end
		# puts "<=========ss============#{@news_feeds}===================>"
		# jQuery = RubyCheerio.new(@feed.entries.first.summary)
		# @image = jQuery.find('img')[0].prop('img','src')
		# render layout: false
	end
end
