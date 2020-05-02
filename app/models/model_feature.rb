# frozen_string_literal: true

# == Schema Information
#
# Table name: model_features
#
#  id            :bigint           not null, primary key
#  body_type     :integer
#  cylinders     :integer
#  displacement  :float
#  manufacturer  :string
#  model         :string
#  series        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  body_color_id :bigint
#
# Indexes
#
#  index_model_features_on_body_color_id  (body_color_id)
#  index_model_features_on_body_type      (body_type)
#
# Foreign Keys
#
#  fk_rails_...  (body_color_id => body_colors.id)
#

class ModelFeature < ApplicationRecord
  enum body_type: {
    sedan: 0, suv: 1, convertible: 2, wagon_hatchback: 3, pickup: 4,
    crossover_utility_vehicle: 5, van: 6, coupe: 7, minivan: 8, wagon: 9
  }

  # validations
  validates :manufacturer, :body_type, :model, :series, presence: true

  # relationship
  has_many :vehicles, dependent: :destroy

  belongs_to :body_color
end
