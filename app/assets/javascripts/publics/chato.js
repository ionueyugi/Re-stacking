// 色の設定
var colorSet = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
};

// 乱数生成(0～100)
var rnd100 = function(){
	return Math.round(Math.random() * 100);
};

// 色のRGB変換
var color = Chart.helpers.color;

/*
 * チャートの初期設定
 */
var config = {
	type: 'radar',
	data: {
		labels: ["達成度", "時間を守れたか", "決めた質をこなせたか"],
		datasets: [{
			label: "目標値",
			backgroundColor: color(colorSet.red).alpha(0.5).rgbString(),
			borderColor: colorSet.red,
			pointBackgroundColor: colorSet.red,
			data: [gon.achievement_targetvalue, gon.quality_targetvalue, gon.time_targetvalue]
		},{
			label: "達成評価",
			backgroundColor: color(colorSet.blue).alpha(0.5).rgbString(),
			borderColor: colorSet.blue,
			pointBackgroundColor: colorSet.blue,
			data: [gon.achievement, gon.quality, gon.time]
		},]
	},
	options: {
		showTooltips: false,
		legend: { position: 'bottom' },
		title: {
			display: true,
			fontSize:30,
			fontColor:'#666',
			text: '評価'
		},
		scale: {
			display: true,
			pointLabels: {
				fontSize: 15,
				fontColor: colorSet.yellow
			},
			ticks: {
				display: true,
				fontSize: 15,
				fontColor: colorSet.green,
				min: 0,
				max: 5,
				beginAtZero: true
			},
			gridLines: {
				display: true,
				color: colorSet.yellow
			},
		}
	}
};

/*
 * チャートの作成
 */
var myRadar = new Chart($("#myChart"), config);

document.getElementById('btn').onclick = function() {
  // すでにグラフ（インスタンス）が生成されている場合は、グラフを破棄する
  if (myChart) {
    myChart.destroy();
  }

  getRandom(); // グラフデータにランダムな値を格納
  drawChart(); // グラフを再描画
}
/*
 * ランダムデータ（#randomizeData）
 */
$("#randomizeData").click(function(){
	config.data.datasets.forEach(function(dataset){
		dataset.data = dataset.data.map(function(){
			return rnd100();
		});
	});

	myRadar.update();
});

var colorNames = Object.keys(colorSet);

/*
 * データセットの追加（#addDataset）
 */
$("#addDataset").click(function(){
	var colorName = colorNames[config.data.datasets.length % colorNames.length];;
	var newColor = colorSet[colorName];

	var newDataset = {
		label: 'Dataset ' + config.data.datasets.length,
		borderColor: newColor,
		backgroundColor: color(newColor).alpha(0.2).rgbString(),
		pointBorderColor: newColor,
		data: [],
	};

	for (var index=0; index < config.data.labels.length; ++index) {
		newDataset.data.push(rnd5());
	}

	config.data.datasets.push(newDataset);
	myRadar.update();
});

/*
 * データの追加（#addData）
 */
$("#addData").click(function(){
	if (config.data.datasets.length > 0){
		config.data.labels.push('dataset #' + config.data.labels.length);

		config.data.datasets.forEach(function(dataset){
			dataset.data.push(rnd100());
		});

		myRadar.update();
	}
});

/*
 * データセットの削除（#removeDataset）
 */
$("#removeDataset").click(function(){
	config.data.datasets.splice(0, 1);
	myRadar.update();
});

/*
 * データの削除（#removeData）
 */
$("#removeData").click(function(){
	config.data.labels.pop(); // remove the label first

	config.data.datasets.forEach(function(dataset){
		dataset.data.pop();
	});

	myRadar.update();
});

var chartVal = []; // グラフデータ（描画するデータ）

// ページ読み込み時にグラフを描画
getRandom(); // グラフデータにランダムな値を格納
drawChart(); // グラフ描画処理を呼び出す


// ボタンをクリックしたら、グラフを再描画
document.getElementById('evaluation').onclick = function() {
  // すでにグラフ（インスタンス）が生成されている場合は、グラフを破棄する
  if (myChart) {
    myChart.destroy();
  }

  getRandom(); // グラフデータにランダムな値を格納
  drawChart(); // グラフを再描画
}


// グラフデータをランダムに生成
function getRandom() {
  chartVal = []; // 配列を初期化
  var length = 12;
  for (i = 0; i < length; i++) {
    chartVal.push(Math.floor(Math.random() * 20));
  }
}


// グラフ描画処理
function drawChart() {
  var ctx = document.getElementById('canvas').getContext('2d');
  window.myChart = new Chart(ctx, { // インスタンスをグローバル変数で生成
    type: 'bar',
    data: { // ラベルとデータセット
      labels: ['January','February','March','April','May','June','July','August','September','October','November','December'],
      datasets: [{
          data: chartVal, // グラフデータ
          backgroundColor: 'rgb(0, 134, 197, 0.7)', // 棒の塗りつぶし色
          borderColor: 'rgba(0, 134, 197, 1)', // 棒の枠線の色
          borderWidth: 1, // 枠線の太さ
      }],
    },
    options: {
      legend: {
        display: false, // 凡例を非表示
      }
    }
  });
}

