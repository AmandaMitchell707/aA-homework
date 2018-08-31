def class Map
  attr_reader :map_array

  def initialize
    @map_array = []
  end

  def set(key, value)
    map_array.each do |el|

      if el[0] == key
        el[1] = value
      else
        map_array << [key, value]
      end
    end
  end

  def get(key)
    key_value_pair = map_array.select { |el| el[0] == key }
    key_value_pair[1]
    end
  end

  def delete(key)
    map_array.reject! { |el| el[0] == key }
  end

  def show
    map_array
  end
end
