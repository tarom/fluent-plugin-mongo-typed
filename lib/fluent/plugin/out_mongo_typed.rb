module Fluent

require 'fluent/plugin/out_mongo'
require 'fluent/mixin/mongo_typed_mixin'

class MongoOutputTyped < MongoOutput
  Fluent::Plugin.register_output('mongo_typed', self)
  include MongoTypedMixin
end

end
