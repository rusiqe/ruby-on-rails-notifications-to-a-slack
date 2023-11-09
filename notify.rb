require 'httparty'
require 'inotify'

# Replace with your actual Slack webhook URL
SLACK_WEBHOOK_URL = 'YOUR_SLACK_WEBHOOK_URL'

def send_slack_notification(message)
  payload = {
    text: message,
    channel: '#your_channel', # replace with your Slack channel
    username: 'WHM Comment Notifier'
  }

  HTTParty.post(SLACK_WEBHOOK_URL, body: { payload: payload.to_json })
end

def monitor_comments(directory_path)
  notifier = INotify::Notifier.new

  notifier.watch(directory_path, :create) do |event|
    file_name = File.basename(event.name)
    if file_name == 'comment.txt'
      comment = File.read(event.absolute_name).strip
      send_slack_notification("New comment: #{comment}")
    end
  end

  puts "Monitoring #{directory_path} for comments..."
  notifier.run
end

# Replace with the path to the directory where WHM comments are stored
whm_comments_directory = '/path/to/whm/comments'

monitor_comments(whm_comments_directory)
