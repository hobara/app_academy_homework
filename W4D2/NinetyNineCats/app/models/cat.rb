require "action_view"

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  CAT_COLORS = %w(black white gray orange mixed)

  validates(
    :birth_date,
    :color,
    :name,
    :sex,
    presence: true
  )
  validates :color, inclusion: { in: CAT_COLORS, message: 'Not a valid color' }
  validates :sex, inclusion: { in: %w(M F), message: 'M or F please' }

  has_many  :rental_requests,
            dependent: :destroy,
            primary_key: :id,
            foreign_key: :cat_id,
            class_name: :CatRentalRequest

  def age
    time_ago_in_words(birth_date)
  end

end
