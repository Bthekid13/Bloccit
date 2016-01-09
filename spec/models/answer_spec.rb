require 'rails_helper'

RSpec.describe Answer, type: :model do
let(:question) {Question.create!(body: "New question Body")}
let(:answer) {Answer.create!(body: "New Answer Body")}

  describe "attributes" do
    it "resonds to body" do
      expect(answer).to respond_to(:body)
    end
  end
end
