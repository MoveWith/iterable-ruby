require 'spec_helper'

describe Iterable::CommerceItem do
  let(:id) { 1 }
  let(:name) { 'boblist' }
  let(:price) { 1337 }
  let(:quantity) { 10 }
  subject { Iterable::CommerceItem.new(id: id, name: name, price: price, quantity: quantity) }

  it 'is Dash' do 
    expect(subject.is_a?(Hashie::Dash)).to be_truthy
  end

  it 'has id' do 
    expect(subject.id).to eq id
  end

  it 'has name' do 
    expect(subject.name).to eq name
  end

  it 'has price' do 
    expect(subject.price).to eq price
    price = subject.price = 3.14
    expect(subject.price).to eq price
    price = subject.price = ''
    expect(subject.price).to eq 0
    price = subject.price = 'asbx'
    expect(subject.price).to eq 0
    # expect nil to throw an error
    expect { subject.price = nil }.to raise_error(ArgumentError)
  end

  it 'has quantity' do 
    expect(subject.quantity).to eq quantity
    quantity = subject.quantity = 3.14
    expect(subject.quantity).to eq 3
    quantity = subject.quantity = ''
    expect(subject.quantity).to eq 0
    quantity = subject.quantity = 'asbx'
    expect(subject.quantity).to eq 0
    # expect nil to throw an error
    expect { subject.quantity = nil }.to raise_error(ArgumentError)
  end

  it 'has sku' do 
    expect(subject.sku).to be_nil
    subject.sku = 'sku'
    expect(subject.sku).to eq 'sku'
  end

  it 'has description' do 
    expect(subject.description).to be_nil
    subject.description = 'description'
    expect(subject.description).to eq 'description'
  end

  it 'has imageUrl' do 
    expect(subject.imageUrl).to be_nil
    subject.imageUrl = 'imageUrl'
    expect(subject.imageUrl).to eq 'imageUrl'
  end

  it 'has url' do 
    expect(subject.url).to be_nil
    subject.url = 'url'
    expect(subject.url).to eq 'url'
  end

  it 'has categories' do 
    expect(subject.categories).to be_nil
    subject.categories = ['one', 'two']
    expect(subject.categories).to be_truthy
    expect(subject.categories).to include 'one'
  end

  it 'has dataFields' do 
    expect(subject.dataFields).to be_nil
    subject.dataFields = {key: 'value'}
    expect(subject.dataFields).to be_truthy
    expect(subject.dataFields[:key]).to eq 'value'
  end
end