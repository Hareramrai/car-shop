# frozen_string_literal: true

module Vehicles
  class ParseVehicle
    def initialize(raw_vehicle)
      @raw_vehicle = raw_vehicle
    end

    def call
      {
        grade: raw_vehicle[:grade],
        mileage: raw_vehicle[:mileage],
        price: raw_vehicle[:price],
        stock: raw_vehicle[:stocknumber],
        vin: raw_vehicle[:vin],
        year: raw_vehicle[:year],
        model_feature_id: find_model_feature_id
      }
    end

    private

    attr_reader :raw_vehicle

    def body_type
      type = raw_vehicle[:body].gsub(/[^0-9A-Za-z]/, '').underscore

      ModelFeature.body_types[type]
    end

    def find_model_feature_id
      finder_fields = {
        body_type: body_type,
        cylinders: raw_vehicle[:cylinders],
        displacement: raw_vehicle[:displacement]&.gsub(/l/, ''),
        manufacturer: raw_vehicle[:make],
        model: raw_vehicle[:model],
        series: raw_vehicle[:series],
        body_color_id: body_color_id
      }

      ModelFeature.find_or_create_by(finder_fields).id
    end

    def body_color_id
      finder_fields = {
        exterior: raw_vehicle[:exterior],
        interior: raw_vehicle[:interior]
      }

      BodyColor.find_or_create_by(finder_fields).id
    end
  end
end
