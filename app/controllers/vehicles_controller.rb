# frozen_string_literal: true

class VehiclesController < ApplicationController
  def index
    @search = Vehicle.ransack(params[:q])
    @vehicles = @search
      .result
      .includes(:model_feature, :body_color)
      .page params[:page]
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
