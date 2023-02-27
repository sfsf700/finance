window.addEventListener('load', function() {

  const spendingButton = document.getElementById('spendingButton')
  const incomeButton = document.getElementById('incomeButton')
  //const colum = document.getElementById('record_colum')
  const statusForm = document.getElementById('status-form')
  if (spendingButton == null) return


  const value = statusForm.getAttribute('value')
  if (value == null ) {
    statusForm.setAttribute("value", "2");
  } 
  if (value == "1") {
    spendingButton.setAttribute("style", "background-color: white;")
    incomeButton.setAttribute("style", "background-color: darkgray;")
  }
  


  spendingButton.addEventListener('click', function() {
    this.setAttribute("style", "background-color: white;")
    incomeButton.setAttribute("style", "background-color: darkgray;")
    //colum.setAttribute("name", "record[status]")
    statusForm.setAttribute("value", "1")
  });


  incomeButton.addEventListener('click', function() {
    this.setAttribute("style", "background-color: white;")
    spendingButton.setAttribute("style", "background-color: darkgray;")
    //colum.setAttribute("name", "record[status]")
    statusForm.setAttribute("value", "2")
  });

});