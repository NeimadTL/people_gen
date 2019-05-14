require "csv"
require_relative "person_serializer"


class CSVParser
  extend PersonSerializer

  def parse
    @csv.each do |row|
      generate_person(row)
    end
  end

  def write
    create_csv
  end

  private

    def initialize(file_name)
      open(file_name)
      @people = []
    end

    def open(file_name)
      @csv = CSV.open(file_name, "r")
    end

    def generate_person(row)
      person = CSVParser::deserialize(row)
      @people.push(person)
    end

    def create_csv
      CSV.open("output.csv", "wb") do |csv|
        @people.each do |person|
         csv << CSVParser::serialize(person)
        end
      end
    end

end


parser = CSVParser.new("input.csv")
parser.parse
parser.write
