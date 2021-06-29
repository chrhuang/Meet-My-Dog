const listGroup = () => {
  const chatGroups = document.querySelectorAll('.chat-group')
  if (chatGroups) {
    chatGroups.forEach((chatGroup) => {
      chatGroup.addEventListener('click', (event) => {
        const active = document.getElementsByClassName('chat-group active')
        const display = document.getElementsByClassName('chat-show d-block')
        const show = document.getElementById(`show-${chatGroup.id}`)
        if (active) {
          active[0].classList.remove('active')
          display[0].classList.add('d-none')
          display[0].classList.remove('d-block')
        }
        chatGroup.classList.add('active')
        show.classList.add('d-block')
        show.classList.remove('d-none')
        document.getElementById('message_event').value = chatGroup.id
      })
    })
  }
}

const initChatbox = () => {
  listGroup()
  const send = document.getElementById('chat-send')
  const message = document.getElementById('message_content')
  send.addEventListener('click', (event) => {
    document.getElementById('chatForm').submit()
    event.preventDefault()
    message.value = ''
  })
}

export { initChatbox }
