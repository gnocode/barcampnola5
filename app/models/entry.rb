class Entry < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_and_belongs_to_many :tags
  belongs_to :account

  before_save :create_tags

  mapping do
    indexes :id, index: :not_analyzed
    indexes :title, analyzer: 'snowball', boost: 100
    indexes :body, analyzer: 'snowball'
    indexes :start_at, type: 'date', include_in_all: false
    indexes :end_at, type: 'date', include_in_all: false
    indexes :tags, as: ->(entry) { entry.tags.map(&:name) }
  end

  attr_accessible :body
  attr_accessible :end_at
  attr_accessible :media
  attr_accessible :start_at
  attr_accessible :title
  attr_accessible :uri
  private

  def create_tags
    names = tag_names.split(/,\s*/) if tag_names
    if names.any?
      names.each do |name|
        tags << Tag.find_or_create_by_name(name)
      end
    end
  end

end
