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
  def self.shift_left_width(number, int_bits, steps)
    validate_for_circular_shift(number, int_bits)

    # calculate the real steps we need to move
    steps = calculate_real_steps(int_bits, steps)
    (number << steps) & bitmask(int_bits)
  end

  # circular shift number to the right
  def self.circular_shift_right(number, int_bits, steps)
    validate_for_circular_shift(number, int_bits)

    # calculate the real steps we need to move
    steps = calculate_real_steps(int_bits, steps)
    # steps equals to int_bits mean no move at all
    return number if steps == int_bits

    remaining_bits = int_bits - steps
    # split the bits into two parts
    top = shift_left_width(number, int_bits, remaining_bits)
    bottom = number >> steps
    # put them back together
    top | bottom
  end

  # circular shift number to the left
  def self.circular_shift_left(number, int_bits, steps)

    # calculate the real steps we need to move
    steps = calculate_real_steps(int_bits, steps)
    # steps equals to int_bits mean no move at all
    return number if steps == int_bits

    remaining_bits = int_bits - steps
    # split the bits into two parts
    top = shift_left_width(number, int_bits, steps)
    bottom = number >> remaining_bits
    # put them back together
    top | bottom
  end

  # convert number to bits string
  def self.number_to_bits(number, int_bits)
    validate_for_circular_shift(number, int_bits)

    number.to_s(2).rjust(int_bits, '0')
  end

  # calculate the real steps we will move
  # for example: with int_bits = 8, steps = 10 equals to steps = 2
  def self.calculate_real_steps(int_bits, steps)
    modular = steps % int_bits
    modular.zero? ? int_bits : modular
  end

  def self.validate_for_circular_shift(number=0, int_bits=0, steps=0)
    # check valid type Integer
    raise ArgumentError, "NUMBER should be an integer" unless number.is_a? Integer
    raise ArgumentError, "INTEGER_BITS should be an integer" unless int_bits.is_a? Integer
    raise ArgumentError, "STEPS should be an integer" unless steps.is_a? Integer

    # check maximum integer number by int_bits
    max_number = bitmask(int_bits)
    raise ArgumentError, "NUMBER exceeds the maximum number " + max_number.to_s + " of " + int_bits.to_s + " bits" if max_number < number
  end
end
