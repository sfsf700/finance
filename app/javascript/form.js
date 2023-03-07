window.addEventListener('load', function() {

  const spendingButton = document.getElementById('spendingButton')
  const incomeButton = document.getElementById('incomeButton')
  const statusForm = document.getElementById('status-form')
  //const genresSpending = document.getElementById('genres_spending')
  if (spendingButton == null) return


  const value = statusForm.getAttribute('value')
  if (value == null ) {
    statusForm.setAttribute("value", "1");
  } 

  if (value == "1") {
    spendingButton.setAttribute("style", "background-color: white;")
    incomeButton.setAttribute("style", "background-color: darkgray;")
    
  }

  if (value == "2") {
    spendingButton.setAttribute("style", "background-color: darkgray;")
    incomeButton.setAttribute("style", "background-color: white;")
    
  }

  spendingButton.addEventListener('click', function() {
    this.setAttribute("style", "background-color: white;")
    incomeButton.setAttribute("style", "background-color: darkgray;")
    statusForm.setAttribute("value", "1")
  });


  incomeButton.addEventListener('click', function() {
    this.setAttribute("style", "background-color: white;")
    spendingButton.setAttribute("style", "background-color: darkgray;")
    statusForm.setAttribute("value", "2")
   
  });

});