class EntryDecorator < Draper::Base
  decorates :entry

  def title
    entry.title
  end

  def tags
    entry.tags.map(&:name).join(", ")
  end

  def markdown
    Rails.cache.read("entry[#{entry.id}][body]")
  end

  def creator
    if account.present?
      account.name
    else
      "Anonymous"
    end
  end
end
