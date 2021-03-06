# == Schema Information
#
# Table name: vehicles
#
#  id               :bigint           not null, primary key
#  grade            :float
#  mileage          :integer
#  price            :decimal(10, 2)
#  stock            :integer
#  vin              :string
#  year             :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  model_feature_id :bigint
#
# Indexes
#
#  index_vehicles_on_mileage           (mileage)
#  index_vehicles_on_model_feature_id  (model_feature_id)
#  index_vehicles_on_price             (price)
#  index_vehicles_on_year              (year)
#
# Foreign Keys
#
#  fk_rails_...  (model_feature_id => model_features.id)
#

FactoryBot.define do
  factory :vehicle do
    sequence(:vin) { |n| "V12#{n}" }
    grade { 1.5 }
    stock { 10 }
    price { 9.99 }
    year { 2020 }
    mileage { 1000 }
    model_feature
  end
end
