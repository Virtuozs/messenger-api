require './spec/support/be_json_equal'

module RequestSpecHelper
  # Parse JSON response to ruby hash
  def response_body
    # JSON.parse(response.body, symbolize_names: true).with_indifferent_access
    JSON.parse(response.body, symbolize_names: true).with_indifferent_access
    # JSON.parse(response.body, symbolize_names: true)
  end

  def response_data
    response_body[:data]
    # Rails.logger.debug("response_data di Helper: #{response_body[:data]}")
  end

  def json_parse(json)
    JSON.parse(json.to_json, symbolize_names: true).with_indifferent_access
  end

  def expect_response(status, json = nil)
    begin
      expect(response).to have_http_status(status)
    rescue RSpec::Expectations::ExpectationNotMetError => e
      e.message << "\n#{JSON.pretty_generate(response_body)}"
      raise e
    end

    ## Sorry i rewrite the Matcher because it's always causing the test to fail
    ## the Matcher is in .spec/support/be_json_equal
    expect(response_body.to_json).to be_json_equal(json.to_json) if json
  end
end
