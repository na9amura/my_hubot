module.exports = (robot => {
  robot.respond(
    /.+/,
    async (msg) => {
      const dataStore = robot.adapter.client.rtm.dataStore
      const room = await dataStore.getChannelById(msg.envelope.room)
      robot.logger.info "room name is: #{ room.name }"

      // if (!room || room.name != 'test' ) { return }
      if (! msg.message.text.match('takahiro nakamura')) { return }

      robot.logger.info "room name is: #{ room.name }"

      robot.send(
        { room: 'test' },
        msg.message.text
      )
    }
  )
})
