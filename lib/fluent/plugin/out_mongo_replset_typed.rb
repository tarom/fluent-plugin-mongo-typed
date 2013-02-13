module Fluent

require 'fluent/plugin/out_mongo_replset'
require 'fluent/mongo_typed_mixin'

class MongoOutputReplsetTyped < MongoOutput
  Fluent::Plugin.register_output('mongo_replset_typed', self)
  include MongoTypedMixin
end

end
