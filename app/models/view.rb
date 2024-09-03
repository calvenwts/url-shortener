class View < ApplicationRecord
  belongs_to :link, counter_cache: true

  def location
    Geocoder.search(ip).first
  end

  def city
    location.city if location
  end

  def country
    location.country if location
  end

end
