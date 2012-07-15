class Entry < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :body
  attr_accessible :data
  attr_accessible :title
  attr_accessible :start_at
  attr_accessible :end_at
end
