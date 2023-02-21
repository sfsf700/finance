window.addEventListener('load', function() {

  const spendingButton = document.getElementById('spendingButton')
  const incomeButton = document.getElementById('incomeButton')
  const colum = document.getElementById('record_colum')

  if (spendingButton == null) return


  spendingButton.addEventListener('click', function() {
    this.setAttribute("style", "background-color: white;")
    incomeButton.setAttribute("style", "background-color: darkgray;")
    colum.setAttribute("name", "record[status]")
    colum.setAttribute("value", "1")
  });


  incomeButton.addEventListener('click', function() {
    this.setAttribute("style", "background-color: white;")
    spendingButton.setAttribute("style", "background-color: darkgray;")
    colum.setAttribute("name", "record[status]")
    colum.setAttribute("value", "2")
  });

});