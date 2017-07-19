require 'spec_helper'

describe Iterable::Requests::TrackPurchase do
  subject { Iterable::Requests::TrackPurchase.new(JSON.parse(load_file('request_track_purchase.json'))) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

end