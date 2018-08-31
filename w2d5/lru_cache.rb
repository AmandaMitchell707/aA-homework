class LRUCache

    def initialize(max_length)
      @cache = []
      @max_length
    end

    def count
      @cache.count
    end

    def add(el)
      if @cache.include?(el)
        @cache.delete(el)
      elsif count >= max_length
        @cache.shift
      end
      @cache << el
    end

    def show
      @cache
    end

    private
    # helper methods go here!

  end
