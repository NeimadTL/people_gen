require_relative "person"

module PersonConverter

  def row_to_person(row)
    email = row.join
    split_email = email.split(/\W/)
    first_name = split_email[0]
    last_name = split_email[1]
    scope_id = 14
    Person.new(first_name, last_name, scope_id, email)
  end

  def person_to_row(person)
    row = [person.first_name, person.last_name, person.scope_id, person.email]
  end

end
