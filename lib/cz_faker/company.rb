module CzFaker
  class Company < CzFaker::Base
    class << self

      def name
        [base_name, suffix].join(" ")
      end

      def suffix
        CzFaker::Data::SUFFIXES.sample
      end

      def base_name
        CzFaker::Data::BASE_NAMES.sample
      end

      def ico
        sum = 0
        base = []
        (0..6).to_a.each do |weight|
          base << Number.integer(1).to_i
          sum += (8 - weight) * base.last
        end
        base << (11 - (sum % 11)) % 10
        base.join
      end

      def dic(number = nil)
        ["CZ", number.nil? ? ico : number ].join("")
      end

      def cznace
        "Zemedelstvi"
      end

      def legal_form_name
        load_company['legal_forms'].sample['name']
      end

      def legal_form_code
        load_company['legal_forms'].sample['name']
      end

      def legal_form_code
        while (short = load_company['legal_forms'].sample['short']).nil?
        end
        short
      end

      private

      def load_company
        @company ||= sample_data('company')
        @company
      end

    end
  end
end
