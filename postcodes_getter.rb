require 'httparty'
require 'json'


class Postcodesio
	include HTTParty
	#json parsing - JSON.parse()

	base_uri 'https://api.postcodes.io'

	def single_postcodes(postcode)
		#looking at self class method of module namespace - referring to HTTParty (class of the class)
		self.class.get("/postcodes/#{postcode}")#double quotes for stringinterpolation
	end

	def multiple_postcodes(postcodes_array)
		JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
	end

	def print_headers
	end

end

x = Postcodesio.new
puts x.single_postcodes('en35qj')
# puts x.multiple_postcodes(["en35qj","se96rj"])

# parse json to use in ruby data

# x.multiple_postcodes(["en35qj","se96rj"]).each do |k,v|
# 		puts k

# 		if(v.class == Hash)
# 			v.each do |key,value|
# 				puts key,value
# 			end
# 		else
# 			puts v
# 		end
# 	end
