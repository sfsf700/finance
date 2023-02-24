window.addEventListener('DOMContentLoaded',function(){
  const body = document.querySelector('body');
  const darkModeBtn = document.getElementById('ore-mode');

  var mode = sessionStorage.getItem('mode');
  if (mode == 'dark') {
    body.classList.add('dark');
  }
  
  darkModeBtn.addEventListener('click', () => {
    body.classList.toggle('dark');
    if (mode == 'normal') {
      sessionStorage.setItem('mode', 'dark');
      mode = 'dark';
    } else {
      sessionStorage.setItem('mode', 'normal');
      mode = 'normal';
    }
  });
});