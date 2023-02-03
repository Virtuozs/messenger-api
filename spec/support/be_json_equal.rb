RSpec::Matchers.define :be_json_equal do |expected|
    match do |actual|
      parse_actual = JSON.parse(actual)
      parse_expected = JSON.parse(expected)
      parse_actual.keys == parse_expected.keys && parse_actual.values.map(&:class) == parse_expected.values.map(&:class)
    end
  
    failure_message do |actual|
      "expected #{actual} to be equal to JSON representation of #{expected}"
    end
  
    description do
      "be equal to the JSON representation of #{expected}"
    end
  end