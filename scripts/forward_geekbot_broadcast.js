module.exports = (robot => {
  robot.hear(
    /posted a status.+/,
    async (msg) => {
      robot.logger.info('---------------------------')
      const dataStore = robot.adapter.client.rtm.dataStore
      const room = await dataStore.getChannelById(msg.envelope.room)

      if (!room || room.name == 'test' ) { return }
      robot.logger.info('---------------------------')

      robot.send(
        { room: '#test' },
        msg.message.text
      )
    }
  )
})
