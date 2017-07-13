class StaticPagesController < ApplicationController

  before_action :popular_cities, only: [:landing_page]

  def landing_page
  end

  def popular_cities
    # @popular_cities_count = 0

    @popular_cities = {
    'Charleston' => 'South Carolina',
    'Washington D.C.' => 'Some State',
    'New York' => 'New York',
    'Chicago' => 'Illinois',
    'Philadelphia' => 'Pennsylvania',
    'Houston' => 'Texas',
    'New Orleans' => 'Louisiana',
    'Los Angeles' => 'California',
    'Portland' => 'Oregon',
    'Minneapolis' => 'Minnesota',
    'Seattle' => 'Washington',
    'St. Louis' => 'Missouri',
    'San Diego' => 'California',
    'Trenton' => 'New Jersey',
    'Baltimore' => 'Maryland',
    'Louisville' => 'Kentucky',
    'Albuquerque' => 'New Mexico',
    'Boston' => 'Massachusetts',
    'Springfield' => 'Illinois',
    'Amarillo' => 'Texas',
    'Rochester' => 'New York'
    }
  end

end
