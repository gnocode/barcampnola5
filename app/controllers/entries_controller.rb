class EntriesController < ApplicationController
  before_filter :require_login, only: [:new]

  def new
    @_entry = Entry.new
    @entry = EntryDecorator.new @_entry
  end

  def create
    @_entry = Entry.new params[:entry]
    @entry = EntryDecorator.new @_entry
    if @_entry.valid?
      @_entry.save
      flash.now[:notice] = "Entry created!"
      redirect_to entry_path(@_entry)
    else
      render :new
    end
  end

  def index
    @entries = EntryDecorator.decorate Entry.order(:start_at)
  end

  def search
    @_results = Entry.search(params[:search]) if params[:search]
    @results = EntryDecorator.decorate @_results.sort_by(&:start_at)
    @_entries = Entry.order(&:start_at).map(&:id).map(&:to_s)
    render :index
  end
end
