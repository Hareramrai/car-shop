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

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:mileage) }
    it { should validate_presence_of(:grade) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:vin) }
    it { should validate_presence_of(:year) }
  end

  describe 'relationships' do
    it { should belong_to(:model_feature) }
  end
end
