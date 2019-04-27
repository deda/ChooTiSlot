# Full list of Russian Federation time zones with helper to get this list.
# Place this file in config/initializers/timezones.ru.rb

class ActiveSupport::TimeZone
  @country_zones  = ThreadSafe::Cache.new

  def self.country_zones(country_code)
    code = country_code.to_s.upcase
    @country_zones[code] ||=
      TZInfo::Country.get(code).zone_identifiers.select do |tz_id|
        MAPPING.key(tz_id)
      end.map do |tz_id|
        self[MAPPING.key(tz_id)]
      end
  end

  def self.ru_zones
    @ru_zones ||= country_zones('RU')
  end
end

ActiveSupport::TimeZone::MAPPING['Kaliningrad']   = 'Europe/Kaliningrad'
ActiveSupport::TimeZone::MAPPING['Simferopol']    = 'Europe/Simferopol'
ActiveSupport::TimeZone::MAPPING['Volgograd']     = 'Europe/Volgograd'
ActiveSupport::TimeZone::MAPPING['Samara']        = 'Europe/Samara'
ActiveSupport::TimeZone::MAPPING['Astrakhan']     = 'Europe/Astrakhan'
ActiveSupport::TimeZone::MAPPING['Ulyanovsk']     = 'Europe/Ulyanovsk'
ActiveSupport::TimeZone::MAPPING['Omsk']          = 'Asia/Omsk'
ActiveSupport::TimeZone::MAPPING['Barnaul']       = 'Asia/Barnaul'
ActiveSupport::TimeZone::MAPPING['Novokuznetsk']  = 'Asia/Novokuznetsk'
ActiveSupport::TimeZone::MAPPING['Chita']         = 'Asia/Chita'
ActiveSupport::TimeZone::MAPPING['Khandyga']      = 'Asia/Khandyga'
ActiveSupport::TimeZone::MAPPING['Sakhalin']      = 'Asia/Sakhalin'
ActiveSupport::TimeZone::MAPPING['Ust-Nera']      = 'Asia/Ust-Nera'
ActiveSupport::TimeZone::MAPPING['Srednekolymsk'] = 'Asia/Srednekolymsk'
ActiveSupport::TimeZone::MAPPING['Anadyr']        = 'Asia/Anadyr'
