task :convert_city_funding => :environment do
  desc "Convert Total Funding By City to Currency"

  def convert_to_currency(input)
    raw = input.to_s.split("")
    process = []
    while raw.length > 0
      if raw.length > 2
        process << raw[-3..-1]
        raw.pop(3)
      elsif raw.length > 1
        process << raw[-2..-1]
        raw.pop(2)
      else process << raw[-1]
        raw.pop(1)
      end
      if raw.length > 0
        process.push(",")
      end
    end
    result = process.reverse.join
    return result
  end

  cities = City.all
  cities.each do |city|
    city.update_attributes(funding_currency: convert_to_currency(city.total_funding))
  end
end