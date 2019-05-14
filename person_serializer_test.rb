require "minitest/autorun"
require "csv"
require_relative "Person"
require_relative "person_serializer"
require_relative "csv_parser"


describe PersonSerializer do
  before do
    @person = Person.new("alain", "dieckhoff", 14, "alain.dieckhoff@entreprisea.fr")
    @row = 'alain.dieckhoff@entreprisea.fr'
  end

  describe "when serializing a person" do
    it "must return a array" do
      CSVParser::serialize(@person).must_equal(["alain", "dieckhoff", 14, "alain.dieckhoff@entreprisea.fr"])
    end
  end

  describe "when deserializing a row" do
    it "must return a person " do
      person = CSVParser::deserialize(@row)
      person.first_name.must_equal(@person.first_name)
      person.last_name.must_equal(@person.last_name)
      person.scope_id.must_equal(14)
      person.email.must_equal(@person.email)
    end
  end
end
