require "csv"
require_relative "person_serializer"


class CSVParser
  extend PersonSerializer

  def parse
    csv = open(@source, "r", headers: true)
    csv.each do |row|
      @objects.push(CSVParser::deserialize(row))
    end
  end

  def write(output = @destination)
    output_header = @objects.first.instance_variables.join.scan(/\w+/)
    csv = open(@destination, "wb", write_headers: true, headers: output_header)
    @objects.each do |object|
      csv << CSVParser::serialize(object)
    end
    puts "'#{@destination}' has been created :)"
  end

  private

    def initialize(source, destination = "output.csv")
      @destination = destination
      @source = source
      @objects = []
    end

    # accepted params:
    # write_headers: boolean, headers: []
    def open(source, mode, **params)
      CSV.open(source, mode, params)
    end
end


parser = CSVParser.new("input.csv")
parser.parse
parser.write
