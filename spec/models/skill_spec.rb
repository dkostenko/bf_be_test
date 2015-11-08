require 'rails_helper'
require 'faker'

RSpec.describe Skill, :type => :model do

  let(:skill) { FactoryGirl.build(:skill) }

  it { expect(skill).to be_valid }

  describe 'validations' do
    it { expect(skill).to validate_presence_of(:name) }
  end
end
