require 'spec_helper'

describe KarmaPoint do
  it { should belong_to(:user) }

  describe '#valid?' do
    it { should validate_presence_of(:user) }

    it { should validate_presence_of(:label) }

    it { should validate_numericality_of(:value).only_integer }
    it { should allow_value(0).for(:value) }
    it { should allow_value(1).for(:value) }
    it { should_not allow_value(-1).for(:value) }
  end

  describe '#save' do
    let(:user) { create(:user) }

    it "increments the user's total_karma by the value of the karma point" do
      expect {
        create(:karma_point, :user => user, :value => 10)
      }.to change(user, :total_karma).by(10)
    end
  end
end
