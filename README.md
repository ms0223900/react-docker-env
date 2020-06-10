## Essential Files:
* index.html
* .env
* env.sh
* docker-compose.yml
* Dockerfile

1. index.html要引入(config.env.js是env.sh在container up起來時產生的)
``<script src="./config.env.js"></script>``


2. 要使用時
``
  if(!window._env_) { window._env_ = {} }
  const YOUR_ENV = window._env_.{變數} || process.env.{變數}
``

3. 在docker-compose.yml自訂環境變數
