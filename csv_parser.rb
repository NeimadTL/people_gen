require "csv"
require_relative "person_converter"


class CSVParser
  extend PersonConverter

  def parse
    @csv.each do |row|
      generate_person(row)
    end
  end

  private

    def initialize(file_name)
      open(file_name)
    end

    def open(file_name)
      @csv = CSV.open(file_name, "r")
    end

    def generate_person(row)
      CSVParser::row_to_person(row)
    end

end


CSVParser.new("input.csv").parse
