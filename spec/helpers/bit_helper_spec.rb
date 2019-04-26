require "./helpers/bit_helper"

describe BitHelper do
	context "When testing BitHelper class" do

		# input 8 bit number, shift to the left
		it "case number 123 stored using 8 bits, circular shift 2 bits to the left" do
			number = 123 # 01111011 in bits
			steps = 2
			int_bits = 8
			expected_result = 237
			expected_result_bits = "11101101"

			result = BitHelper.circular_shift_left(number, int_bits, steps)
			result_bits = BitHelper.number_to_bits(result, int_bits)
			expect(result).to eq expected_result
			expect(result_bits).to eq expected_result_bits
		end

		# input 8 bit number, shift to the right
		it "case number 123 stored using 8 bits, circular shift 2 bits to the right" do
			number = 123 # 01111011 in bits
			steps = 2
			int_bits = 8
			expected_result = 222
			expected_result_bits = "11011110"

			result = BitHelper.circular_shift_right(number, int_bits, steps)
			result_bits = BitHelper.number_to_bits(result, int_bits)
			expect(result).to eq expected_result
			expect(result_bits).to eq expected_result_bits
		end

		# boundary test for 8 bits number, max 255, shift to the left
		it "case number 255 stored using 8 bits, circular shift 2 bits to the left" do
			number = 255 # 11111111 in bits
			steps = 2
			int_bits = 8
			expected_result = 255
			expected_result_bits = "11111111"

			result = BitHelper.circular_shift_left(number, int_bits, steps)
			result_bits = BitHelper.number_to_bits(result, int_bits)
			expect(result).to eq expected_result
			expect(result_bits).to eq expected_result_bits
		end

		# boundary test for 8 bits number, max 255, shift to the right
		it "case number 255 stored using 8 bits, circular shift 2 bits to the right" do
			number = 255 # 11111111 in bits
			steps = 2
			int_bits = 8
			expected_result = 255
			expected_result_bits = "11111111"

			result = BitHelper.circular_shift_right(number, int_bits, steps)
			result_bits = BitHelper.number_to_bits(result, int_bits)
			expect(result).to eq expected_result
			expect(result_bits).to eq expected_result_bits
		end

		# boundary test for 8 bits number, greater than max 255, shift to the left
		it "case number 256 stored using 8 bits, circular shift 2 bits to the left" do
			number = 256 # 11111111 in bits
			steps = 2
			int_bits = 8

			expect {
				result = BitHelper.circular_shift_left(number, int_bits, steps)
			}.to raise_error ArgumentError
		end

		# boundary test for 8 bits number, greater than max 255, shift to the right
		it "case number 256 stored using 8 bits, circular shift 2 bits to the right" do
			number = 256 # 11111111 in bits
			steps = 2
			int_bits = 8

			expect {
				result = BitHelper.circular_shift_right(number, int_bits, steps)
			}.to raise_error ArgumentError
		end

		# boundary test for 8 bits number, shift to the left 8 steps
		it "case number 123 stored using 8 bits, circular shift 8 bits to the left" do
			number = 123 # 01111011 in bits
			steps = 8
			int_bits = 8
			expected_result = 123
			expected_result_bits = "01111011"

			result = BitHelper.circular_shift_left(number, int_bits, steps)
			result_bits = BitHelper.number_to_bits(result, int_bits)
			expect(result).to eq expected_result
			expect(result_bits).to eq expected_result_bits
		end

		# boundary test for 8 bits number, shift to the right 8 steps
		it "case number 123 stored using 8 bits, circular shift 8 bits to the right" do
			number = 123 # 01111011 in bits
			steps = 8
			int_bits = 8
			expected_result = 123
			expected_result_bits = "01111011"

			result = BitHelper.circular_shift_right(number, int_bits, steps)
			result_bits = BitHelper.number_to_bits(result, int_bits)
			expect(result).to eq expected_result
			expect(result_bits).to eq expected_result_bits
		end

		# boundary test for 8 bits number, shift to the left 10 steps
		it "case number 123 stored using 8 bits, circular shift 10 bits to the left" do
			number = 123 # 01111011 in bits
			steps = 10
			int_bits = 8
			expected_result = 237
			expected_result_bits = "11101101"

			result = BitHelper.circular_shift_left(number, int_bits, steps)
			result_bits = BitHelper.number_to_bits(result, int_bits)
			expect(result).to eq expected_result
			expect(result_bits).to eq expected_result_bits
		end

		# boundary test for 8 bits number, shift to the right 10 steps
		it "case number 123 stored using 8 bits, circular shift 10 bits to the right" do
			number = 123 # 01111011 in bits
			steps = 10
			int_bits = 8
			expected_result = 222
			expected_result_bits = "11011110"

			result = BitHelper.circular_shift_right(number, int_bits, steps)
			result_bits = BitHelper.number_to_bits(result, int_bits)
			expect(result).to eq expected_result
			expect(result_bits).to eq expected_result_bits
		end

		# input string, shift to the right
		it "case 'abc123' stored using 8 bits, circular shift 2 bits to the right" do
			number = 'abc123'
			steps = 2
			int_bits = 8

			expect {
				result = BitHelper.circular_shift_right(number, int_bits, steps)
			}.to raise_error ArgumentError
		end

		# input string, shift to the left
		it "case 'abc123' stored using 8 bits, circular shift 2 bits to the left" do
			number = 'abc123'
			steps = 2
			int_bits = 8

			expect {
				result = BitHelper.circular_shift_left(number, int_bits, steps)
			}.to raise_error ArgumentError
		end

		# input float, shift to the right
		it "case 1.35 stored using 8 bits, circular shift 2 bits to the right" do
			number = 1.35
			steps = 2
			int_bits = 8

			expect {
				result = BitHelper.circular_shift_right(number, int_bits, steps)
			}.to raise_error ArgumentError
		end

		# input float, shift to the left
		it "case 1.35 stored using 8 bits, circular shift 2 bits to the left" do
			number = 1.35
			steps = 2
			int_bits = 8

			expect {
				result = BitHelper.circular_shift_right(number, int_bits, steps)
			}.to raise_error ArgumentError
		end
	end
end