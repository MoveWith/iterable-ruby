require 'spec_helper'

describe Iterable::Responses::Lists do
  subject { Iterable::Responses::Lists.new(JSON.parse(load_file('response_lists.json'))) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has lists' do 
    expect(subject.lists).not_to be_empty
  end
end