
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result_num = 0

    # return result_num.hash if self.empty?
    self.each_with_index do |el, idx|
      if el.is_a?(Symbol)
        self[idx] = el.to_s.ord
      elsif el.is_a?(String)
        self[idx] = el.ord
      end
    end

    self.each_with_index { |el, idx| result_num += (el * idx) }
    result_num.hash
  end
end

class String
  def hash
    result_num = 0
    self.each_char.with_index {|el, idx| result_num += (el.ord * idx) }
    result_num.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = self.to_a.flatten

    arr.each_with_index do |el, idx|
      if el.is_a?(Symbol)
        arr[idx] = el.to_s.ord
      elsif el.is_a?(String)
        arr[idx] = el.ord
      end
    end

    arr.sort.hash
  end
end
