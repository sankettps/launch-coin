class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_news_feed

  def set_news_feed
			@news_feeds = {}
  # 	xml = HTTParty.get("https://cointelegraph.com/rss").body
		# if xml.present?
		# 	@feed = Feedjira::Feed.parse(xml) rescue nil
		# 	@news_feeds = {}
		# 	if @feed.present?
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
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :mobile_no])
  end
end
