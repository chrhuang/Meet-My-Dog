const initDogId = () => {
  const elements = document.querySelectorAll('.edit-dog')

  elements.forEach((element) => {
    const dog = element.dataset
    console.log(dog)
    element.addEventListener('click', () => {
      document.querySelector('#dog_id').value = dog.dogId
      document.querySelector('#dog_name').value = dog.dogName
      document.querySelector('#dog_age').value = dog.dogAge
      document.querySelector('#dog_size').value = dog.dogSize
      document.querySelector('#dog_gender').value = dog.dogGender
    })
  })
}

export { initDogId }
