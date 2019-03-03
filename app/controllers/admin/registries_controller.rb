# frozen_string_literal: true

class Admin::RegistriesController < Admin::BaseController

  before_action :find_registry, only: %i[show]

  def index
    @registries = search
  end

  def show; end

  private

  def find_registry
    @registry = Registry.find(params[:id])
  end

  def search
    if params[:search].present?
      start_date = Date.strptime(params[:search][:start_date], '%m/%d/%Y')
      end_date = Date.strptime(params[:search][:end_date], '%m/%d/%Y')
    
      Registry.where(created_at: start_date..end_date)
    else
      Registry.all
    end
  end

end
