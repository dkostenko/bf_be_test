class Skill::Holder < ActiveRecord::Base
  self.table_name = 'skills_holders'

  attr_accessible :skill_id, :holder_id, :holder_type

  # #############################################################
  # Associations

  belongs_to :skill
  belongs_to :holder, :polymorphic => true

  belongs_to :employee, :class_name => 'Employee', :foreign_key => 'holder_id'
  belongs_to :vacancy, :class_name => 'Vacancy', :foreign_key => 'holder_id'
  
  # #############################################################
  # Validations

  validates :skill, :presence => true, :uniqueness => {:scope => [:holder_id, :holder_type]}
  validates :holder, :presence => true
end
