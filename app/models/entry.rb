class Entry < ActiveRecord::Base
  attr_accessible :body
  attr_accessible :data
  attr_accessible :title
  attr_accessible :start_at
  attr_accessible :end_at
end
