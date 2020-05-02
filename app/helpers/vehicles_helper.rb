# frozen_string_literal: true

module VehiclesHelper
  def interior_color_for_select
    BodyColor.distinct(:interior).pluck(:interior).sort
  end

  def exterior_color_for_select
    BodyColor.distinct(:interior).pluck(:exterior).sort
  end

  def body_type_for_select
    ModelFeature.body_types.map { |type, value| [type.humanize, value] }
  end
end
