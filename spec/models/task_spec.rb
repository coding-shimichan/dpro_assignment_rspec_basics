require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "バリデーション" do
    # it "タイトルが未入力の場合、タスクのバリデーションが無効であること" do
    it "is invalid without title" do
      task = Task.new(title: nil, description: "test", status: :todo, deadline: Time.current)
      expect(task).to be_invalid
      expect(task.errors.full_messages).to eq ["Title can't be blank"]
    end

    # it "ステータスが未入力の場合、タスクのバリデーションが無効であること" do
    it "is invalid without status" do
      task = Task.new(title: "test", description: "test", status: nil, deadline: Time.current)
      expect(task).to be_invalid
      expect(task.errors.full_messages).to eq ["Status can't be blank"]
    end

    # it "完了期限が未入力の場合、タスクのバリデーションが無効であること" do
    it "is invalid without deadline" do
      task = Task.new(title: "test", description: "test", status: :todo, deadline: nil)
      expect(task).to be_invalid
      expect(task.errors.full_messages).to eq ["Deadline can't be blank"]
    end

    # it "完了期限が過去の日付の場合、タスクのバリデーションが無効であること" do
    it "is invalid if the deadline is in the past" do
      task = Task.new(title: "test", description: "test", status: :todo, deadline: Time.current - (60*60*24*365))
      expect(task).to be_invalid
      expect(task.errors.full_messages).to eq ["Deadline must start from today."]
    end

    # it "完了期限が今日の日付の場合、タスクのバリデーションが有効であること" do
    it "is valid if the deadline is today" do
      task = Task.new(title: "test", description: "test", status: :todo, deadline: Time.current)
      expect(task).to be_valid
      expect(task.errors.any?).to be false
    end
  end
end
