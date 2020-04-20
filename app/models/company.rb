class Company < ApplicationRecord
  has_many :employees
  has_many :users, through: :employees
  has_many :ideas
  accepts_nested_attributes_for :employees, allow_destroy: true

  def admin_user?(current_user)
    if self.users.find(current_user.id).employees.find_by(company_id: id).admin == true
      true
    else
      false
    end
  end

end
