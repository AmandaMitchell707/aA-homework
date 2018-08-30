def sluggish_octopus(fish_arr)
  big_fish = ''
  biggest_fish_length = 0
  fish_arr.each_with_index do |el1, i|
    if el1.length > big_fish.length
      big_fish = el1
      biggest_fish_length = el1.length
    end

    fish_arr.each_with_index do |el2,  j|
      if el2.length > big_fish.length
        big_fish = el2
        biggest_fish_length = el2.length
      end
    end
  end

  big_fish
end


def merge_sort_by_length(arr)
  return arr if arr.length < 2
  mid = arr.length / 2

  sorted_left = merge_sort(arr[0...mid])
  sorted_right = merge_sort(arr[mid..-1])

  merge_by_length(sorted_left, sorted_right)
end

def merge_by_length(left, right)
  merged = []

  until left.empty? || right.empty?
    case left[0].length <=> right[0].length
    when -1
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged + left + right
end

def dominant_octopus(fish_arr)
  sorted_fish = merge_sort_by_length(fish_arr)
  sorted_fish.last
end


def clever_octopus(fish_arr)
  big_fish = ''

  fish_arr.each { |fish| big_fish = fish if fish.length > big_fish.length }

  big_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance_octopus(direction, tiles_array)
  tiles_array.each_with_index { |tile, i| return i if tile == direction }
end
