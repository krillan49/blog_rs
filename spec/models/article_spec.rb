require 'rails_helper'

describe Article do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
    it { should validate_length_of(:title).is_at_most(140) } # не больше чем 140
    it { should validate_length_of(:text).is_at_most(4000) }
  end

  describe "assotiations" do
    it { should have_many :comments }
  end

  describe "#subject" do
    it "returns the article title" do
      # arrange + act
      article = create(:article, title: 'Foo Bar')
      # assert
      expect(article.subject).to eq 'Foo Bar'
    end
  end

end