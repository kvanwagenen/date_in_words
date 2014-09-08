require 'spec_helper'
require 'date_in_words'

describe DateInWords, "#date_away_in_words" do
  let(:helpers) {Object.new.extend(DateInWords)}

  it "returns \"today\" for the same date" do
    expect(helpers.date_away_in_words(Time.now + 5.minutes)).to eq("today")
  end

  it "returns \"tomorrow\" for the next date" do
    expect(helpers.date_away_in_words(Time.now + 1.day)).to eq("tomorrow")
  end

  it "returns the day name for days after tomorrow less than a week away" do
    for i in 2..6 do
      expect(helpers.date_away_in_words(Time.now + i.days)).to eq((Time.now + i.days).strftime("%A"))
    end
  end

  it "returns the day name and next for days between one and two weeks away" do
    for i in 7..13 do
      expect(helpers.date_away_in_words(Time.now + i.days)).to eq("next #{(Time.now + i.days).strftime("%A").downcase}")
    end
  end  
end