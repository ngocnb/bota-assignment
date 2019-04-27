class BitHelper
  # get the maximum number of provided bits
  # for example: maximum number of 8 bits is 255
  def self.bitmask(bits)
    # check valid type Integer
    raise ArgumentError unless bits.is_a? Integer

    (1 << bits) - 1
  end

  # shift a number left a certain number of bits
  # then chopping it off at a certain width
  def self.shift_left_width(value, int_bits, steps)
    # check valid type Integer
    # TODO: need to make the error message more meaningful
    raise ArgumentError unless value.is_a? Integer
    raise ArgumentError unless int_bits.is_a? Integer
    raise ArgumentError unless steps.is_a? Integer

    # check maximum integer value by int_bits
    raise ArgumentError if bitmask(int_bits) < value

    # calculate the real steps we need to move
    steps = calculate_real_steps(int_bits, steps)
    (value << steps) & bitmask(int_bits)
  end

  # circular shift number to the right
  def self.circular_shift_right(value, int_bits, steps)
    # check valid type Integer
    # TODO: need to make the error message more meaningful
    raise ArgumentError unless value.is_a? Integer
    raise ArgumentError unless int_bits.is_a? Integer
    raise ArgumentError unless steps.is_a? Integer

    # check maximum integer value by int_bits
    raise ArgumentError if bitmask(int_bits) < value

    # calculate the real steps we need to move
    steps = calculate_real_steps(int_bits, steps)
    # steps equals to int_bits mean no move at all
    return value if steps == int_bits

    remaining_bits = int_bits - steps
    # split the bits into two parts
    top = shift_left_width(value, int_bits, remaining_bits)
    bottom = value >> steps
    # put them back together
    top | bottom
  end

  # circular shift number to the left
  def self.circular_shift_left(value, int_bits, steps)
    # check valid type Integer
    # TODO: need to make the error message more meaningful
    raise ArgumentError unless value.is_a? Integer
    raise ArgumentError unless int_bits.is_a? Integer
    raise ArgumentError unless steps.is_a? Integer

    # check maximum integer value by int_bits
    raise ArgumentError if bitmask(int_bits) < value

    # calculate the real steps we need to move
    steps = calculate_real_steps(int_bits, steps)
    # steps equals to int_bits mean no move at all
    return value if steps == int_bits

    remaining_bits = int_bits - steps
    # split the bits into two parts
    top = shift_left_width(value, int_bits, steps)
    bottom = value >> remaining_bits
    # put them back together
    top | bottom
  end

  # convert number to bits string
  def self.number_to_bits(value, int_bits)
    # check valid type Integer
    # TODO: need to make the error message more meaningful
    raise ArgumentError unless value.is_a? Integer
    raise ArgumentError unless int_bits.is_a? Integer

    # check maximum integer value by int_bits
    raise ArgumentError if bitmask(int_bits) < value

    value.to_s(2).rjust(int_bits, '0')
  end

  # calculate the real steps we will move
  # for example: with int_bits = 8, steps = 10 equals to steps = 2
  def self.calculate_real_steps(int_bits, steps)
    modular = steps % int_bits
    modular.zero? ? int_bits : modular
  end
end
