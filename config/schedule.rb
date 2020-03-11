
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

# Rails.rootを使用するために必要。なぜなら、wheneverは読み込まれるときにrailsを起動する必要がある
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数をセット
set :environment, :development
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

# cronのログの吐き出し場所。ここでエラー内容を確認する
set :output, "#{Rails.root}/log/cron.log"

every :minute do
  runner "Book.new( user_id: 4, title: %q?success?, body: %q!unko! ).save"
end
