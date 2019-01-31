require 'net/http'

module RemoteData

  # fetch data from URI and return xml root
  def self.fetch(uri)
    response = Net::HTTP.get_response(uri).body
    Nokogiri::XML(response).root
  end
end
