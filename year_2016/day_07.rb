class Year2016
  class Day07
    def initialize(input_data)
      @input = input_data.chomp.split("\n")
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    def address_supports_tls?(address)
      in_brackets = false
      got_abba = false
      address.each_char.each_cons(4) do |tls_frame|
        next in_brackets = true if tls_frame[0] == '['
        next in_brackets = false if tls_frame[0] == ']'
        next if tls_frame[0] == tls_frame[1]
        next if tls_frame[0] != tls_frame[3]
        next if tls_frame[1] != tls_frame[2]
        return false if in_brackets

        got_abba = true
      end
      got_abba
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

    def tls_addresses_count
      @input.count do |address|
        address_supports_tls?(address)
      end
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def address_supports_ssl?(address)
      in_brackets = false
      aba_list = []
      bab_list = []
      address.each_char.each_cons(3) do |ssl_frame|
        next in_brackets = true if ssl_frame[0] == '['
        next in_brackets = false if ssl_frame[0] == ']'
        next if ssl_frame[0] == ssl_frame[1]
        next if ssl_frame[0] != ssl_frame[2]

        if in_brackets
          bab_list.push(ssl_frame[0..1].reverse)
        else
          aba_list.push(ssl_frame[0..1])
        end
      end
      !aba_list.intersection(bab_list).empty?
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

    def ssl_addresses_count
      @input.count do |address|
        address_supports_ssl?(address)
      end
    end
  end
end
