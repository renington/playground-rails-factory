require 'httparty'
require 'VCR'

describe 'HTTParty' do
    it 'content-type' do
      stub_request(:get, "https://jsonplaceholder.typicode.com/posts/3").to_return(status: 200, body: "", headers: { 'content-type' : 'application/json'})

      VCR.use_cassette('jsonplaceholder/posts') do
        response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/3")
        content_type = response.headers['content-type']
        expect(content_type).to match(/application\/json/)
       end
    end
end