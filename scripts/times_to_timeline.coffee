module.exports = (robot) ->
  robot.hear /.+/, (msg) ->
    room_id = msg.envelope.room
    room = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById(room_id)

    if room.name.match('^times_.+')
      id = msg.message.id.replace('.','')
      post_link = "https://#{ process.env.HUBOT_SLACK_TEAM }.slack.com/archives/#{ room_id }/p#{ id }"

      robot.send { room: '#timeline' }, { text: post_link, unfurl_links: true }
