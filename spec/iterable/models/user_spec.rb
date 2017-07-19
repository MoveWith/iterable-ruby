require 'spec_helper'

describe Iterable::User do
  let(:email) { 'bob@example.org' }
  subject { Iterable::User.new(email: email) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has email' do 
    expect(subject.email).to eq email
  end

  it 'has userId' do 
    expect(subject.userId).to be_nil
    subject.userId = 1
    expect(subject.userId).to eq "1" # coerced into a string
  end

  it 'has dataFields' do 
    expect(subject.dataFields).to be_nil
    subject.dataFields = {key: 'value'}
    expect(subject.dataFields).to be_truthy
    expect(subject.dataFields[:key]).to eq 'value'
  end

  it 'can parse from json' do 
    json_string = load_file('user.json')
    output = Iterable::User.new(JSON.parse(json_string))
    expect(output.email).to eq email
    expect(output.userId).to eq "1"
    expect(output.dataFields).to be_truthy
    expect(output.dataFields[:key]).to eq 'value'
  end
end