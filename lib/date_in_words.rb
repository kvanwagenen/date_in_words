require 'date_in_words/version'
require 'active_support/core_ext/integer/inflections'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/string/conversions'

module DateInWords
  def date_away_in_words(time, start=nil)
    if start.nil?
      start = Time.now
    end
    days_away = ((time - start + 2.seconds) / 1.day).to_i
    if days_away == 0
      "today"
    elsif days_away == 1
      "tomorrow"
    elsif days_away > 1 && days_away < 7
      time.strftime("%A")
    elsif days_away >= 7 && days_away < 14
      time.strftime("next %A").downcase
    elsif days_away >= 14
      time.strftime("%A, %B #{time.day.ordinalize}").downcase
    end
  end
end
