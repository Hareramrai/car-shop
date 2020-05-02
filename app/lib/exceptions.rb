# frozen_string_literal: true

module Exceptions
  class ImportFileMissingError < StandardError
    def message
      "Vehicles csv file doesn't exists"
    end
  end
end
