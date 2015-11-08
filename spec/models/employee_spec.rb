require 'rails_helper'
require 'faker'

RSpec.describe Employee, :type => :model do

  let(:employee) { FactoryGirl.build(:employee) }

  it { expect(employee).to be_valid }

  describe 'validations' do
    it { expect(employee).to validate_presence_of(:name) }
    it { expect(employee).to validate_length_of(:name).is_at_most(255) }
    it { expect(employee).to allow_value('раз два три').for(:name) }
    it { expect(employee).to_not allow_value('раз').for(:name) }
    it { expect(employee).to_not allow_value('раз два').for(:name) }
    it { expect(employee).to_not allow_value('раз два три четыре').for(:name) }
    
    it { expect(employee).to allow_value(Faker::Internet.safe_email).for(:email) }
    it { expect(employee).to_not allow_value('qwe@').for(:email) }
    it { expect(employee).to_not allow_value('qwe@qwe').for(:email) }
    it { expect(employee).to_not allow_value('@qwe').for(:email) }
    it { expect(employee).to_not allow_value('qwe.ru').for(:email) }
    it { expect(employee).to_not allow_value('qwe@.ru').for(:email) }
    it { expect(employee).to_not allow_value('@qwe.qw').for(:email) }
  end
end
