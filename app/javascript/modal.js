const modal = () => {
  const bid = document.getElementById('bid');
  const modal = document.getElementById('modal');
  const mask = document.getElementById('mask');
  const close = document.getElementById('price-submit-btn');
  const map = document.getElementById('gmap');
  
  bid.addEventListener("click", ()=> {
    modal.classList.remove('hidden');
    mask.classList.remove('hidden');
    map.classList.add('hidden');
  });
  
  close.addEventListener("click", () => {
    modal.classList.add('hidden');
    mask.classList.add('hidden');
  });
  mask.addEventListener("click", ()=> {
    modal.classList.add('hidden');
    mask.classList.add('hidden');
  })
};
window.addEventListener('load', modal);