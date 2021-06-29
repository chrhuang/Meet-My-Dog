const initNewEvent = () => {
  const elements = document.querySelectorAll('.create-event')
  const inputId = document.querySelector('#event_walk_id')
  elements.forEach((elem) => {
    elem.addEventListener('click', () => {
      inputId.value = elem.dataset.walkId
    })
  })
}

export { initNewEvent }
