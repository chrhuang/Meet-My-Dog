
const initSearchSites = () => {
  const button = document.querySelector('.btn-flat');

  button.addEventListener('click', (event) => {
    const input = document.querySelector('.form-control');
    const search = input.value;
    fetchSites;
  });
};

export { initSearchSites };
