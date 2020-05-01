require 'rails_helper'

RSpec.describe Vehicles::ParseVehicle, type: :model do
  let!(:model_feature) { create(:model_feature) }
  let(:vehicle) { build(:vehicle) }

  let(:raw_vehicle) do
    {
      grade:          vehicle.grade,
      mileage:        vehicle.mileage,
      price:          vehicle.price,
      stocknumber:    vehicle.stock,
      vin:            vehicle.vin,
      year:           vehicle.year,
      body:           model_feature.body_type,
      cylinders:      model_feature.cylinders,
      displacement:   model_feature.displacement,
      make:           model_feature.manufacturer,
      model:          model_feature.model,
      series:         model_feature.series,
      exterior:       model_feature.body_color.exterior,
      interior:       model_feature.body_color.interior
    }
  end

  let(:expected_response) do
    {
      grade:             vehicle.grade,
      mileage:           vehicle.mileage,
      price:             vehicle.price,
      stock:             vehicle.stock,
      vin:               vehicle.vin,
      year:              vehicle.year,
      model_feature_id:  model_feature.id
    }
  end

  subject { described_class.new(raw_vehicle) }

  describe '#call' do
    it 'returns formatted vehicle hash & reuse existing model_feature' do
      expect(subject.call).to eq(expected_response)
    end
  end
end
