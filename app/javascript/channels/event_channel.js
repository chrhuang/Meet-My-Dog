import consumer from './consumer'

const initEventCable = () => {
  const messagesContainer = document.getElementsByClassName('messages-body')
  for (let i = 0; i < messagesContainer.length; i++) {
    const id = messagesContainer[i].dataset.eventId
    consumer.subscriptions.create({ channel: 'EventChannel', id: id }, {
      received (data) {
        // document.querySelector('#chat-notif').classList.remove('d-none')
        // document.querySelector('#chat-notif').classList.add('d-block') //A voir les notifications avec le chat
        messagesContainer[i].insertAdjacentHTML('afterbegin', data)
      }
    })
  }
}

export { initEventCable }
