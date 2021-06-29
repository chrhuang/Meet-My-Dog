import consumer from './consumer'

const initEventCable = () => {
  const messagesContainer = document.getElementsByClassName('messages-body')
  console.log(messagesContainer)
  for (let i = 0; i < messagesContainer.length; i++) {
    const id = messagesContainer[i].dataset.eventId
    consumer.subscriptions.create({ channel: 'EventChannel', id: id }, {
      received (data) {
        messagesContainer[i].insertAdjacentHTML('beforeend', data)
      }
    })
  }
}

export { initEventCable }
