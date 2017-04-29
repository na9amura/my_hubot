module.exports = (robot => {
  robot.hear(
    /posted a status.+/,
    async (msg) => {
      const dataStore = robot.adapter.client.rtm.dataStore
      const room = await dataStore.getChannelById(msg.envelope.room)

      if (!room || room.name != 'geekbot_broadcast' ) { return }

      robot.send(
        { room: '#util_nakamura' },
        msg.message.text
      )
    }
  )
})
