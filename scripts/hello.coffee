module.exports = (robot) ->
  robot.respond /who are you/i, (msg) ->
    msg.send "I'm hubot!"

  robot.hear /HELLO/i, (msg) ->
    msg.send 'hello'

  robot.respond /who am i/i, (msg) ->
    msg.send "You are #{ msg.message.user.name }"
