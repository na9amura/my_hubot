module.exports = (robot) ->
  robot.hear /.+/, (msg) ->
    room = msg.envelope.room
    robot.logger.info "room name is: #{ room }"

    if room.match('^times_.+')
      id = msg.message.id
      post_link = "https://#{ process.env.HUBOT_SLACK_TEAM }.slack.com/archives/#{ room }/p#{ id }"

      robot.logger.info "room message id is: #{ id }"
      robot.send { room: '#timeline' }, { text: post_link, unfurl_links: true }
