require_relative 'p02_hashing'

class HashSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hashed_num = key.hash
    if count >= num_buckets
      resize!
    end
    self[hashed_num] << hashed_num unless self[hashed_num].include?(hashed_num)
  end

  def remove(key)
    hashed_num = key.hash
    self[hashed_num].delete(hashed_num)
  end

  def include?(key)

    hashed_num = key.hash
    self[hashed_num].include?(hashed_num)
  end

  def count
    @store.flatten.size
  end

  private

  def [](num)
    @store[num%num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    numbers = @store.flatten

    numbers.each do |num|
      remove(num)
    end

    num_buckets.times do
      @store << []
    end

    numbers.each do |num|
      insert(num)
    end
  end
end






# class ResizingIntSet
#   attr_reader :count
#   attr_accessor :store
#
#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end
#
#   def insert(key)
#     hashed_num = key.hash
#     if count >= num_buckets
#       resize!
#     end
#     self[hashed_num] << hashed_num unless self[hashed_num].include?(hashed_num)
#   end
#
#   def remove(key)
#     hashed_num = key.hash
#     self[num].delete(num)
#   end
#
#   def include?(key)
#     hashed_num = key.hash
#     self[num].include?(num)
#   end
#
#   def count
#     @store.flatten.size
#   end
#
#   private
#
#   def [](num)
#     @store[num%num_buckets]
#     # optional but useful; return the bucket corresponding to `num`
#   end
#
#   def num_buckets
#     @store.length
#   end
#
#   def resize!
#     numbers = @store.flatten
#
#     numbers.each do |num|
#       remove(num)
#     end
#
#     num_buckets.times do
#       @store << []
#     end
#
#     numbers.each do |num|
#       insert(num)
#     end
#   end
# end
