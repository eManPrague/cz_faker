module CzFaker
  class Date < CzFaker::Base

    MONTHS = %w[ leden únor březen duben květen červen červenec srpen září říjen listopad prosinec ].freeze
    YEARS = (1950..(Time.now.year))

    class << self
      def numbers(year = YEARS)
        random_date(year).strftime("%-d.%-m.%Y")
      end

      def numbers_without_dots(year = YEARS)
        random_date(year).strftime("%d%m%Y")
      end

      def numbers_padded(year = YEARS)
        random_date(year).strftime("%d.%m.%Y")
      end

      def words(year = YEARS)
        date = random_date(year)
        "#{date.day}. #{MONTHS[date.month - 1]} #{date.year}"
      end

      def random_date(year = YEARS)
        return rand(::Date.civil(year.min, 1, 1)..::Date.civil(year.max, 12, 31)) if year.is_a?(Range)

        rand(::Date.civil(year, 1, 1)..::Date.civil(year, 12, 31))
      end

    end
  end
end
