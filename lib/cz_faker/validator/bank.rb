module CzFaker
  module Validator
    class Bank
      class << self
        def account_number?(account_number)
          prefix, number = account_number.split("-")
          if prefix && number
            return false if prefix.size > 6
            return false unless base_account_number? prefix
          else
            number = prefix
          end
          return false if number.size > 10

          base_account_number? number
        end

        def full_account_number?(account_number)
          number, code = account_number.split("/")
          return false unless account_number? number

          bank_code? code
        end

        def credit_card?(card_number)
          return false unless credit_card_issuer(card_number)

          luhn(card_number)
        end

        def bank_code?(code)
          code.size == 4
        end

        private

        def credit_card_issuer(card_number)
          card_number = card_number.to_s
          CzFaker::Data::CARD_DEFS.each do |issuer, definition|
            definition[:prefixes].each do |prefix|
              return issuer if card_number.start_with?(prefix)
            end
          end
          nil
        end

        def base_account_number?(account_number)
          account_number = account_number.to_s.rjust(10, "0")
          sum = 0
          CzFaker::Data::ACCOUNT_NUMBER_WEIGHTS.each_with_index do |weight, index|
            sum += account_number[index].to_i * weight
          end
          (sum % 11).zero?
        end

        def luhn(card_number)
          ss = card_number.split(//)
          alternate = true
          total = 0
          ss.each do |c|
            total += alternate ? double_mod(c.to_i) : c.to_i
            alternate = !alternate
          end
          (total % 10).zero?
        end

        def double_mod(i)
          i *= 2
          if i > 9
            i = i % 10 + 1
          end
          i
        end
      end
    end
  end
end
