//
function RunSomeCode(json)
{
    console.log(json);
    google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable(json);
        // var data = google.visualization.arrayToDataTable([
        //   ['Task', 'Hours per Day'],
        //   ['Work',     11],
        //   ['Eat',      2],
        //   ['Commute',  2],
        //   ['Watch TV', 2],
        //   ['Sleep',    7]
        // ]);

        var options = {
          title: 'Customer Sales'
        };

        var chart = new google.visualization.PieChart(document.getElementById('controlAddIn'));

        chart.draw(data, options);
      }
}