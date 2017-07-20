require 'spec_helper'

describe Iterable::Responses::Error do
  subject { Iterable::Responses::Error.new(JSON.parse(load_file('response_error.json'))) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has msg' do 
    expect(subject.msg).to eq '400 Bad Request'
  end

  it 'has code' do 
    expect(subject.code).to eq 400
  end

  it 'has response' do 
    expect(subject.response).to eq "User does not exist with that ID!"
  end
  it 'has params' do 
    expect(subject.params).to be_truthy
    expect(subject.params[:key]).to eq 'value'
  end
end