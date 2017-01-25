# Configure the Slack notifier. Setting the Webhook to nil disables it
SLACK_WEBHOOK = nil
SLACK_CHANNEL = "#general"
SLACK_USERNAME = "HackidiSaaS"
SLACK_ICON = ":ghost:"

if SLACK_WEBHOOK
  $slack = Slack::Notifier.new SLACK_WEBHOOK, channel: SLACK_CHANNEL,
                                              username: SLACK_USERNAME,
                                              icon_emoji: SLACK_ICON
end

def slack_notify(msg, options = {})
  if $slack
    $slack.ping msg, options
  end
end
