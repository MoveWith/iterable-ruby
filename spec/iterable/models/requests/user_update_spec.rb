require 'spec_helper'

describe Iterable::Requests::UserUpdate do
  subject { Iterable::Requests::UserUpdate.new(JSON.parse(load_file('request_user_update.json'))) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has email' do 
    expect(subject.email).to eq 'bob@example.org'
  end

  it 'has userId' do 
    expect(subject.userId).to eq "1" # coerced into a string
  end

  it 'has dataFields' do 
    expect(subject.dataFields).to be_truthy
    expect(subject.dataFields[:key2]).to eq 'value2'
  end

  it 'has mergeNestedObjects' do 
    expect(subject.mergeNestedObjects).to be_falsy
    subject.mergeNestedObjects = true
    expect(subject.mergeNestedObjects).to be_truthy
  end
end