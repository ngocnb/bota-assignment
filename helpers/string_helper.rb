class StringHelper
  def self.check_balance_parenthesis(string)
    raise ArgumentError, string.to_s + " is not a String" unless string.is_a? String

    opening = %w|[ { (|
    closing = %w|] } )|

    match = []

    string.split('').each do |c|
      if opening.include? c
        # found the character in opening list
        # prepend it to the head of the match array
        match.prepend(c)
      elsif closing.include? c
        # found the character in closing list
        # start checking
        if match.length.zero?
          # there's no opening parenthesis in match array yet
          return false
        elsif match[0] == opening[closing.find_index(c)]
          # there's a matched open parenthesis with the close one
          # at the head of the matched array
          # remove the head
          match.shift
        else
          return false
        end
      end
    end

    # at the end, check the length of match array
    # length == 0 means that all the open parenthesis has the matched one
    match.length.zero?
  end
end
