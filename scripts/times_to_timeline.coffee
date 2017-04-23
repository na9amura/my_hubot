module.exports = (robot) ->
  robot.hear /.+/, (msg) ->
    room_name = ''

    if msg.channel
      room_name = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById msg.channel
      robot.logger.info "room name is: #{ room_name }"

    if room_name.match('^times_.+')
      room = msg.envelope.room
      id = msg.message.id
      post_link = "https://#{ process.env.HUBOT_SLACK_TEAM }.slack.com/archives/#{ room }/p#{ id }"

      robot.logger.info "room message id is: #{ id }"
      robot.send { room: '#timeline' }, { text: post_link, unfurl_links: true }
