
# Rails.rootを使用するために必要。なぜなら、wheneverは読み込まれるときにrailsを起動する必要がある
# require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数をセット

env :PATH, ENV['PATH']
set :output, "log/cron.log"
set :environment, :development
# job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

# cronのログの吐き出し場所。ここでエラー内容を確認する

every :minute do
# every :day do
  runner "UserMailer.notification_email.deliver"
  runner "Book.new( user_id: 1+rand(4), title: ?N, body: ?G ).save"
end
