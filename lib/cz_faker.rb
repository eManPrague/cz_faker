require 'yaml'

module CzFaker
  BASE_LIB_PATH = File.expand_path(__dir__)

  class Base
    class << self
      def sample_data(dataset)
        data_path = "#{CzFaker::BASE_LIB_PATH}/data/#{dataset}.yaml"
        YAML.load(File.open(data_path))
      end
    end
  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'cz_faker', '*.rb')).sort.each { |f| require f }
Dir.glob(File.join(File.dirname(__FILE__), 'cz_faker', 'validator', '*.rb')).sort.each { |f| require f }
