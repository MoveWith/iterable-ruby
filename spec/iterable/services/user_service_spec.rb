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

  describe "#fields" do
    it "gets user fields" do
      json = load_file('response_fields.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:get).and_return(response)
      hashie_response = Iterable::Services::UserService.fields
      
      expect(hashie_response).to be_kind_of(Hashie::Mash)
      expect(hashie_response.fields).to be_truthy
      expect(hashie_response.fields['test']).to eq 'string'
    end
  end
end