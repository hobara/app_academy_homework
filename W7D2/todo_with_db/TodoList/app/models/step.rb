class Step < ApplicationRecord
  validates :title, :todo, presence: true
  validates :done, inclusion: { in: [true, false] }

  belongs_to :todo
end
