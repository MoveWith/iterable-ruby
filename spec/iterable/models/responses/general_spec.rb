require 'spec_helper'

describe Iterable::Responses::General do
  subject { Iterable::Responses::General.new(JSON.parse(load_file('response_general.json'))) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has msg' do 
    expect(subject.msg).to eq 'Success'
  end

  it 'has code' do 
    expect(subject.code).to eq 200
  end

  it 'has params' do 
    expect(subject.params).to be_truthy
    expect(subject.params[:key]).to eq 'value'
  end
end