# frozen_string_literal: true

class Admin::RegistriesController < Admin::BaseController

  before_action :find_registry, only: %i[show]

  def index
    @registries = search

    respond_to do |format|
      format.html
      format.pdf do
        render template: 'admin/registries/_pdf.html',
               pdf: "Reportes", # pdf will download as Reportes.pdf
               show_as_html: params[:debug].present? # renders html version if you set debug=true in URL
      end
    end
  end

  def show; end

  private

  def find_registry
    @registry = Registry.find(params[:id])
  end

  def search
    if params[:start_date].present? && params[:end_date].present?
      @start_date = Date.strptime(params[:start_date], '%m/%d/%Y')
      @end_date = Date.strptime(params[:end_date], '%m/%d/%Y')
    
      Registry.where(created_at: @start_date..@end_date)
    else
      Registry.all
    end
  end

end
