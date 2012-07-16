class Entry < ActiveRecord::Base
  acts_as_taggable
  belongs_to :account

  attr_accessible :body
  attr_accessible :end_at
  attr_accessible :media
  attr_accessible :start_at
  attr_accessible :title
  attr_accessible :uri

end

