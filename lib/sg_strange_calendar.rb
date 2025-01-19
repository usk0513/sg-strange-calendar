# frozen_string_literal: true

require 'date'
class SgStrangeCalendar
  MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec].freeze
  COLUMN_LENGTH = 37
  DAYS = %w[Su Mo Tu We Th Fr Sa].cycle.take(COLUMN_LENGTH)

  def initialize(year, today = nil)
    # 引数をインスタンス変数に格納
    @year = year
    if today
      @today_year = today.year
      @today_month = today.month
      @today_day = today.day
    end

    # カレンダーの日付と各月の最初の曜日を格納
    @calender = []
    @first_day_of_month = []
    (1..12).each do |month|
      days_of_month = Date.new(@year, month, -1).day
      @calender << (1..days_of_month).to_a
      @first_day_of_month << Date.new(@year, month, 1).wday
    end
  end

  def generate(vertical: false)
    if vertical
      day_length = 3
    else
      day_length = 2
    end
    # 強調する日付がある場合、その日付に@をつけておく
    if @today_year && @today_year == @year
      @calender[@today_month - 1][@today_day - 1] = "@#{@calender[@today_month - 1][@today_day - 1]}"
    end
    # 各月に空文字を追加して、各月の日付を整形
    formatted_calender = @calender.map.with_index do |month, index|
      # 各月の先頭に空文字を追加
      shifted_month = [''] * @first_day_of_month[index] + month
      # transpose用すべての月の長さを揃えるために空文字を追加
      shifted_month.fill('', shifted_month.length...COLUMN_LENGTH).map do |day|
        # 数字を2桁に整形
        day.to_s.rjust(day_length)
      end
    end
    # 月のヘッダーを作成。横で表示なら年の桁数に合わせて左揃え
    month_header = [@year.to_s] + MONTHS.map do |month|
      unless vertical
        month.ljust(@year.to_s.length)
      else
        month
      end
    end

    # 曜日のヘッダーを作成。縦で表示なら年の桁数に合わせて左揃え
    days_header = DAYS.map do |day|
      if vertical
        day.ljust(@year.to_s.length)
      else
        day
      end
    end

    # 曜日ヘッダーを先頭に挿入。transposeして月ヘッダーを先頭に挿入。再度transposeし、各日付を空白で結合してから１つの文字列に改行コードで結合する
    output = formatted_calender.unshift(days_header).transpose.unshift(month_header)
    unless vertical
      output = output.transpose
    end
    output = output.map do |sub_array|
      sub_array.join(' ').rstrip
    end.join("\n")
    if @today_year && @today_year == @year
      # 強調する日付の@を[]に変換
      output = output.gsub(" @#{@today_day} ", vertical || @today_day < 10 ? " [#{@today_day}]" : "[#{@today_day}]") # 縦表示か1桁の場合は空白を追加
                      .gsub(" @#{@today_day}", vertical || @today_day < 10 ? " [#{@today_day}]" : "[#{@today_day}]") # 各月の最後は文字の後ろにスペースがないので別途処理
    end
    output
  end
end
