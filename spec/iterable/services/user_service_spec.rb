require 'spec_helper'

describe Iterable::Services::UserService do
  before(:each) do
    @request = double('http request', :user => nil, :password => nil, :url => 'http://example.com', :redirection_history => nil)
  end

  describe "#find_by_email" do
    it "returns a user" do
      json = load_file('response_user.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:get).and_return(response)
      user_response = Iterable::Services::UserService.find_by_email('bob@example.org')

      expect(user_response).to be_kind_of(Iterable::Responses::User)
      expect(user_response.user).to be_truthy
      user = user_response.user
      expect(user.email).to eq 'bob@example.org'
      expect(user.userId).to eq '1'
      expect(user.dataFields[:key]).to eq 'value'
    end
  end

  describe "#find_by_id" do
    it "returns a user" do
      json = load_file('response_user.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:get).and_return(response)
      user_response = Iterable::Services::UserService.find_by_id(1)

      expect(user_response).to be_kind_of(Iterable::Responses::User)
      expect(user_response.user).to be_truthy
      user = user_response.user
      expect(user.email).to eq 'bob@example.org'
      expect(user.userId).to eq '1'
      expect(user.dataFields[:key]).to eq 'value'
    end

    it "returns an error for a user that doesn't exist" do
      json = load_file('response_error.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      error = RestClient::BadRequest.new
      error.message = 'Bad Request'
      error.response = OpenStruct.new({body: "User does not exist with that ID!"})
      RestClient.stub(:get).and_raise(error)
      expect { Iterable::Services::UserService.find_by_id(1) }.to raise_error(error)
    end
  end

  describe "#update" do
    it 'fails for incorrect request' do 
      expect{ Iterable::Services::UserService.update({}) }.to raise_error(Iterable::Exceptions::ServiceException, "Must be a Iterable::Requests::UserUpdate")
    end
    it "adds a user" do
      user_update_request = Iterable::Requests::UserUpdate.new(JSON.parse(load_file('request_user_update.json')))
      json = load_file('response_general.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:post).and_return(response)
      general_response = Iterable::Services::UserService.update(user_update_request)

      expect(general_response).to be_kind_of(Iterable::Responses::General)
      expect(general_response.code).to eq 200
      expect(general_response.msg).to eq 'Success'
    end
  end
end