# ruby-on-rails-notifications-to-a-slack
a ruby script that pushes notifications to a slack channel when a whm hosted website gets a comment

This script assumes that WHM comments are stored in text files named comment.txt within a specified directory. When a new comment is added, the script sends a notification to the specified Slack channel.

Make sure to install the required gems before running the script:

gem install httparty inotify
