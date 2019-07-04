var color = Chart.helpers.color;

var barChartData = {
	labels: classList,
	datasets: [{
        label: 'My Submission Rate',
        backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
        borderColor: window.chartColors.blue,
        borderWidth: 1,
        data: solvedRate
    }]
};

window.onload = function() 
{
	var ctx = document.getElementById('canvas').getContext('2d');
	window.myBar = new Chart(ctx, {
		type: 'bar',
		data: barChartData,
		options: 
		{
			responsive: true,
			legend:
			{
				position: 'top',
			},
			title: 
			{
				display: true,
				text: 'Submission Rate'
			},
			scales: {
				xAxes: [{
					barThickness: 70
				}],
                yAxes: [{
                    ticks: {
                        suggestedMin: 0,
                        suggestedMax: 100
                    }
                }]
            },
            layout: {
                padding: {
                    left: 950,
                    right: 100,
                    top: 200,
                    bottom: 200
                }
            }
		}
	});
};