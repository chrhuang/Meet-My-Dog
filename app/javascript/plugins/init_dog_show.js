const initDogShow = () => {
  const elements = document.querySelectorAll('.dog-query')

  elements.forEach((element) => {
    const dog = element.dataset
    element.addEventListener('click', () => {
      document.querySelector('#dog_name').innerText = dog.dogName
      document.querySelector('#dog_age').innerText = dog.dogAge
      document.querySelector('#dog_size').innerText = dog.dogSize
      document.querySelector('#dog_gender').innerText = dog.dogGender
      // document.querySelector('#dog_temperaments').innerText = dog.dogTemperaments
      document.querySelector('#dog_photo').src = `http://res.cloudinary.com/dtn8c7o7m/image/upload/${dog.dogPhotoKey}`
    })
  })
}

export { initDogShow }
