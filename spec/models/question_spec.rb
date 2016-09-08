require 'rails_helper'

RSpec.describe Question, type: :model do
  describe Question do
    it "has a valid factory" do
      question = create(:question)
      expect(question).to be_valid
    end
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:answer) }
  end
end
