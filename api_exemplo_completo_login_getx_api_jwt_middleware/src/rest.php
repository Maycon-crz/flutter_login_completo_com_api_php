<?php 
	require_once "auth_controller.php";
	require_once "user_controller.php";
	class Rest{
		public function run($requisicao)		
		{
			$email = isset($_POST['email']) ? $_POST['email'] : "";
			$password = isset($_POST['password']) ? $_POST['password'] : "";			
			$url = explode('/', $requisicao);
			$qtdURIs = count($url);
			/*Para pegar Class/Metodo*/
			$pegarApartirDe = ($qtdURIs - 1);
			return $this->executarLogin();
			
		}
		private function executarLogin(){
			try {
				$authController = new AuthController();
				$response = $authController->login();
				return json_encode(array('data' => $response, 'status' => 'success'));
			} catch (\Exception $e) {
				return json_encode(array('data' => $e->getMessage(), 'status' => 'error'));
			}
		}
		private function executarUser(){			
			try{
				$userController = new UserController();
				$response = $userController->getall();
				return json_encode(array('data' => $response, 'status' => 'success'));
			}catch(\Exception $e){
				return json_encode(array('data' => $e->getMessage(), 'status' => 'error'));
			}			
		}

	}