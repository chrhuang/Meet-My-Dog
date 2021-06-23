import places from 'places.js'

const initAutocomplete = () => {
  const addressInput = document.getElementById('banner-search')
  const addressInputNavbar = document.getElementById('navbar-search')
  if (addressInput) {
    places({ container: addressInput })
  }
  if (addressInputNavbar) {
    places({ container: addressInputNavbar })
  }
}

export { initAutocomplete }
