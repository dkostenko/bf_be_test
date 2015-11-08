module Skillable
  extend ActiveSupport::Concern

  included do
    has_many :skills_holders, :as => :holder, :class_name => 'Skill::Holder', :dependent => :delete_all, :validate => false
    has_many :skills, :through => :skills_holders
    
    attr_accessible :skill_ids
  end
end
