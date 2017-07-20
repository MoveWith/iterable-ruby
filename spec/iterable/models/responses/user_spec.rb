require 'spec_helper'

describe Iterable::Responses::User do
  subject { Iterable::Responses::User.new(JSON.parse(load_file('response_user.json'))) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has user' do 
    expect(subject.user).not_to be_empty
  end
end