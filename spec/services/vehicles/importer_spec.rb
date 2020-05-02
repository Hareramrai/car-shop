require 'rails_helper'

RSpec.describe Vehicles::Importer, type: :model do
  let(:model_feature) { create(:model_feature) }
  let(:vehicle) { attributes_for(:vehicle, model_feature_id: model_feature.id) }

  subject { described_class.new }

  describe '#add' do
    it 'responds to add call' do
      expect(subject).to respond_to(:add).with(1).argument
    end

    it "won't invoke import when have record less than batch size" do
      expect { subject.add(vehicle) }.to change { Vehicle.count }.by(0)
    end
  end

  describe '#import' do
    it 'saves existing data' do
      subject.add(vehicle)

      expect { subject.import }.to change { Vehicle.count }.by(1)
    end
  end
end
