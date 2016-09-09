require 'rails_helper'

RSpec.describe Question, type: :model do
  describe Question do
    it "has a valid factory" do
      question = create(:question)
      expect(question).to be_valid
    end
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:answer) }

    it "get to next question" do
      question1 = create(:question)
      question2 = create(:question)
      expect(question1.next).to eq(question2)
    end
  end
end
