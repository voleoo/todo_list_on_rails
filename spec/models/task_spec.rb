require 'spec_helper'

describe Task do
  describe "relations" do
    it { should belong_to :project }
  end

  describe "validations" do
  end
end
