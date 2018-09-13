module CzFaker
  class Bank < CzFaker::Base
    class << self

      def full_account_number(with_prefix = false)
        "#{account_number(with_prefix)}/#{bank_code}"
      end

      def account_number(with_prefix = false)
        if with_prefix
          "#{account_base(true)}-#{account_base}"
        else
          account_base.to_s
        end
      end

      def bank_code
        load_codes['banks'].sample['code']
      end

      def bank_name
        load_codes['banks'].sample['name']
      end

      def bank_swift
        while (swift = load_codes['banks'].sample['swift']) == ''
        end
        swift
      end

      def bank
        load_codes['banks'].sample
      end

      def iban
        nil
      end

      def credit_card(type = nil)
        type = CzFaker::Data::CARD_TYPES.sample if type.nil?
        card_number = card_issuer_prefix(type)
        (CzFaker::Data::CARD_DEFS[type][:length] - 7).times do
          card_number += Number.integer(1)
        end
        card_number += luhn(card_number).to_s
      end

      def credit_card_formated(type = nil)
        credit_card(type).chars.each_slice(4).map(&:join).join(" ")
      end

      private

      def load_codes
        @codes ||= sample_data('bank')
        @codes
      end

      def account_base(prefix = false)
        base = []
        sum = 0
        range = prefix ? 4..8 : 0..8
        CzFaker::Data::ACCOUNT_NUMBER_WEIGHTS[range].each do |weight|
          base << Number.integer(1).to_i
          sum += (weight * base.last)
        end
        base << (11 - (sum % 11)) % 10
        (11 - (sum % 11)) >= 10 ? account_base(prefix) : base.join.to_i.to_s
      end

      def card_issuer_prefix(type)
        prefix = CzFaker::Data::CARD_DEFS[type][:prefixes].sample.to_s
        (6 - prefix.size).times do
          prefix += Number.integer(1)
        end
        prefix
      end

      def luhn(card_number)
        ss = card_number.split(//)
        alternate = true
        total = 0
        ss.each do |c|
          total += alternate ? double_mod(c.to_i) : c.to_i
          alternate = !alternate
        end
        (10 - (total % 10)) % 10
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
