const initNewEvent = () => {
  const elements = document.querySelectorAll('.create-event')
  const inputId = document.querySelector('#event_walk_id')
  console.log(inputId)
  elements.forEach((elem) => {
    elem.addEventListener('click', () => {
      inputId.value = elem.dataset.walkId
      console.log(elem.dataset.walkId)
      console.log('value', inputId.value)
    })
  })
}

export { initNewEvent }
