module EntriesHelper

  def first_date
    @entries.first.start_at
  end

  def entry_dates
    @entries.map do |entry|
      render partial: 'entry', format: :json, locals: { entry: entry }
    end.join(", ")
  end

  def main_timeline_headline
    "NOLAVATION"
  end

  def main_timeline_text
    "Nolavation Web App"
  end

  def main_timeline_media
    "http://www.nolavation.com"
  end

  def main_timeline_caption
    ""
  end

  def main_timeline_credit
    ""
  end
end
