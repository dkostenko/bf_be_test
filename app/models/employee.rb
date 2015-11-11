class Employee < ActiveRecord::Base
  include Skillable
  include EmailRegex
  
  attr_accessible :name, :email, :phone, :status, :salary
  
  # #############################################################
  # Associations

  has_many :skill_vacancies, :through => :skills, :source => :vacancies do
    def full_match
      self.select{|vacancy| vacancy.skill_ids.sort == proxy_association.owner.skill_ids.sort }
    end
  end
  
  # #############################################################
  # Validations
  
  validates :name, :presence => true, :length => { :maximum => 255 }, :format => { with: /^[а-яА-Я]+\s[а-яА-Я]+\s[а-яА-Я]+$/, :message => 'only_tree_cyrillic_words', :multiline => true }
  validates :email, :format => { :with => email_regex }
  # TODO: For phone format validation use gem 'phony_rails'.
  
  validate :presence_of_phone_or_email
  
  # #############################################################
  # Scopes
  
  scope :actively_seeking, -> { where(:status => true) }
  
  # #############################################################
  # Instance methods
  
  protected
  
  def presence_of_phone_or_email
    if email.empty? && phone.empty?
      errors.add(:email, :blank)
      errors.add(:phone, :blank)
    end
  end
end
