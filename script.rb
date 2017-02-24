input = 
"Lead Chef, Chipotle, Denver, CO, 10, 15
Stunt Double, Equity, Los Angeles, CA, 15, 25
Manager of Fun, IBM, Albany, NY, 30, 40
Associate Tattoo Artist, Tit 4 Tat, Brooklyn, NY, 250, 275
Assistant to the Regional Manager, IBM, Scranton, PA, 10, 15
Lead Guitarist, Philharmonic, Woodstock, NY, 100, 200"

input = input.split("\n")

class Opportunity

  attr_reader :title, :organization, :city, :state, :pay_min, :pay_max

  def initialize(title, organization, city, state, pay_min, pay_max)
    @title = title
    @organization = organization
    @city = city
    @state = state
    @pay_min = pay_min
    @pay_max = pay_max
  end

  def to_s
    "Title: #{title}, Organization: #{organization}, city: #{city}, state: #{state}, Pay: #{pay_min}-#{pay_max}"
  end
end

def parse_opportinities(input)
  input.map do |opportunity|
    title, organization, city, state, pay_min, pay_max = opportunity.split(",").map(&:strip)

    Opportunity.new(title, organization, city, state, pay_min, pay_max)
  end.sort_by(&:title)  
end

puts "All Opportunities"
puts parse_opportinities(input)
