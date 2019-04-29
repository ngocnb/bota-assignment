# Installation

Below is the requirement to run this project:

- Ruby: 2.6.1
- Rspec

# Circular shift (Rotate bits)
## Assumptions

- I assume that we need to specify the bits because with the same number but different bits, the result will be different.
- When user input a number which exceeds the maximum value of bits, it will cause error. For example:
```
ruby circular_shift.rb -n 256 -b 8 -s 2 -d left

-> NUMBER exceeds the maximum number 255 of 8 bits
```
- I don't write automated integration test for `circular_shift.rb` file because it's pretty much the same with testing `helpers/bit_helper.rb`

## Command

To run circular shift, please use the command below:

```
ruby circular_shift.rb -n NUMBER -b INT_BITS -s STEPS -d DIRECTION
```

Command usage:
```
Usage: circular_shift [options]
    -n, --number NUMBER              the NUMBER to be circular shifted
    -b, --bits INTEGER_BITS          the INTEGER BITS of the NUMBER
    -s, --steps STEPS                the number of STEPS that the NUMBER will be circular shifted
    -d, --direction DIRECTION        the DIRECTION that the NUMBER will be circular shifted
```

Please note that `-d` default option is `left`.

Example command:

```
ruby circular_shift.rb -n 123 -b 8 -s 2 -d left
ruby circular_shift.rb -n 123 -b 8 -s 2 -d right
ruby circular_shift.rb -n 123 -b 8 -s 2
```

## Unit tests

Unit test is located in folder `spec/`.To run unit test, please use the command below:

```
# to run all tests
rspec spec

# to run only unit test for circular_shift
rspec spec/helpers/bit_helper_spec.rb
```

# Check balance of parenthesis in a string
## Assumptions

- I don't write automated integration test for `check_balance_parenthesis.rb` file because it's pretty much the same with testing `helpers/string_helper.rb`

## Command

To check balance of parenthesis in a string, please use the command below:

```
ruby check_balance_parenthesis.rb  -s STRING
```

Command usage:
```
Usage: check_balance_parenthesis [options]
    -s, --string STRING              the STRING to be checked
```

Example command:
```
ruby check_balance_parenthesis.rb  -s "([{}()])"
```

## Unit tests

Unit test is located in folder `spec/`.To run unit test, please use the command below:

```
# to run all tests
rspec spec

# to run only unit test for balance of parenthesis
rspec spec/helpers/string_helper_spec.rb
```

# LRU cache

I study the problem but I don't have enough time to code.

## Solution

- Theory: https://www.geeksforgeeks.org/lru-cache-implementation/
- Solution:
```
class LruCache

  def initialize(max_size)
    @max_size = max_size
    @data = {}
  end

  def max_size=(size)
    raise ArgumentError.new(:max_size) if @max_size < 1
    @max_size = size
    if @max_size < @data.size
      @data.keys[0..@max_size-@data.size].each do |k|
        @data.delete(k)
      end
    end
  end

  def [](key)
    found = true
    value = @data.delete(key){ found = false }
    if found
      @data[key] = value
    else
      nil
    end
  end

  def []=(key,val)
    @data.delete(key)
    @data[key] = val
    if @data.length > @max_size
      @data.delete(@data.first[0])
    end
    val
  end

  def each
    @data.reverse.each do |pair|
      yield pair
    end
  end

  # used further up the chain, non thread safe each
  alias_method :each_unsafe, :each

  def to_a
    @data.to_a.reverse
  end

  def delete(k)
    @data.delete(k)
  end

  def clear
    @data.clear
  end

  def count
    @data.count
  end

  # for cache validation only, ensures all is sound
  def valid?
    true
  end
end
```
- Our cache should handle thread safe cache too
