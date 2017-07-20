require 'spec_helper'

describe Iterable::Services::ListService do
  before(:each) do
    @request = double('http request', :user => nil, :password => nil, :url => 'http://example.com', :redirection_history => nil)
  end

  describe "#all" do
    it "returns a list of lists" do
      json = load_file('response_lists.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:get).and_return(response)
      list_response = Iterable::Services::ListService.all

      expect(list_response).to be_kind_of(Iterable::Responses::Lists)
      expect(list_response.lists).not_to be_empty
    end
  end

  describe "#find_by_id" do
    it "returns a list that exists" do
      json = load_file('response_lists.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:get).and_return(response)
      list_response = Iterable::Services::ListService.find_by_id(1)

      expect(list_response).to be_kind_of(Iterable::ListDetails)
      expect(list_response).not_to be_nil
    end

    it "returns nil for a list that does not exist" do
      json = load_file('response_lists.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:get).and_return(response)
      list_response = Iterable::Services::ListService.find_by_id(19827)

      expect(list_response).to be_nil
    end
  end

  describe "#subscribe" do
    it "adds a user to a list" do
      subscribers = [Iterable::User.new(JSON.parse(load_file('user.json'))), Iterable::User.new(email: 'fail@example.org')]
      json = load_file('response_subscribe.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:post).and_return(response)
      list_response = Iterable::Services::ListService.subscribe(1, subscribers)
      
      expect(list_response).to be_kind_of(Iterable::Responses::Subscribe)
      expect(list_response.successCount).to eq 1
      expect(list_response.failCount).to eq 1
      expect(list_response.invalidEmails).not_to be_empty
      expect(list_response.invalidEmails).to include 'fail@example.org'
    end
  end
end