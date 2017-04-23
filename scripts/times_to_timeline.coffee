module.exports = (robot) ->
  robot.hear /.+/, (msg) ->
    room_id = msg.envelope.room
    room = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById(room_id)
    robot.logger.info "room name is: #{ room.name }"

    if room.name.match('^times_.+')
      id = msg.message.id
      post_link = "https://#{ process.env.HUBOT_SLACK_TEAM }.slack.com/archives/#{ room_id }/p#{ id }"

      robot.logger.info "room message id is: #{ id }"
      robot.send { room: '#timeline' }, { text: post_link, unfurl_links: true }
