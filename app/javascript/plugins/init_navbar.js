const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('#home-navbar')
  const elems = document.querySelectorAll('.navbar-text-black')
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 1) {
        navbar.classList.add('navbar-white')
        if (elems) {
          elems.forEach((elem) => {
            elem.classList.add('navbar-text-green')
            elem.classList.remove('navbar-text-black')
          })
        }
      } else {
        navbar.classList.remove('navbar-white')
        if (elems) {
          elems.forEach((elem) => {
            elem.classList.remove('navbar-text-green')
            elem.classList.add('navbar-text-black')
          })
        }
      }
    })
  }
}

export { initUpdateNavbarOnScroll }
