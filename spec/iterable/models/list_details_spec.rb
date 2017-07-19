require 'spec_helper'

describe Iterable::ListDetails do
  subject { Iterable::ListDetails.new }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has id' do 
    expect(subject.id).to be_nil
    subject.id = 1
    expect(subject.id).to eq 1
    subject.id = "1"
    expect(subject.id).to eq 1 # coerced into an integer
  end

  it 'has name' do 
    expect(subject.name).to be_nil
    subject.name = "name"
    expect(subject.name).to eq "name"
  end

  it 'has createdAt' do 
    expect(subject.createdAt).to be_nil
    time = Time.now.to_s
    subject.createdAt = time
    expect(subject.createdAt).to eq time
  end

  it 'has listType' do 
    expect(subject.listType).to be_nil
    subject.listType = "listType"
    expect(subject.listType).to eq "listType"
  end

  it 'can parse from json' do 
    json_string = load_file('list_details.json')
    subject = Iterable::ListDetails.new(JSON.parse(json_string))
    expect(subject.id).to eq 1
    expect(subject.name).to eq "ListName"
    expect(subject.createdAt).to eq "2017-07-19 16:09:38 -0400"
    expect(subject.listType).to eq "MyListType"
  end
end