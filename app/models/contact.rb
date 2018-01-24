class Contact < ApplicationRecord

  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :email, uniqueness: true 
  validates :email, format: {with: /\A.{2,}@\w{2,}[.][a-zA-Z]{2,3}\z/, message: "invalid"}

  def friendly_created_at 
    created_at.strftime("%m/%d/%Y")
  end 

  def full_name_method
    "#{first_name} #{middle_name} #{last_name}".titleize 
  end 

  def japan_phone_number 
    "+81 #{phone_number}"
  end 

  def as_json 
    {
      id: id,
      full_name: full_name_method, 
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      bio: bio,
      email: email,
      phone_number: phone_number,
      created_at: friendly_created_at
      }
  end
end
