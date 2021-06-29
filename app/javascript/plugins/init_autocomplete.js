import places from 'places.js'

const initAutocomplete = () => {
  const addressInput = document.getElementById('banner-search')
  const addressInputNavbar = document.getElementById('navbar-search')
  if (addressInput) {
    const first_input = places({ container: addressInput,templates: {
      value: function(suggestion) {
        return suggestion.name;
      }
    } })
    first_input.configure({
      type: 'city',
      aroundLatLngViaIP: false,
    })
  }
  if (addressInputNavbar) {
    places({ container: addressInputNavbar,templates: {
      value: function(suggestion) {
        return suggestion.name;
      }
    } }).configure({
      type: 'city',
      aroundLatLngViaIP: false,
    })
  }
}

export { initAutocomplete }
