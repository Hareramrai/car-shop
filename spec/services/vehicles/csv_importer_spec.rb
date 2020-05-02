require 'rails_helper'

RSpec.describe Vehicles::CsvImporter, type: :model do
  subject { described_class.new(file_name) }

  context 'when file path missing' do
    let(:file_name) { 'spec/fixtures/vehicles1.csv' }

    it 'raise the file missing exception' do
      expect { subject.call }
        .to raise_error.with_message(/Vehicles csv file doesn't exists/)
    end
  end

  context 'when file path exists' do
    let(:file_name) { 'spec/fixtures/vehicles.csv' }

    it 'creates the record in vehicles, model_features & body_colors table' do
      expect { subject.call }.to change { Vehicle.count }.by(2).and \
        change { ModelFeature.count }.by(1).and change { BodyColor.count }.by(1)
    end
  end
end
