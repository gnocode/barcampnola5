class TagsController < ApplicationController

  def index
    @tags = Entry.tag_counts_on(:tags)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end
end
