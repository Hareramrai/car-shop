require 'csv'

module Vehicles
  class CsvImporter
    def initialize(file_name)
      @file_name = file_name
      @importer = Vehicles::Importer.new
    end

    def call
      raise Exceptions::ImportFileMissingError unless File.exist?(file_name)

      csv_options = {
        headers: true, header_converters: :symbol
      }

      CSV.foreach(file_name, csv_options) do |vehicle_row|
        vehicle = parse_vehicle_row(vehicle_row)

        importer.add(vehicle)
      end

      importer.import
    end

    private

    attr_reader :file_name, :importer

    def parse_vehicle_row(vehicle_row)
      Vehicles::ParseVehicle.new(vehicle_row).call
    end
  end
end
