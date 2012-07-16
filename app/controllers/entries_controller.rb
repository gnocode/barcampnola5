class EntriesController < ApplicationController
  def new
    @_entry = Entry.new
    @entry = EntryDecorator.new @_entry
  end

  def create
    @_entry = Entry.new params[:entry]
    @entry = EntryDecorator.new @_entry
  end

  def index
    @entries = EntryDecorator.decorate Entry.order(:start_at)
  end
end
