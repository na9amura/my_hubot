module.exports = (robot) ->
  robot.hear /.+/, (msg) ->
    room = msg.envelope.room
    id = msg.message.id.replace('.', '')
    post_link = "https://#{ ENV['HUBOT_SLACK_TEAM'] }.slack.com/archives/#{ room }/p#{ id }"

    robot.send { room: '#test' }, post_link
