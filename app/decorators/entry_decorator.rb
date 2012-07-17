class EntryDecorator < Draper::Base
  decorates :entry

  def title
    entry.title
  end

  def body
    Rails.cache.read("entry[#{entry.id}][body]") || entry.body
  end

  def creator
    if account.present?
      account.name
    else
      "Anonymous"
    end
  end
end
