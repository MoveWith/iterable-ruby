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
  class CommerceItem < Iterable::Base
    property :id, required: true, coerce: String
    property :name, required: true
    property :price, required: true, coerce: Float
    property :quantity, required: true, coerce: Integer

    property :sku
    property :description
    property :imageUrl
    property :url

    property :categories, coerce: Array[String]
    property :dataFields, coerce: DataFields
  end
end