require "csv"
require_relative "Person"

class CSVParser

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
      email = row.join
      split_email = email.split(/\W/)
      first_name = split_email[0]
      last_name = split_email[1]
      scope_id = 14
      p = Person.new(first_name, last_name, scope_id, email)
      puts "#{p.inspect}"
    end

end


CSVParser.new("input.csv").parse
