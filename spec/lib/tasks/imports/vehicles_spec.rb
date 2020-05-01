# frozen_string_literal: true

require 'rails_helper'

describe 'imports:vehicles' do
  let(:task) { Rake::Task['imports:vehicles'] }
  let(:data_file_path) { 'spec/fixtures/vehicles.csv' }

  it 'imports all the vehicles and related data from csv file' do
    expect(Vehicle.all).to be_blank

    expect { task.invoke(data_file_path) }.to output.to_stdout

    expect(Vehicle.any?).to be_truthy
    expect(ModelFeature.any?).to be_truthy
    expect(BodyColor.any?).to be_truthy
  end
end
