# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'

bug "WTR-357", :watir do
  describe "TableHeaders" do
    before :each do
      browser.goto(WatirSpec.files + "/tables.html")
    end

    describe "#length" do
      it "returns the correct number of table theads (page context)" do
        browser.theads.length.should == 1
      end

      it "returns the correct number of table theads (table context)" do
        browser.table(:index, 1).theads.length.should == 1
      end
    end

    describe "#[]" do
      it "returns the row at the given index (page context)" do
        browser.theads[1].id.should == "tax_headers"
      end

      it "returns the row at the given index (table context)" do
        browser.table(:index, 1).theads[1].id.should == "tax_headers"
      end
    end

    describe "#each" do
      it "iterates through table theads correctly (page context)" do
        browser.theads.each_with_index do |thead, index|
          thead.name.should == browser.thead(:index, index+1).name
          thead.id.should == browser.thead(:index, index+1).id
        end
      end

      it "iterates through table theads correctly (table context)" do
        table = browser.table(:index, 1)
        table.theads.each_with_index do |thead, index|
          thead.name.should == table.thead(:index, index+1).name
          thead.id.should == table.thead(:index, index+1).id
        end
      end
    end
  end
end