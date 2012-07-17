class Entry < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_and_belongs_to_many :tags
  belongs_to :account

  attr_accessible :body
  attr_accessible :end_at
  attr_accessible :media
  attr_accessible :start_at
  attr_accessible :title
  attr_accessible :uri

end
