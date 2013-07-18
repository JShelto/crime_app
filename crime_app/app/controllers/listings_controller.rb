class ListingsController < ApplicationController

	def index
		@listings =[]
		# url = open("http://sfbay.craigslist.org/sfc/apa/")
		url = open("craigslist.html")
		url_data = Nokogiri::HTML(url)
		url_data.css(".row").each do |x|
			# x.css("a").each {|a| a["href"] = a["href"].insert(0,"http://sfbay.craigslist.org")}
			l = {}
			l[:link] = x.css('a')[1].attr('href')
			l[:title] = x.css('a')[1].text()
			l[:c_hood] = x.css('small').text().lstrip().sub(/\(/,'').sub(/\)/,'') 
			hood = Neighborhood.find_by_name( l[:c_hood].to_s )
			l[:info] = x.css('.pnr').text
			l[:crime_percentage] = hood.crime_percentage() unless hood.nil? 
			@listings <<  l
		end
		# @hood = Neighborhood.find_by_name 'bayview'
		# @percents = @hood.crime_percentage()

	end

	# def show
	# 	@next = ""
	# 	url = open("index.html")
	# 	url_data = Nokogiri::HTML(url)
	# 	url_data.css(".row").each do |x|
	# 	@next += x.to_html
	# 	end
	# end
	

end
