module ApplicationHelper
	def formatted_website(website)
		unless website[/\Ahttp:\/\//] || website[/\Ahttps:\/\//]
      "http://#{website}"
    else
    	website
    end
	end
end
