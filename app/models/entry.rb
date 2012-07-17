class Entry < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  index_name BONSAI_INDEX_NAME if ENV['BONSAI_INDEX_URL']

  has_and_belongs_to_many :tags

  belongs_to :account

  mapping do
    indexes :id, index: :not_analyzed
    indexes :title, analyzer: 'snowball', boost: 100
    indexes :body, analyzer: 'snowball'
    indexes :start_at, type: 'date', include_in_all: false
    indexes :end_at, type: 'date', include_in_all: false
    indexes :tags, as: ->(entry) { entry.tags.map(&:name) }
  end

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :title, length: 5..140
  validates :body, presence: true

  before_save :create_tags
  after_create :render_markdown

  attr_accessible :body
  attr_accessible :end_at
  attr_accessible :media
  attr_accessible :start_at
  attr_accessible :title
  attr_accessible :uri
  attr_accessible :tag_names
  attr_accessor :tag_names

  private

  def create_tags
    names = tag_names.split(/,\s*/) if tag_names
    if names.any?
      names.each do |name|
        tags << Tag.find_or_create_by_name(name)
      end
    end
  end

  def render_markdown
    Rails.cache.write "entry[#{id}][body]", markdown_engine.render(body)
  end

  def markdown_engine
    engine_output = Redcarpet::Render::HTML
    engine_options = { autolink: true }
    Redcarpet::Markdown.new engine_output, engine_options
  end

end
