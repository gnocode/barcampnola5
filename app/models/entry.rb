class Entry < ActiveRecord::Base
  acts_as_taggable
  
  attr_accessible :body
  attr_accessible :date
  attr_accessible :title
  attr_accessible :start_at
  attr_accessible :end_at
end
