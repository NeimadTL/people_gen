class Person
  
  attr_reader :first_name, :last_name, :scope_id, :email

  def initialize(first_name, last_name, scope_id, email)
    @first_name = first_name
    @last_name = last_name
    @scope_id = scope_id
    @email = email.downcase
  end

end
