class Skill < ActiveRecord::Base
  attr_accessible :name
  
  # #############################################################
  # Associations
  
  has_many :holders, :class_name => 'Skill::Holder'

  has_many :employees, :through => :holders, :source => :holder, :source_type => 'Employee'
  has_many :vacancies, :through => :holders, :source => :holder, :source_type => 'Vacancy'
  
  # #############################################################
  # Validations

  validates :name, :presence => true, :uniqueness => true
end
