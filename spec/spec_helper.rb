$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'iterable/api'
require 'iterable'

def load_file(file_name)
  json = File.read(File.join(File.dirname(__FILE__), 'fixtures', file_name))
end