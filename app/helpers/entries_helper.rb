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
    "https://photos-1.dropbox.com/si/xl/m14JxzborS_UQvYxdXk2hv5J1f5m5aluGgKI1MpRqwM,j4P8zaA94G74Zys9o9i31CI27P_aEioVixXjBcgzbQA/81569733/1342922400/57b3e3c/DSC_4046.JPG"
  end

  def main_timeline_caption
    ""
  end

  def main_timeline_credit
    ""
  end
end
