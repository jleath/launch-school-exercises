require 'date'

class Meetup
  WEEKDAYS = { sunday: 0,   monday: 1, tuesday: 2, wednesday: 3,
               thursday: 4, friday: 5, saturday: 6 }.freeze

  SCHEDULE_FNS = {
    first:  proc { |days| days[0] },
    second: proc { |days| days[1] },
    third:  proc { |days| days[2] },
    fourth: proc { |days| days[3] },
    last:   proc { |days| days.last },
    teenth: proc { |days| days.detect { |date| (13..19).cover?(date.day) } }
  }.freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    SCHEDULE_FNS[schedule].call(get_weekdays(weekday))
  end

  def get_weekdays(weekday)
    first_day = Date.new(@year, @month)
    first_weekday = first_day + (WEEKDAYS[weekday] - first_day.wday) % 7
    month_end = first_day.next_month - 1
    first_weekday.step(month_end, 7).to_a
  end
end
