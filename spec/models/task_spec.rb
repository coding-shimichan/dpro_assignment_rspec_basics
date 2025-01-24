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
    end

    # it "完了期限が過去の日付の場合、タスクのバリデーションが無効であること" do
    it "is invalid if the deadline is in the past" do
    end

    # it "完了期限が今日の日付の場合、タスクのバリデーションが有効であること" do
    it "is valid if the deadline is today" do
    end
  end
end
