# Modelo de sistema de login e cadastro de usuários Flutter consumindo API PHP
Este modelo contém a base de login, cadastro de usuários e CRUD de postagens consumindo uma API PHP (com link para o repositório back-end PHP).

## Indice
- Tecnologias utilizadas;
- Requisitos e links que auxiliam;
- Como instalar;
- Imagens do modelo;
- Dicas de Extensões para VS Code;

### Tecnologias utilizadas
- Dart: 2.18, Flutter: 3.1;
- Pacotes: get: ^4.6.5, get_storage: ^2.0.3, mask_text_input_formatter: ^2.4.0, file_picker_cross: ^4.4.2, flutter_slidable: ^2.0.0, font_awesome_flutter: ^10.4.0, cached_network_image: ^3.2.1;
- Arquitetura MVC;
- Verificação e armazenamento de token JWT;
- Saparação de códigos em componentes, Baixo Acoplamento, Alta coesão; 
- Middleware para restrição de acesso;
- Requisições de API;

### Requisitos e links que auxiliam
- Flutter instalado, aqui tem um <a href="https://www.youtube.com/watch?v=FUWYvBJOlsI">vídeo</a> ensinando a instalar o Flutter ou você pode instalar o FVM (Gerenciador de versão do Flutter) usando esse <a href="https://www.youtube.com/watch?v=lQCf4At6Upc">vídeo</a>
- PHP instalado e sistema Back-End da API rodando, aqui neste <a href="https://github.com/Maycon-crz/modelo_de_sistema_php_com_api/blob/main/README.md">repositório</a> tem tudo o que é necessário para instalar o PHP e deixar o Back-End funcionando;

### Como instalar
- 1º) Certifique-se se de que o Dart, Flutter estão instalados entrando no prompt de comando e digitando: dart --version e flutter --version, verifique se o servidor php está funcionando;
- 2º) Copie o link do repositório no gitHub, va até a pasta que deseja clonar o projeto, apague o endereço da pasta e digite cmd, vai abrir o prompt de comando, com o caminho da pasta, em seguida digite: git clone (da um espaço) e cole o link do repositório;
- 3º) Abra a pasta (login_flutter) no VS Code em seguida abra o terminal e digite o comando: (flutter clean) deipois (flutter analyze) caso ainda ocorram erros verifique as versões do dart, flutter e dos pacotes.
- 4º) Para iniciar o sistema clique em Run and Debug ou digite: (flutter run -d);
- 5º) Caso queira rodar o sistema diretamente no windows é necessário fazer algumas configurações este <a href="https://www.youtube.com/watch?v=kkH-LtjPbyU&list=PLzc1k4Riyr4Jv1YxbNadQ0Gua2-dCqD8Q&index=1">vídeo</a> mostra como fazer no android estudio mas após configurado é possível usar o VS Code;

### Imagens do modelo
| Imagem 1                                               | Imagem 2                                                     |
| ------------------------------------------------------ | ------------------------------------------------------------ |
| ![Imagem 1](imagens/login_v2.PNG)                      | ![Imagem 2](imagens/login_validation_v2.PNG)                 |

--------
![Imagem 1](imagens/panel_v2.PNG)
