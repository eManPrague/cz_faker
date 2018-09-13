module CzFaker
  class PaymentMethod < CzFaker::Base

    METHODS = %w[ převodem složenkou SIPO inkaso sepa ].freeze

    class << self
      def method
        METHODS.sample
      end
    end
  end
end
