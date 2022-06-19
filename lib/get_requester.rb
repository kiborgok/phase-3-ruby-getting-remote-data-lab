# Write your code here
require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class GetRequester
    attr_reader :url
    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(self.url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        data = JSON.parse(self.get_response_body)
        data.collect{|item| item}
    end
end

# Binding.pry