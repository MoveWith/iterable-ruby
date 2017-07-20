require 'spec_helper'

describe Iterable::Services::CommerceService do
  before(:each) do
    @request = double('http request', :user => nil, :password => nil, :url => 'http://example.com', :redirection_history => nil)
  end

  describe "#track_purchase" do
    it 'fails for incorrect request' do 
      expect{ Iterable::Services::CommerceService.track_purchase({}) }.to raise_error(Iterable::Exceptions::ServiceException, "Must be a Iterable::Requests::TrackPurchase")
    end
    it "adds a purchase" do
      track_purchase_request = Iterable::Requests::TrackPurchase.new(JSON.parse(load_file('request_track_purchase.json')))
      json = load_file('response_general.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:post).and_return(response)
      general_response = Iterable::Services::CommerceService.track_purchase(track_purchase_request)

      expect(general_response).to be_kind_of(Iterable::Responses::General)
      expect(general_response.code).to eq 200
      expect(general_response.msg).to eq 'Success'
    end
  end
end