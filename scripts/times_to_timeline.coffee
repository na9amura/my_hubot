module.exports = (robot) ->
  robot.hear /.+/, (msg) ->
    room = msg.envelope.room

    if room.match('^times_.+')
      id = msg.message.id
      post_link = "https://#{ process.env.HUBOT_SLACK_TEAM }.slack.com/archives/#{ room }/p#{ id }"
      robot.send { room: '#test' }, { text: post_link, unfurl_links: true }
