require 'rails_helper'
require 'faker'

RSpec.describe Vacancy, :type => :model do

  let(:vacancy) { FactoryGirl.build(:vacancy) }

  it { expect(vacancy).to be_valid }

  describe 'validations' do
    it { expect(vacancy).to validate_presence_of(:title) }
    it { expect(vacancy).to validate_length_of(:title).is_at_most(255) }
    
    it { expect(vacancy).to validate_presence_of(:contacts) }
    it { expect(vacancy).to validate_length_of(:contacts).is_at_most(255) }
    
    it { expect(task).to validate_numericality_of(:salary).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(2147483647).only_integer }
  end
end
