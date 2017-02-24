require "minitest/autorun"
require_relative "script.rb"

class TestOpportunity < MiniTest::Unit::TestCase
  def setup
    @input = "Lead Chef, Chipotle, Denver, CO, 10, 15
              Associate Tattoo Artist, Tit 4 Tat, Brooklyn, NY, 250, 275".split("\n")

    @input_with_empty_string = "Lead Chef, Chipotle, , CO, 10, 15
                                Stunt Double, Equity, Los Angeles, CA, 15, 25".split("\n")

    @opportunity = Opportunity.new("Lead Chef", "Chipotle", "Denver", "CO", "10", "15")
  end

  def test_alphabetical_filter
    sorted = parse_opportinities(@input)
    assert_equal sorted[0].title, "Associate Tattoo Artist"
  end

  def test_empty_string
    sorted = parse_opportinities(@input_with_empty_string)
    assert_equal sorted.first.to_s, "Title: Lead Chef, Organization: Chipotle, city: , state: CO, Pay: 10-15"
  end

  def test_opportunity_string_format
    assert_equal @opportunity.to_s, "Title: Lead Chef, Organization: Chipotle, city: Denver, state: CO, Pay: 10-15"
  end
end
