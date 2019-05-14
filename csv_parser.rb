require "csv"
require_relative "person_serializer"


class CSVParser
  extend PersonSerializer

  OUTPUT_HEADER = ["first_name", "last_name", "scope_id", "email"]

  def parse
    generate_people
  end

  def write
    create_csv
    puts "'output.csv' has been created :)"
  end

  private

    def initialize(file_name)
      @csv = CSV.open(file_name, "r", headers: true)
      @people = []
    end

    def generate_people
      @csv.each do |row|
        person = CSVParser::deserialize(row)
        @people.push(person)
      end
    end

    def create_csv
      CSV.open("output.csv", "wb", write_headers: true, headers: OUTPUT_HEADER) do |csv|
        @people.each do |person|
         csv << CSVParser::serialize(person)
        end
      end
    end

end


parser = CSVParser.new("input.csv")
parser.parse
parser.write
