module TotalPrice
	require 'nokogiri'
	require 'rss'
	require 'open-uri'

	def self.calculation policy, base_price
		total_price = 0
		base_price = base_price.to_i
		case policy
		
		when "Flexible"
			url = 'http://reuters.com'
			text = nokogiri_code url
			a_count = text.count('a')
		  	margin = a_count/100
		  	total_price = base_price * margin
		when "Fixed"
			url = 'https://developer.github.com/v3/#http-redirects'
			text = nokogiri_code url
			words = text.scan(/\w+/)
			count = words.count("status") #case sensitive
			margin = count
			total_price = base_price + margin
		when "Prestige"
			url = 'http://reuters.com'
			rss = RSS::Parser.parse('http://www.yourlocalguardian.co.uk/sport/rugby/rss/', false)
			pubDate_count = 0
			rss.items.each do |item|
				pubDate_count += 1 if item.respond_to? "pubDate"
			end
		  	margin = pubDate_count
		  	total_price = base_price + margin
		end
		total_price
	end

	def self.nokogiri_code url 
		html = open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
		doc = Nokogiri.HTML(html)
		doc.css('script').remove
		doc.css('style').remove 
		text  = doc.at('body').inner_text
	end
end