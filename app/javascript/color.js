window.addEventListener('DOMContentLoaded',function(){
  const nav = document.getElementById('nav-wrapper')
  const colorMode = document.getElementById('color-mode')
  const blackBg = document.getElementById('js-black-bg')
  if (nav == null) return

  colorMode.addEventListener('click', function () {
    nav.classList.toggle("open")
  });
  blackBg.addEventListener('click', function () {
    nav.classList.remove('open')
  });



})