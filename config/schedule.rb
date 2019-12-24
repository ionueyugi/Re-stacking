# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV['PATH'] # 絶対パスから相対パス指定
set :output, 'log/cron.log' # ログの出力先ファイルを設定
set :environment, :development # 環境を設定

require 'active_support/core_ext/time'

# 時刻の文字列を日本時間で解釈して、システムのタイムゾーンに変換
def jst(time)
  Time.zone = 'Asia/Tokyo'
  Time.zone.parse(time).localtime($system_utc_offset)
end

every 1.day, at: jst('15:00 am') do #1日おきに実行 15時はUTCの0時
  runner "Post.post_destroy" #Postモデルのpost_destroyアクションを実行
end

every '0 0 01 * *' do #毎月の1日0時に実行
  runner "Event.event_destroy" #Eventモデルのevent_destroyアクションを実行
end

every 1.day, at: jst('15:00 am')do #毎月の1日0時に実行
	runner "Notification.notification"#Notificationモデルのnotificationアクションを実行
end
