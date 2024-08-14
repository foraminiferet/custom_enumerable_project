module Enumerable
  # Your code goes here
  def my_each_with_index(*args)
    return to_enum(:my_each_with_inedx, *args) unless block_given?

    i = 0
    for x in self
      yield x, i
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    res = []
    for x in self
      res << x if yield x
    end
    res
  end

  def my_all?
    for x in self
      return false if yield(x) == false
    end
    true
  end

  def my_any?
    for x in self
      return true if yield(x) == true
    end
    false
  end

  def my_none?
    for x in self
      return false if yield(x) == true
    end
    true
  end

  def my_count(*_args)
    return length unless block_given?

    res = 0
    for x in self
      res += 1 if yield(x) == true
    end
    res
  end

  def my_map
    res = []
    for x in self
      res << yield(x)
    end
    res
  end

  def my_inject(acc)
    for x in self
      acc = yield(acc, x)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for x in self
      yield(x)
    end
    self
  end
end
