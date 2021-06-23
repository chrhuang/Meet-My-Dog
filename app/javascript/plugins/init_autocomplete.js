import places from 'places.js'

const initAutocomplete = () => {
  const addressInput = document.getElementById('banner-search')
  if (addressInput) {
    places({ container: addressInput })
  }
}

export { initAutocomplete }
