require 'rails_helper'

RSpec.describe VehiclesHelper, type: :helper do
  let!(:body_color1) { create(:body_color) }
  let!(:body_color2) { create(:body_color, interior: 'Red', exterior: 'White') }

  describe 'interior_color_for_select' do
    it 'returns an array of uniq interior colors' do
      expect(helper.interior_color_for_select).to eq(['Red'])
    end
  end

  describe 'exterior_color_for_select' do
    it 'returns an array of uniq interior colors' do
      expect(helper.exterior_color_for_select).to eq(%w[Black White])
    end
  end

  describe 'body_type_for_select' do
    it 'returns an array of available body_type' do
      expect(helper.body_type_for_select).to include(['Sedan', 0], ['Wagon', 9])
    end
  end
end
