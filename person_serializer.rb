require_relative "Person"

module PersonSerializer

  def deserialize(row)
    email = row.join
    split_email = email.split(/\W/)
    first_name = split_email[0]
    last_name = split_email[1]
    scope_id = 14
    Person.new(first_name, last_name, scope_id, email)
  end

  def serialize(person)
    row = [person.first_name, person.last_name, person.scope_id, person.email]
  end

end
