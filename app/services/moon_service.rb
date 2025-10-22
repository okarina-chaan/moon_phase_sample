require "date"

class MoonService
  def self.age(date = DateTime.now)
    known_new_moon = DateTime.new(2000, 1, 6, 18, 14, 0)
    synodic_month = 29.53058867
    days_since = (date - known_new_moon).to_f
    phase = (days_since / synodic_month) % 1
    correction = 0.1734 * Math.sin(2 * Math::PI * phase) - 0.4068 * Math.sin(2 * Math::PI * (phase + 0.5))
    moon_age = (phase * synodic_month + correction) % synodic_month
    moon_age.round(2)
  end

  def self.phase_name(moon_age)
    case moon_age
    when 0..1 then "新月"
    when 1...7 then "三日月"
    when 7...9 then "上弦の月"
    when 9...14 then "十三夜"
    when 14...16 then "満月"
    when 16...22 then "十六夜〜二十日月"
    when 22...24 then "下弦の月"
    when 24...29.5 then "有明月"
    else "新月"
    end
  end
end

