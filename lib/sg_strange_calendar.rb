# frozen_string_literal: true

require 'date'
class SgStrangeCalendar
  MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec].freeze
  COLUMN_LENGTH = 37
  DAYS = %w[Su Mo Tu We Th Fr Sa].cycle.take(COLUMN_LENGTH)

  def initialize(year, today = nil)
    # 引数をインスタンス変数に格納
    @year = year
    @today_year, @today_month, @today_day = today.year, today.month, today.day if today

    # カレンダーの日付と各月の最初の曜日を格納
    @calendar = []
    @first_day_of_month = []
    (1..12).each do |month|
      days_of_month = Date.new(@year, month, -1).day
      @calendar << (1..days_of_month).to_a
      @first_day_of_month << Date.new(@year, month, 1).wday
    end
  end

  def generate(vertical: false)
    # 表示方法をインスタンス変数に格納
    @vertical = vertical
    # 強調する日付がある場合、その日付に@をつけておく
    mark_at_on_today if @today_year && @today_year == @year
    # 各月に空文字を追加して、各月の日付を整形
    square_calendar = create_square_calendar
    # 月のヘッダーを作成。横で表示なら年の桁数に合わせて左揃え
    month_header = create_month_header

    # 曜日のヘッダーを作成。縦で表示なら年の桁数に合わせて左揃え
    day_header = create_day_header

    # 曜日ヘッダーを先頭に挿入し、transposeして月ヘッダーを先頭に挿入。
    calendar_with_header = square_calendar.unshift(day_header).transpose.unshift(month_header)
    # 横表示なら再度transpose
    calendar_with_header = calendar_with_header.transpose unless @vertical
    # 2次元配列を文字列に変換
    create_calendar_string(calendar_with_header)
  end

  def mark_at_on_today
    @calendar[@today_month - 1][@today_day - 1] = "@#{@calendar[@today_month - 1][@today_day - 1]}"
  end

  def create_square_calendar
    # 表示方法によって日にちの桁数を変更
    day_length = @vertical ? 3 : 2
    @calendar.map.with_index do |month, index|
      # 各月の先頭に空文字を追加
      shifted_month = [''] * @first_day_of_month[index] + month
      # transpose用すべての月の長さを揃えるために空文字を追加
      shifted_month.fill('', shifted_month.length...COLUMN_LENGTH).map do |day|
        # 日にちの桁数を調整
        day.to_s.rjust(day_length)
      end
    end
  end

  def create_month_header
    [@year.to_s] + MONTHS.map do |month|
      if @vertical
        month
      else
        month.ljust(@year.to_s.length)
      end
    end
  end

  def create_day_header
    DAYS.map do |day|
      if @vertical
        day.ljust(@year.to_s.length)
      else
        day
      end
    end
  end

  def create_calendar_string(calendar_with_header)
    # 各月の日付をスペースで区切り、各月を改行で連結
    calendar_string = calendar_with_header.map do |sub_array|
      sub_array.join(' ').rstrip # 末尾のスペースを削除
    end.join("\n")
    if @today_year && @today_year == @year
      # 強調する日付の@を[]に変換
      calendar_string = calendar_string.gsub(" @#{@today_day} ", @vertical || @today_day < 10 ? " [#{@today_day}]" : "[#{@today_day}]") # 縦表示か1桁の場合は空白を追加
                                       .gsub(" @#{@today_day}", @vertical || @today_day < 10 ? " [#{@today_day}]" : "[#{@today_day}]") # 各月の最後は文字の後ろにスペースがないので別途処理
    end
    calendar_string
  end
end
