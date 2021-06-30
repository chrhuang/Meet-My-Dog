const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('#home')
  const elems = document.querySelectorAll('.navbar-text-black')
  console.log(elems)
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
