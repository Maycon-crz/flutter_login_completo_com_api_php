<?php
	header('Content-Type: application/json; charset=UTF-8');
	header("Access-Control-Allow-Origin: *");
	require_once "src/rest.php";	
	
	if(isset($_SERVER['REQUEST_URI']) && !empty($_SERVER['REQUEST_URI'])){			
		$rest = new Rest();
		echo $rest->run($_SERVER['REQUEST_URI']);		
	}