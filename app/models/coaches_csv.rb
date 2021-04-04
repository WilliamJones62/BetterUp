class CoachesCsv < ApplicationRecord
  def self.import(file)
    CoachesCsv.delete_all
    CoachAppointment.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      CoachesCsv.create! row.to_hash
    end

    raw = CoachesCsv.all
    raw.each do |r|
      start_hour = r.available_at[0,2].to_i
      start_min = r.available_at[3,2].to_i
      start_ampm = r.available_at[5,2]
      end_hour = r.available_until[0,2].to_i
      end_min = r.available_until[3,2].to_i
      end_ampm = r.available_until[5,2]
      to_gmt = r.timezone[4,3].to_i
      if start_ampm == 'PM'
        start_hour += 12
      end
      if end_ampm == 'PM'
        end_hour += 12
      end
      start_hour -= to_gmt
      end_hour -= to_gmt

      half_hour = false
      loop_count = (end_hour - start_hour) * 2
      if start_min == 30
        loop_count -= 1
        half_hour = true
      end
      if end_min == 30
        loop_count += 1
      end

      loop_count.times do
        a = CoachAppointment.new
        a.name = r.name
        a.day_of_week = r.day_of_week
        a.gmt_min = start_min
        a.gmt_hour = start_hour
        a.save
        if !half_hour
          start_min = 30
          half_hour = true
        else
          start_min = 0
          start_hour += 1
          half_hour = false
        end
      end
    end
  end
end
