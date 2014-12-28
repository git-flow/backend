module CopyrightHelper
  def copyright_year(start_year)
    if start_year.to_i == Time.now.year
      Time.now.year
    else
      start_year.to_s << ' - ' << Time.now.year.to_s
    end
  end
end
