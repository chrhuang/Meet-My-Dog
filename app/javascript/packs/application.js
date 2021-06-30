// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import 'bootstrap'

// CSS
import 'mapbox-gl/dist/mapbox-gl.css'
// internal imports
import { initMapbox } from '../plugins/init_mapbox'
import { initCreateMapbox } from '../plugins/init_create_mapbox'
import { initShowMapbox } from '../plugins/init_map_show'

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initAutocomplete } from '../plugins/init_autocomplete'
import { initNewEvent } from '../plugins/init_new_event'
import { initFlatpickr } from '../plugins/flatpickr'
import { initEventCable } from '../channels/event_channel'
import { initChatbox } from '../plugins/init_chatbox'
import { initStarRating } from '../plugins/init_star_rating'
import { initMapSelect } from '../plugins/init_map_select'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initNewEvent()
  initMapbox()
  initAutocomplete()
  initCreateMapbox()
  const map = initShowMapbox()
  initFlatpickr()
  initEventCable()
  initChatbox()
  initStarRating()
  initMapSelect(map)
})
