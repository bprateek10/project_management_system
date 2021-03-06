drawChart = undefined
setTimeout ->
  google.load 'visualization', '1',
    packages: [ 'corechart' ]
    callback: drawChart
  return

drawChart = ->
  chart = undefined
  data = undefined
  options = undefined
  data = new (google.visualization.DataTable)
  data.addColumn 'string', 'Status'
  data.addColumn 'number', 'Number of Todo\'s'
  data.addRows [
    [
      'New'
      gon.new_todos
    ]
    [
      'In-Progress'
      gon.in_progress_todos
    ]
    [
      'Completed'
      gon.done_todos
    ]
  ]
  options =
    'title': 'Status report for ' + gon.project
    'width': 600
    'height': 600
  chart = new (google.visualization.PieChart)(document.getElementById('chart_div'))
  chart.draw data, options
  return

# ---
# generated by js2coffee 2.2.0