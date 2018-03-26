class HomeController < ApplicationController
	def homepage
		xml = HTTParty.get("https://news.bitcoin.com/feed/").body
		# puts "<**************************************#{xml}******************************>"
		@feed = Feedjira::Feed.parse(xml)
		puts "<=====================#{@feed.entries.first(4)}===================>"
		@news_feeds = {}
		@feed.entries.first(4).each_with_index do |feed,index|
			@news_feeds["#{index}"]={}
			@news_feeds["#{index}"]["title"] = feed.title
			@news_feeds["#{index}"]["description"] = feed.summary
			jQuery = RubyCheerio.new(feed.summary)
			@news_feeds["#{index}"]["image"] = jQuery.find('img')[0].prop('img','src')
		end
		puts "<=========ss============#{@news_feeds}===================>"
		# jQuery = RubyCheerio.new(@feed.entries.first.summary)
		# @image = jQuery.find('img')[0].prop('img','src')
		render layout: false
	end
end
