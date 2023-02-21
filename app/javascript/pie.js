window.addEventListener('load', function() {
  const incomeBtn = document.getElementById('income-btn')
  if (incomeBtn == null) return
  const spendingBtn = document.getElementById('spending-btn')
  const pieSpending = document.getElementById('pie_spending')
  const pieIncome = document.getElementById('pie_income')
  const pieIncomeTotal = document.getElementById('pie_income_total')
  const pieSpendingTotal = document.getElementById('pie_spending_total')
  const pieIncomeEach = document.getElementById('pie_income_each')
  const pieSpendingEach = document.getElementById('pie_spending_each')

  

  incomeBtn.addEventListener('click', function() {
    this.setAttribute("style", "background-color: white;")
    spendingBtn.setAttribute("style", "background-color: darkgray;")
    pieIncome.setAttribute("style", "display: inline;")
    pieSpending.setAttribute("style", "display: none;")
    pieIncomeTotal.setAttribute("style", "display: inline;")
    pieSpendingTotal.setAttribute("style", "display: none;")
    pieIncomeEach.setAttribute("style", "display: inline;")
    pieSpendingEach.setAttribute("style", "display: none;")
  })

  spendingBtn.addEventListener('click', function() {
    this.setAttribute("style", "background-color: white;")
    incomeBtn.setAttribute("style", "background-color: darkgray;")
    pieIncome.setAttribute("style", "display: none;")
    pieSpending.setAttribute("style", "display: inline;")
    pieIncomeTotal.setAttribute("style", "display: none;")
    pieSpendingTotal.setAttribute("style", "display: inline;")
    pieIncomeEach.setAttribute("style", "display: none;")
    pieSpendingEach.setAttribute("style", "display: inline;")
  })

})