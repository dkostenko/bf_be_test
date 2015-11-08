class Vacancy < ActiveRecord::Base
  include Skillable
  
  attr_accessible :title, :contacts, :salary, :expired_at
  
  # #############################################################
  # Associations
  
  has_many :skill_employees, :through => :skills, :source => :employees
  
  # #############################################################
  # Validations
  
  validates :title, :presence => true, :length => { :maximum => 255 }
  validates :contacts, :presence => true, :length => { :maximum => 255 }
  
  validates :salary, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 2147483647 }
end
