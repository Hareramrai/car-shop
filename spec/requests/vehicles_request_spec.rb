require 'rails_helper'

RSpec.describe 'Vehicles', type: :request do
  let(:wagon_model) { create(:model_feature, body_type: 'wagon') }
  let!(:vehicle1) { create(:vehicle, price: 10000, mileage: 5000) }
  let!(:vehicle2) { create(:vehicle, price: 15000, mileage: 3000, model_feature: wagon_model) }
  let!(:vehicle3) { create(:vehicle, price: 8000, mileage: 8000) }

  describe '/GET vehicles' do
    context 'without search query' do
      it 'returns all vehicles' do
        get vehicles_url

        expect(response).to render_template(:index)

        expect(response.body).to include(vehicle1.vin)
        expect(response.body).to include(vehicle2.vin)
        expect(response.body).to include(vehicle3.vin)
      end
    end

    context 'with search query' do
      context 'when passing price query' do
        let(:price_query) { { price_gteq: 8001, price_lteq: 11000 } }

        it 'returns filtered record' do
          get vehicles_url, params: { q: price_query }

          expect(response).to render_template(:index)

          expect(response.body).to include(vehicle1.vin)
          expect(response.body).not_to include(vehicle2.vin)
          expect(response.body).not_to include(vehicle3.vin)
        end
      end

      context 'when passing mileage query' do
        let(:mileage_query) { { mileage_gteq: 3001 } }

        it 'returns filtered record' do
          get vehicles_url, params: { q: mileage_query }

          expect(response).to render_template(:index)

          expect(response.body).to include(vehicle1.vin)
          expect(response.body).not_to include(vehicle2.vin)
          expect(response.body).to include(vehicle3.vin)
        end
      end

      context 'when passing body color query' do
        let(:body_color) { { body_color_interior_eq: 'Red' } }

        it 'returns filtered record' do
          get vehicles_url, params: { q: body_color }

          expect(response).to render_template(:index)

          expect(response.body).to include(vehicle1.vin)
          expect(response.body).to include(vehicle2.vin)
          expect(response.body).to include(vehicle3.vin)
        end
      end

      context 'when passing body_type query' do
        let(:body_type) { { model_feature_body_type_eq: 9 } }

        it 'returns filtered record' do
          get vehicles_url, params: { q: body_type }

          expect(response).to render_template(:index)

          expect(response.body).not_to include(vehicle1.vin)
          expect(response.body).to include(vehicle2.vin)
          expect(response.body).not_to include(vehicle3.vin)
        end
      end
    end
  end

  describe '/GET vehicles/:id' do
    it 'render show page with a given vehicle' do
      get vehicle_url(vehicle1)

      expect(response).to render_template(:show)
      expect(response.body).to include(vehicle1.vin)
    end
  end
end
