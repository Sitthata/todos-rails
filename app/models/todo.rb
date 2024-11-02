class Todo < ApplicationRecord
  def completed?
    completed == 1
  end
end
