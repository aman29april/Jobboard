class HomeController < ApplicationController

  def index
    data = JobSearch.new(params).search
    @results = DataPresentor.jobs(data)
    render
  end

  def jdp
    data = JobSearch.new.find(params[:did])
    @result = DataPresentor.to_obj(data)
    render :jdp
  end
end
