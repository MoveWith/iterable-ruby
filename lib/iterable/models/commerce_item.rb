# {
#   "id": "",
#   "sku": "",
#   "name": "",
#   "description": "",
#   "categories": [
#     ""
#   ],
#   "price": 0,
#   "quantity": 0,
#   "imageUrl": "",
#   "url": "",
#   "dataFields": "Map[string, object]"
# }
module Iterable
  class CommerceItem < Hashie::Dash
    include Hashie::Extensions::Dash::Coercion
    property :id, required: true
    property :name, required: true
    property :price, required: true
    property :quantity, required: true

    property :sku
    property :description
    property :imageUrl
    property :url

    property :categories, coerce: Array[String]
    property :dataFields, coerce: DataFields
  end
end