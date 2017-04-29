module.exports = (robot => {
  robot.respond(
    /.+/,
    async (msg) => {
      const dataStore = robot.adapter.client.rtm.dataStore
      const room = async  dataStore.getChannelById(msg.envelope.room)
      const user = async  dataStore.getUserById(msg.envelope.user)
      // if (!room || room.name != 'test' ) { return }
      if (! msg.message.text.match('takahiro nakamura')) { return }

      robot.send(
        { room: '#test' },
        msg.message.text
      )
    }
  )
})
