module Vehicles
  class Importer
    def initialize(batch_size: 500)
      @batch_size = batch_size
      @batch_record = []
    end

    def add(vehicle)
      batch_record << vehicle

      import if batch_size == batch_record.size
    end

    def import
      result = Vehicle.import batch_record, validate: true
      @batch_record = []
    end

    private

    attr_accessor :batch_size, :batch_record
  end
end
