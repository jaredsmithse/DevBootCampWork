require "rspec"

require_relative "list"

describe List do
  let(:list) { List.new("test") }

  describe "#initialize" do

  	it "should default tasks to an empty array if none are given" do
      expect(List.new("test").tasks).to eq []
    end

  end


  describe "#title" do
    it "should be readable" do
      expect(list.title).to eq "test"
    end

    it "should not be editable" do
      expect {list.title = "new test"}.to raise_error NoMethodError
    end

  end


  describe "#tasks" do
    it "should be readable" do
      expect(list.tasks).to eq []
    end

    it "should not be editable" do 
      
    end

  end


  describe "#add_task" do
    it "should add a given task to the tasks list"

  end


  describe "#complete_task" do
    it "should mark the given task as complete"

  end


  describe "#delete_tasks" do
    it "should delete the given task from the tasks list"

  end


  describe "#completed_tasks" do
    it "should find all completed tasks"

    it "should not have any incomplete tasks in the returned array"

  end


  describe "#incomplete_tasks" do
    it "should have all of the incomplete tasks returned"

    it "should not have any complete tasks returned"

  end

end