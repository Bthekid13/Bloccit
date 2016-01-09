require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(body: "New question Body")}
  let(:answer) {Answer.create!(body: "New Answer Body")}

  describe "attributes" do
    it "responds to body" do
      expect(question).to respond_to(:body)
    end
  end
end
