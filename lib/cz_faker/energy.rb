module CzFaker
  class Energy < CzFaker::Base
    class << self

      def ean(lds = true, dist_code = nil)
        code = electricity_by_code(dist_code)[:prefixes].sample
        code += "00" unless lds
        (CzFaker::Data::EAN_LENGTH - code.size - 1).times do
          code += Number.integer(1)
        end
        code += ean_checksum(code).to_s
      end

      def eic(lds = true, dist_code = nil, type = nil)
        code = gas_by_code(dist_code)[:prefixes].sample # 5 chars
        code += lds ? Number.integer(2).to_s : "00"     # 2 chars
        code += type.nil? ? CzFaker::Data::GAS_TYPES.sample : type     # 1 char
        code += Number.integer(7)                       # 7 chars
        code + eic_checksum(code).to_s                  # 1 char
      end

      def gas_distribution_company
        CzFaker::Data::GAS_DISTRIBUTORS.sample[:name]
      end

      def electricity_distribution_company
        CzFaker::Data::ELECTRICITY_DISTRIBUTORS.sample[:name]
      end

      private

      def ean_checksum(code)
        sum = 0
        code.split('').each_with_index do |value, index|
          sum += index.even? ? value.to_i * 3 : value.to_i
        end
        (10 - sum % 10) % 10
      end

      def eic_checksum(code)
        sum = 0
        code.split('').each_with_index do |value, index|
          sum += eic_char_to_int(value) * (16 - index)
        end
        eic_int_to_char(((37 - sum % 37) % 37))
      end

      def electricity_by_code(code = nil)
        return CzFaker::Data::ELECTRICITY_DISTRIBUTORS.sample unless code

        CzFaker::Data::ELECTRICITY_DISTRIBUTORS.each do |dist|
          return dist if dist[:code] == code
        end
      end

      def gas_by_code(code = nil)
        return CzFaker::Data::GAS_DISTRIBUTORS.sample unless code

        CzFaker::Data::GAS_DISTRIBUTORS.each do |dist|
          return dist if dist[:code] == code
        end
      end

      def eic_int_to_char(int)
        if int < 10 && int >= 0
          int.to_s
        elsif int < 36 && int >= 10
          (int + 'A'.ord - 10).chr
        else
          '-'
        end
      end

      def eic_char_to_int(char)
        if char == '-'
          36
        elsif char.match?(/\A\d+\z/)
          char.to_i
        elsif char.match?(/\A[A-Za-z]\z/)
          char.upcase.ord - 'A'.ord + 10
        else
          -1
        end
      end
    end
  end
end
