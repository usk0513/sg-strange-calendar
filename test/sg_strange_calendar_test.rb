require 'minitest/autorun'
require 'date'
require_relative '../lib/sg_strange_calendar'

class SgStrangeCalendarTest < Minitest::Test
  def test_level_1_for_2024
    expected = <<~TXT.chomp
      2024 Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo
      Jan      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Feb               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
      Mar                  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Apr      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      May            1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Jun                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Jul      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Aug               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Sep   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Oct         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Nov                  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Dec   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    TXT
    calendar = SgStrangeCalendar.new(2024)
    assert_equal expected, calendar.generate
  end

  def test_level_1_for_2025
    expected = <<~TXT.chomp
      2025 Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo
      Jan            1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Feb                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
      Mar                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Apr         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      May               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Jun   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Jul         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Aug                  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Sep      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Oct            1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Nov                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Dec      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    TXT
    calendar = SgStrangeCalendar.new(2025)
    assert_equal expected, calendar.generate
  end

  def test_level_2_for_2024_01_01
    expected = <<~TXT.chomp
      2024 Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo
      Jan     [1] 2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Feb               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
      Mar                  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Apr      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      May            1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Jun                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Jul      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Aug               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Sep   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Oct         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Nov                  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Dec   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    TXT
    today = Date.new(2024, 1, 1)
    calendar = SgStrangeCalendar.new(2024, today)
    assert_equal expected, calendar.generate
  end

  def test_level_2_for_2024_12_09
    expected = <<~TXT.chomp
      2024 Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo
      Jan      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Feb               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
      Mar                  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Apr      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      May            1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Jun                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Jul      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Aug               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Sep   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Oct         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Nov                  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Dec   1  2  3  4  5  6  7  8 [9]10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    TXT
    today = Date.new(2024, 12, 9)
    calendar = SgStrangeCalendar.new(2024, today)
    assert_equal expected, calendar.generate
  end

  def test_level_2_for_2025_03_31
    expected = <<~TXT.chomp
      2025 Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo
      Jan            1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Feb                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
      Mar                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30[31]
      Apr         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      May               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Jun   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Jul         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Aug                  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Sep      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Oct            1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
      Nov                     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
      Dec      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    TXT
    today = Date.new(2025, 3, 31)
    calendar = SgStrangeCalendar.new(2025, today)
    assert_equal expected, calendar.generate
  end

  def test_level_2_all
    file_path = File.expand_path('level2.txt', File.dirname(__FILE__))
    calendars = File.read(file_path).lines.each_slice(13).map(&:join).map(&:chomp)
    from_date = Date.new(2025, 1, 1)
    to_date = Date.new(2025, 12, 31)
    dates = [*from_date..to_date]
    dates.zip(calendars) do |date, expected|
      actual = SgStrangeCalendar.new(2025, date).generate
      assert_equal expected, actual
    end
  end

  def test_level_3_for_2024
    expected = <<~TXT.chomp
      2024 Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
      Su                                     1           1
      Mo     1           1           1       2           2
      Tu     2           2           2       3   1       3
      We     3           3   1       3       4   2       4
      Th     4   1       4   2       4   1   5   3       5
      Fr     5   2   1   5   3       5   2   6   4   1   6
      Sa     6   3   2   6   4   1   6   3   7   5   2   7
      Su     7   4   3   7   5   2   7   4   8   6   3   8
      Mo     8   5   4   8   6   3   8   5   9   7   4   9
      Tu     9   6   5   9   7   4   9   6  10   8   5  10
      We    10   7   6  10   8   5  10   7  11   9   6  11
      Th    11   8   7  11   9   6  11   8  12  10   7  12
      Fr    12   9   8  12  10   7  12   9  13  11   8  13
      Sa    13  10   9  13  11   8  13  10  14  12   9  14
      Su    14  11  10  14  12   9  14  11  15  13  10  15
      Mo    15  12  11  15  13  10  15  12  16  14  11  16
      Tu    16  13  12  16  14  11  16  13  17  15  12  17
      We    17  14  13  17  15  12  17  14  18  16  13  18
      Th    18  15  14  18  16  13  18  15  19  17  14  19
      Fr    19  16  15  19  17  14  19  16  20  18  15  20
      Sa    20  17  16  20  18  15  20  17  21  19  16  21
      Su    21  18  17  21  19  16  21  18  22  20  17  22
      Mo    22  19  18  22  20  17  22  19  23  21  18  23
      Tu    23  20  19  23  21  18  23  20  24  22  19  24
      We    24  21  20  24  22  19  24  21  25  23  20  25
      Th    25  22  21  25  23  20  25  22  26  24  21  26
      Fr    26  23  22  26  24  21  26  23  27  25  22  27
      Sa    27  24  23  27  25  22  27  24  28  26  23  28
      Su    28  25  24  28  26  23  28  25  29  27  24  29
      Mo    29  26  25  29  27  24  29  26  30  28  25  30
      Tu    30  27  26  30  28  25  30  27      29  26  31
      We    31  28  27      29  26  31  28      30  27
      Th        29  28      30  27      29      31  28
      Fr            29      31  28      30          29
      Sa            30          29      31          30
      Su            31          30
      Mo
    TXT
    calendar = SgStrangeCalendar.new(2024)
    assert_equal expected, calendar.generate(vertical: true)
  end

  def test_level_3_for_2024_01_01
    expected = <<~TXT.chomp
      2024 Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
      Su                                     1           1
      Mo    [1]          1           1       2           2
      Tu     2           2           2       3   1       3
      We     3           3   1       3       4   2       4
      Th     4   1       4   2       4   1   5   3       5
      Fr     5   2   1   5   3       5   2   6   4   1   6
      Sa     6   3   2   6   4   1   6   3   7   5   2   7
      Su     7   4   3   7   5   2   7   4   8   6   3   8
      Mo     8   5   4   8   6   3   8   5   9   7   4   9
      Tu     9   6   5   9   7   4   9   6  10   8   5  10
      We    10   7   6  10   8   5  10   7  11   9   6  11
      Th    11   8   7  11   9   6  11   8  12  10   7  12
      Fr    12   9   8  12  10   7  12   9  13  11   8  13
      Sa    13  10   9  13  11   8  13  10  14  12   9  14
      Su    14  11  10  14  12   9  14  11  15  13  10  15
      Mo    15  12  11  15  13  10  15  12  16  14  11  16
      Tu    16  13  12  16  14  11  16  13  17  15  12  17
      We    17  14  13  17  15  12  17  14  18  16  13  18
      Th    18  15  14  18  16  13  18  15  19  17  14  19
      Fr    19  16  15  19  17  14  19  16  20  18  15  20
      Sa    20  17  16  20  18  15  20  17  21  19  16  21
      Su    21  18  17  21  19  16  21  18  22  20  17  22
      Mo    22  19  18  22  20  17  22  19  23  21  18  23
      Tu    23  20  19  23  21  18  23  20  24  22  19  24
      We    24  21  20  24  22  19  24  21  25  23  20  25
      Th    25  22  21  25  23  20  25  22  26  24  21  26
      Fr    26  23  22  26  24  21  26  23  27  25  22  27
      Sa    27  24  23  27  25  22  27  24  28  26  23  28
      Su    28  25  24  28  26  23  28  25  29  27  24  29
      Mo    29  26  25  29  27  24  29  26  30  28  25  30
      Tu    30  27  26  30  28  25  30  27      29  26  31
      We    31  28  27      29  26  31  28      30  27
      Th        29  28      30  27      29      31  28
      Fr            29      31  28      30          29
      Sa            30          29      31          30
      Su            31          30
      Mo
    TXT
    today = Date.new(2024, 1, 1)
    calendar = SgStrangeCalendar.new(2024, today)
    assert_equal expected, calendar.generate(vertical: true)
  end

  def test_level_3_for_2024_12_09
    expected = <<~TXT.chomp
      2024 Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
      Su                                     1           1
      Mo     1           1           1       2           2
      Tu     2           2           2       3   1       3
      We     3           3   1       3       4   2       4
      Th     4   1       4   2       4   1   5   3       5
      Fr     5   2   1   5   3       5   2   6   4   1   6
      Sa     6   3   2   6   4   1   6   3   7   5   2   7
      Su     7   4   3   7   5   2   7   4   8   6   3   8
      Mo     8   5   4   8   6   3   8   5   9   7   4  [9]
      Tu     9   6   5   9   7   4   9   6  10   8   5  10
      We    10   7   6  10   8   5  10   7  11   9   6  11
      Th    11   8   7  11   9   6  11   8  12  10   7  12
      Fr    12   9   8  12  10   7  12   9  13  11   8  13
      Sa    13  10   9  13  11   8  13  10  14  12   9  14
      Su    14  11  10  14  12   9  14  11  15  13  10  15
      Mo    15  12  11  15  13  10  15  12  16  14  11  16
      Tu    16  13  12  16  14  11  16  13  17  15  12  17
      We    17  14  13  17  15  12  17  14  18  16  13  18
      Th    18  15  14  18  16  13  18  15  19  17  14  19
      Fr    19  16  15  19  17  14  19  16  20  18  15  20
      Sa    20  17  16  20  18  15  20  17  21  19  16  21
      Su    21  18  17  21  19  16  21  18  22  20  17  22
      Mo    22  19  18  22  20  17  22  19  23  21  18  23
      Tu    23  20  19  23  21  18  23  20  24  22  19  24
      We    24  21  20  24  22  19  24  21  25  23  20  25
      Th    25  22  21  25  23  20  25  22  26  24  21  26
      Fr    26  23  22  26  24  21  26  23  27  25  22  27
      Sa    27  24  23  27  25  22  27  24  28  26  23  28
      Su    28  25  24  28  26  23  28  25  29  27  24  29
      Mo    29  26  25  29  27  24  29  26  30  28  25  30
      Tu    30  27  26  30  28  25  30  27      29  26  31
      We    31  28  27      29  26  31  28      30  27
      Th        29  28      30  27      29      31  28
      Fr            29      31  28      30          29
      Sa            30          29      31          30
      Su            31          30
      Mo
    TXT
    today = Date.new(2024, 12, 9)
    calendar = SgStrangeCalendar.new(2024, today)
    assert_equal expected, calendar.generate(vertical: true)
  end

  def test_level_3_for_2025_03_31
    expected = <<~TXT.chomp
      2025 Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
      Su                         1
      Mo                         2           1           1
      Tu                 1       3   1       2           2
      We     1           2       4   2       3   1       3
      Th     2           3   1   5   3       4   2       4
      Fr     3           4   2   6   4   1   5   3       5
      Sa     4   1   1   5   3   7   5   2   6   4   1   6
      Su     5   2   2   6   4   8   6   3   7   5   2   7
      Mo     6   3   3   7   5   9   7   4   8   6   3   8
      Tu     7   4   4   8   6  10   8   5   9   7   4   9
      We     8   5   5   9   7  11   9   6  10   8   5  10
      Th     9   6   6  10   8  12  10   7  11   9   6  11
      Fr    10   7   7  11   9  13  11   8  12  10   7  12
      Sa    11   8   8  12  10  14  12   9  13  11   8  13
      Su    12   9   9  13  11  15  13  10  14  12   9  14
      Mo    13  10  10  14  12  16  14  11  15  13  10  15
      Tu    14  11  11  15  13  17  15  12  16  14  11  16
      We    15  12  12  16  14  18  16  13  17  15  12  17
      Th    16  13  13  17  15  19  17  14  18  16  13  18
      Fr    17  14  14  18  16  20  18  15  19  17  14  19
      Sa    18  15  15  19  17  21  19  16  20  18  15  20
      Su    19  16  16  20  18  22  20  17  21  19  16  21
      Mo    20  17  17  21  19  23  21  18  22  20  17  22
      Tu    21  18  18  22  20  24  22  19  23  21  18  23
      We    22  19  19  23  21  25  23  20  24  22  19  24
      Th    23  20  20  24  22  26  24  21  25  23  20  25
      Fr    24  21  21  25  23  27  25  22  26  24  21  26
      Sa    25  22  22  26  24  28  26  23  27  25  22  27
      Su    26  23  23  27  25  29  27  24  28  26  23  28
      Mo    27  24  24  28  26  30  28  25  29  27  24  29
      Tu    28  25  25  29  27      29  26  30  28  25  30
      We    29  26  26  30  28      30  27      29  26  31
      Th    30  27  27      29      31  28      30  27
      Fr    31  28  28      30          29      31  28
      Sa            29      31          30          29
      Su            30                  31          30
      Mo           [31]
    TXT
    today = Date.new(2025, 3, 31)
    calendar = SgStrangeCalendar.new(2025, today)
    assert_equal expected, calendar.generate(vertical: true)
  end

  def test_level_3_all
    file_path = File.expand_path('level3.txt', File.dirname(__FILE__))
    calendars = File.read(file_path).lines.each_slice(38).map(&:join).map(&:chomp)
    from_date = Date.new(2025, 1, 1)
    to_date = Date.new(2025, 12, 31)
    dates = [*from_date..to_date]
    dates.zip(calendars) do |date, expected|
      actual = SgStrangeCalendar.new(2025, date).generate(vertical: true)
      assert_equal expected, actual
    end
  end
end
