<?php 
	require_once "../include/config.php"; //database connection file
	$path = $_SERVER['PATH_INFO'];
	$method = $_SERVER['REQUEST_METHOD'];
	
	if($path === "/gamelist"){
		header('Content-Type: application/json');
		getGameList();
	}else if(preg_match("^/gamereview/id/(\d+)^", $path, $params)){
		header('Content-Type: application/json');
		getReviews($params[1]);
	}

	function getGameList(){
		global $conn; 
		$games_array = array();
		$query = "SELECT * FROM game";

		if($result = mysqli_query($conn, $query)){
			while($row = mysqli_fetch_assoc($result)){
				$games_array[] = $row;
			}
		}
		echo json_encode($games_array);
	} 

	function getReviews($gameID){
		global $conn;
		echo $gameID;
		$review_array = array();
		$query = "SELECT id, reviewer_name, review, rating FROM review WHERE game_id=?";

		if(!$stmt = mysqli_prepare($conn, $query)){
			echo "error prepare";
		}

		if(!mysqli_stmt_bind_param($stmt, "i", $gameID)){
			echo "bind error";
		}
		if(!mysqli_stmt_execute($stmt)){
			echo "execute error";
		}

		if($result = mysqli_stmt_get_result($stmt)){
			print_r($result);
			while($row = mysqli_fetch_assoc($result)){
				print_r($row);
				$review_array[] = $row;
			}
		}
		echo json_encode($review_array);
	}
	
 ?>