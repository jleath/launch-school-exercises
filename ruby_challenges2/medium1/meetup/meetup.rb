class Meetup
  WEEKDAYS = {sunday: 0, monday: 1, tuesday: 2, wednesday: 3,
              thursday: 4, friday: 5, saturday: 6}

  SCHEDULE_FNS = {
    first:  Proc.new { |days| days[0] },
    second: Proc.new { |days| days[1] },
    third:  Proc.new { |days| days[2] },
    fourth: Proc.new { |days| days[3] },
    last:   Proc.new { |days| days.last },
    teenth: Proc.new { |days| days.detect { |date| (13..19).cover?(date.day) }}
  } 

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    SCHEDULE_FNS[schedule].call(get_weekdays(weekday))
  end

  def get_weekdays(weekday)
    first_day = Date.new(@year, @month, 1)
    first_weekday = first_day + (WEEKDAYS[weekday] - first_day.wday) % 7
    month_end = first_day.next_month - 1
    first_weekday.step(month_end, 7).to_a
  end
end