require 'spec_helper'

describe "Question Model" do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @ryan = FactoryGirl.create(:user, :username => 'ryan')
    @question = FactoryGirl.create(:question, :title => 'test question?')
    @question.user = @ryan
    @kevin = FactoryGirl.create(:user, :username => 'kevin')
    @matt = FactoryGirl.create(:user, :username => 'matt')
  end
  it "has a valid factory" do
    FactoryGirl.create(:question).should be_valid
  end
  it "properly calculates votes" do
    @question.upvote(@kevin)
    @question.upvote(@matt)
    @question.score.should == 2
  end
  it "has a score of 0 with no votes" do
    @question.score.should == 0
  end
  it "allows users to vote once" do
    @question.upvote(@kevin)
    @question.upvote(@kevin).should be_false
    @question.score.should == 1
  end
  it "is invalid without a title" do
    FactoryGirl.build(:question, :title => nil).should_not be_valid
  end
  it "is invalid if title is not unique" do
    FactoryGirl.create(:question, :title => "Why is the sky blue?").should be_valid
    -> { FactoryGirl.create(:question, :title => "Why is the sky blue?") }.should raise_error(ActiveRecord::RecordInvalid)
  end
end
