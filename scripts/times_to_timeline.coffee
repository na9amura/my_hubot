module.exports = (robot) ->
  robot.hear /.+/, (msg) ->
    room = msg.envelope.room

    unless room == 'test'
      id = msg.message.id.replace('.', '')
      post_link = "https://#{ process.env.HUBOT_SLACK_TEAM }.slack.com/archives/#{ room }/p#{ id }"
      robot.send { room: '#test' }, post_link
