# Configure the Slack notifier. Setting the Webhook to nil disables it

slack_options = OpenStruct.new
slack_options.webhook = nil
slack_options.channel = "#notification"
slack_options.username = "HackidiSaaS"
slack_options.icon = ":ghost:"

if slack_options.webhook
  $slack_notifier = Slack::Notifier.new slack_options.webhook,
              channel: slack_options.channel,
              username: slack_options.username,
              icon_emoji: slack_options.icon
end

def slack_notify(msg, options = {})
  if $slack_notifier
    $slack_notifier.ping msg, options
  end
end
