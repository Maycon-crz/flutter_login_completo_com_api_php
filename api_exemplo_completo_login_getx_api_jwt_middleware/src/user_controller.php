<?php 	
	require_once "auth_controller.php";

	class UserController{
		public function getall(){
			if(AuthController::checkAuth()){
				return array(1 => 'Rafael', 2 => 'Bruna', 3 => 'Marcelo');
			}			
			throw new \Exception('Não autenticado');
		}


	}