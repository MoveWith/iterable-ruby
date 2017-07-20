require 'spec_helper'

describe Iterable::Responses::Subscribe do
  subject { Iterable::Responses::Subscribe.new(JSON.parse(load_file('response_subscribe.json'))) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has successCount' do 
    expect(subject.successCount).to eq 1
  end

  it 'has failCount' do 
    expect(subject.failCount).to eq 1
  end

  it 'has invalidEmails' do 
    expect(subject.invalidEmails).not_to be_empty
    expect(subject.invalidEmails).to include 'fail@example.org'
  end
end