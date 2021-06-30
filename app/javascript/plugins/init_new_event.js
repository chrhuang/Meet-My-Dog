const initNewEvent = () => {
  const elements = document.querySelectorAll('.create-event')
  const inputId = document.querySelector('#event_walk_id')
  elements.forEach((elem) => {
    elem.addEventListener('click', () => {
      if (inputId) {
        inputId.value = elem.dataset.walkId
      }
    })
  })
  const aloneElements = document.querySelectorAll('.create-alone-event')
  const alone = document.querySelector('.walk-alone')
  aloneElements.forEach((elem) => {
    elem.addEventListener('click', () => {
      if (alone) {
        alone.value = elem.dataset.walkId
      }
    })
  })
}

export { initNewEvent }
