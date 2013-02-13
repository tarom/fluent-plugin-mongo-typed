require 'helper'
require 'plugin/test_out_mongo_typed'

class TestMongoOutputReplsetTyped < TestMongoOutputTyped
  DEFAULT_CONFIG = %[
    type mongo_replset_typed
    database #{DB_NAME}
    collection #{COLLECTION_NAME}
    nodes localhost
  ]
end
