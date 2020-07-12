# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# Rails.env メソットをコールするために、ファイルを読み込む。
require File.expand_path(File.dirname(__FILE__) + '/environment')
# Example:
#
env :PATH, ENV['PATH']
set :output, 'log/cron.log'
rails_env = Rails.env.to_sym
set :environment, rails_env
# set :environment, :development
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every 1.days, at: '11:00 am' do
  runner 'NotificationMailer.notify_user'
end

# every 1.minute do
#   runner "NotificationMailer.notify_user"
# end

# Learn more: http://github.com/javan/whenever
