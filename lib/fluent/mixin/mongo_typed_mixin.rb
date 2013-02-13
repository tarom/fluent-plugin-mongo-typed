module Fluent

module MongoTypedMixin

  ITEM_TYPES = ['string', 'integer', 'bool', 'time', 'array']

  attr_accessor :item_types, :time_format

  def configure(conf)
    super

    map = conf['item_types'].split(',').map do |type|
      key, type = type.split(/:/)
      if ITEM_TYPES.include?(type)
        [key, type]
      else
        raise ConfigError, "mongo_ex: 'item_types' parameter format is \"KEY:TYPE,...\"\nTYPE is #{ITEM_TYPES.join(', ')}"
      end
    end
    @item_types = Hash[*map.flatten(1)]
    @time_format = conf['time_format']
  end

  def collect_records(chunk)
    records = []
    chunk.msgpack_each { |time, record|
      record = Hash[*record.map{|key, value|cast(key, value)}.flatten(1)]
      record[@time_key] = Time.at(time || record[@time_key]) if @include_time_key
      records << record
    }
    records
  end

  def cast(key, value)
    value = case @item_types[key]
      when 'string'
        value.to_s
      when 'integer'
        value.to_i
      when 'bool'
        Config.bool_value(value)
      when 'time'
        Time.strptime(value, @time_format)
      when 'array'
        value.split(/\s*,\s*/)
      else
        value
      end
    [key, value]
  end
end

end
