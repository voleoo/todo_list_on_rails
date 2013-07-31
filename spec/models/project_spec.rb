require 'spec_helper'

describe Project do
  describe "relations" do
    it { should have_many :tasks }
    it { should belong_to :user }
  end

  describe "validations" do
  end
end
