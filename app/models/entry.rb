class Entry < ActiveRecord::Base
  acts_as_taggable
  attr_accessible :body, :date, :title
end
