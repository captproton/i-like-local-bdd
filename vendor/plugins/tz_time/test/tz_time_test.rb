require File.dirname(__FILE__) + "/test_helper"

class TzTimeTest < Test::Unit::TestCase
  def setup
    TzTime.zone = TimeZone["Central Time (US & Canada)"]
  end
  
  def test_iso8601_parsed_time_and_local_time_should_be_equal
    assert_equal TzTime.local(2008, 6, 10, 8), TzTime.iso8601("2008-06-10T08:00:00")
  end
  
  def test_iso8601_parsed_utc_time_and_local_equivalent_time_should_be_equal
    local = TzTime.local(2008, 6, 10, 14)
    local += TzTime.zone.dst_utc_offset(local)
    iso = TzTime.iso8601("2008-06-10T14:00:00Z")
    assert_equal local, iso
  end
  
  def test_underlying_time_from_at_should_be_utc
    time = TzTime.at(Time.local(2006, 1, 4, 2)).to_time
    assert time.utc?
    assert_equal Time.utc(2006, 1, 4, 2), time
  end
  
  def test_at_should_accept_tz_times_as_well_as_raw_times
    time = TzTime.local(1998, 11, 13, 15, 39)
    assert_equal time, TzTime.at(time)
  end
  
  def test_at_should_not_strip_usecs
    time = TzTime.local(1998, 11, 13, 15, 39, 27, 3500)
    assert_equal time, TzTime.at(time)
  end
end
