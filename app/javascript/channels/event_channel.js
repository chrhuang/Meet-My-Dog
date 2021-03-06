import consumer from './consumer'

const initEventCable = () => {
  const messagesContainer = document.getElementsByClassName('messages-body')
  for (let i = 0; i < messagesContainer.length; i++) {
    const id = messagesContainer[i].dataset.eventId
    consumer.subscriptions.create({ channel: 'EventChannel', id: id }, {
      received (data) {
        const found = data.match(/data-event-id="(\d+)"/)
        if (found[1] === id) { messagesContainer[i].insertAdjacentHTML('afterbegin', data) }
        // document.querySelector('#chat-notif').classList.remove('d-none')
        // document.querySelector('#chat-notif').classList.add('d-block') //A voir les notifications avec le chat
      }
    })
  }
}

export { initEventCable }
