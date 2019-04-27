class StringHelper
    def self.check_balance_parenthesis(string)
        raise ArgumentError unless string.kind_of? String

        opening = {0 => "[", 1 => "{", 2 => "("}
        closing = {0 => "]", 1 => "}", 2 => ")"}

        match = []

        characters = string.split("")
        string.split("").each do |c|
            if opening.has_value? c
                # found the character in opening list
                # prepend it to the head of the match array
                match.prepend(c)
            elsif closing.has_value? c
                # found the character in closing list
                # start checking
                if match.length == 0
                    # there's no opening parenthesis in match array yet
                    return false
                elsif match[0] == opening[closing.key(c)]
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
        match.length == 0
    end
end