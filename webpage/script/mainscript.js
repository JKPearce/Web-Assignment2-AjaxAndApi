var listGamesTimerVar;
var url = window.location.href;
console.log(url);

function listGamesTimer(){
	listGames();
	listGamesTimerVar = setInterval(listGames, 30000);
}

function listGames(){
	console.log("entered listgames function");
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "api/gamelist", true);
	xhttp.onload = function() { //call this function every time the ready state changes
		var data = JSON.parse(this.response);
		var html = "";
			for(var i = 0; i < data.length; i++){
				var gameName = data[i].name;
				var gameID = data[i].id;
				var gameImage = data[i].image_url;
				html += '<div onclick="showReviews('+ gameID + ')" class="gameList" id="gameid' + gameID + '">' +
						'<h1>' + gameName + '</h1>' +
						'<img class="image" id="' + gameName + '" src="' + gameImage + '">' +
						'</div>'; //create the html code for each game
				document.getElementById("main_content").innerHTML = html; //add to main content div
			}
	};
	xhttp.send();
};

function showReviews(gameID){
	//removes the refresh timer for listGames
	clearTimeout(listGamesTimerVar);

	//Clears page of game list
	deleteElementByClass(".gameList");


}

//takes a class name and removes the class from the html document
function deleteElementByClass(className){
	var elem = document.querySelectorAll(className);
	for(var i = 0; i < 4; i++){
		elem[i].parentNode.removeChild(elem[i]);
	}
}