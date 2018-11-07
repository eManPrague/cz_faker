module CzFaker
  module Validator
    class Energy < CzFaker::Base
      class << self

        def ean?(code)
          return false unless code.to_s.size == CzFaker::Data::EAN_LENGTH
          return false if ean_distributor(code).nil?

          ean_checksum(code)
        end

        def eic?(code)
          return false unless code.to_s.size == CzFaker::Data::EIC_LENGTH
          return false if eic_distributor(code).nil?

          eic_checksum(code) == '0'
        end

        private

        def ean_distributor(code)
          CzFaker::Data::ELECTRICITY_DISTRIBUTORS.each do |dist|
            dist[:prefixes].each do |prefix|
              return dist if code.start_with?(prefix)
            end
          end
          nil
        end

        def eic_distributor(code)
          CzFaker::Data::GAS_DISTRIBUTORS.each do |dist|
            dist[:prefixes].each do |prefix|
              return dist if code.start_with?(prefix)
            end
          end
          nil
        end

        def eic_checksum(code)
          sum = 0
          code.split('').each_with_index do |value, index|
            sum += eic_char_to_int(value) * (16 - index)
          end
          eic_int_to_char((37 - sum % 37) % 37)
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
          elsif char.match(/\A\d+\z/)
            char.to_i
          elsif char.match(/\A[A-Za-z]\z/)
            char.upcase.ord - 'A'.ord + 10
          else
            -1
          end
        end

        def ean_checksum(code)
          sum = 0
          code.split('').each_with_index do |value, index|
            sum +=  (index % 2).zero? ? value.to_i * 3 : value.to_i
          end
          (sum % 10).zero?
        end
      end
    end
  end
end
