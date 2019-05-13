require_relative "person"

module PersonConverter

  def row_to_person(row)
    email = row.join
    split_email = email.split(/\W/)
    first_name = split_email[0]
    last_name = split_email[1]
    scope_id = 14
    p = Person.new(first_name, last_name, scope_id, email)
    puts "#{p.inspect}"
  end

end
