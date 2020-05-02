# frozen_string_literal: true

namespace :imports do
  task :vehicles, [:file_path] => [:environment] do |_task, args|
    begin
      Vehicles::CsvImporter.new(args[:file_path]).call
      puts 'Imports completed'
    rescue StandardError => e
      puts "Failed to import #{e.message}"
      puts "Backtrace:\n\t#{e.backtrace.join("\n\t")}"
    end
  end
end
