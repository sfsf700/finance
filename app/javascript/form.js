window.addEventListener('load', function() {

  const spendingButton = document.getElementById('spendingButton')
  const incomeButton = document.getElementById('incomeButton')
  const colum = document.getElementById('record_colum')


  spendingButton.addEventListener('click', function() {

    this.setAttribute("style", "color: green;")
    incomeButton.setAttribute("style", "color: white;")
    colum.setAttribute("name", "record[status]")
    colum.setAttribute("value", "1")
  });


  incomeButton.addEventListener('click', function() {

    this.setAttribute("style", "color: green;")
    spendingButton.setAttribute("style", "color: white;")
    colum.setAttribute("name", "record[status]")
    colum.setAttribute("value", "2")
  });

});