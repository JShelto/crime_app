require 'net/http'
require 'json'


			# get access to your models and environment by making tasks dependent on the environment task
	task :crime_get => :environment do	
		url_string = 	http://data.sfgov.org/resource/tmnf-yvry.json?$$app_token=ocZnsjiY6hEf8Q1fdcNkxh5r2
		url = URI.parse(url_string)
			#performs basic authentication of the uri
		req = Net::HTTP::Get.new(url_string)
    	res = Net::HTTP.start(url.host, url.port) {|http|
      	http.request(req)
    	}

    	 a = res.body # returns the body of the response
    	 b = JSON.parse(a, :symbolize_names => 1) #takes the values returned from a and parses the json, returning symbols for the names (keys) in a JSON object
	
		# takes the date, category, and coordinate data from the larger hash of sf crime data
    	b[:crime_get].each do |crime|
         crime_incidence_hash= {}
         crime_incidence_hash[:category] = crime[:category]
         crime_incidence_hash[:date] = crime[:date]
         crime_incidence_hash[:x_coordinate] = crime[:x]
         crime_incidence_hash[:y_coordinate] =crime[:y]
         @crime = Crime.new(crime_incidence_hash)

	end 