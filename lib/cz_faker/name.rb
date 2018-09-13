module CzFaker
  class Name < CzFaker::Base
    class << self

      def first_name(gender = :random)
        load_names['first_names'][random_gender(gender)].sample['name']
      end

      def last_name(gender = :random)
        load_names['last_names'][random_gender(gender)].sample['name']
      end

      def name(gender = :random)
        gender = random_gender(gender)
        [first_name(gender), last_name(gender)].join(" ")
      end

      def name_with_prefix(gender = :random)
        [prefix, name(gender)].join(" ")
      end

      def name_with_suffix(gender = :random)
        [name(gender), suffix].join(" ")
      end

      def name_with_titles(gender = :random)
        [prefix, name(gender), suffix].join(" ")
      end

      def random_gender(gender = :random)
        gender == :random ? CzFaker::Data::GENDER_SYMBOLS.sample.to_s : gender.to_s
      end

      def prefix
        CzFaker::Data::NAME_PREFIXES.sample
      end

      def suffix
        CzFaker::Data::NAME_SUFFIXES.sample
      end

      private

      def load_names
        @names ||= sample_data('name')
        @names
      end
    end
  end
end
