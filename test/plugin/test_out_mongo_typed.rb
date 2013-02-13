require 'helper'

class TestMongoOutputTyped < Test::Unit::TestCase

  DB_NAME = '__fluent_test'
  COLLECTION_NAME = 'test'
  DEFAULT_CONFIG = %[
    type mongo_typed
    database #{DB_NAME}
    collection #{COLLECTION_NAME}
  ]

  def setup
    Fluent::Test.setup
    @db = connect_db
  end

  def teardown
    @db.collection(COLLECTION_NAME).drop
    Mongo::Connection.new('localhost').drop_database(DB_NAME)
  end

  def connect_db
    Mongo::Connection.new('localhost').db(DB_NAME)
  end

  def create_driver(conf = DEFAULT_CONFIG)
    Fluent::Test::BufferedOutputTestDriver.new(Fluent::MongoOutputTyped).configure(conf)
  end

  def test_configure
    time_format = "%d/%b/%Y:%H:%M:%S %z"
    d = create_driver(DEFAULT_CONFIG + %[
      item_types test1:integer,test2:string,test3:time,test4:bool
      time_format #{time_format}
    ]).instance

    assert_equal('integer', d.item_types['test1'])
    assert_equal('string', d.item_types['test2'])
    assert_equal('time', d.item_types['test3'])
    assert_equal('bool', d.item_types['test4'])

    assert_equal(time_format, d.time_format)
  end

  def test_write
    d = create_driver(DEFAULT_CONFIG + %[
      item_types i:integer,s:string,t:time,b:bool,a:array
      time_format %Y-%m-%d %H:%M:%S %z
    ])
    time = Time.parse('2013-02-12 22:01:15 UTC').to_i
    t = '2013-02-12 22:04:14 UTC'
    record = {'i' => '1', 's' => 'foo', 't' => t, 'b' => 'true', 'a' => 'a, b, c', 'o' => 'other'}
    d.emit(record, time)
    d.run
    doc = @db.collection(COLLECTION_NAME).find_one()
    assert_equal(1, doc['i'])
    assert_equal('foo', doc['s'])
    assert_equal(Time.gm(2013, 2, 12, 22, 4, 14), doc['t'])
    assert_equal(true, doc['b'])
    assert_equal(['a', 'b', 'c'], doc['a'])
    assert_equal('other', doc['o'])
  end
end
