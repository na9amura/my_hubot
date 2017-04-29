module.exports = (robot => {
  robot.hear(
    /.+/,
    async (msg) => {
      robot.logger.info('===================')

      const dataStore = robot.adapter.client.rtm.dataStore
      const room = await dataStore.getChannelById(msg.envelope.room)

      robot.logger.info(`room name is: ${ room.name }`)
      robot.logger.info(msg.message.text)

      // if (!room || room.name != 'test' ) { return }
      if (! msg.message.text.match('takahiro nakamura')) { return }

      robot.logger.info(`room name is: ${ room.name }`)

      robot.send(
        { room: 'test' },
        msg.message.text
      )
    }
  )
})
