require 'spec_helper'

describe User do
  describe "relations" do
    it { should have_many :projects }
  end

  describe "validations" do
  end
end
