class Todo < ApplicationRecord
  belongs_to :assignee

  validates :title, presence: true
  validates :assignee, presence: true

  def completed?
    completed == 1
  end
end
