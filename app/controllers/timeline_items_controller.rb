class TimelineItemsController < ApplicationController
  before_action :set_timelineable

  def create
    @timeline_item = @timelineable.timeline_items.create!(user: current_user, **timeline_item_params)

    render partial: "index", layout: false, status: :created
  end

  def index
  end

  private

  def set_timelineable
    @timelineable = timeline_item_params[:timelineable_type].classify.constantize.find(timeline_item_params[:timelineable_id])
  end

  def timeline_item_params
    params.require(:timeline_item).permit(:timelineable_type, :timelineable_id, :comment, :action, data: {})
  end

end
