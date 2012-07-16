class EntryDecorator < Draper::Base
  decorates :entry

  def creator
    if account.present?
      account.name
    else
      "Anonymous"
    end
  end
end
