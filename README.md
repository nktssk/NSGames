# NSGames

Чтобы запустить надо: 
1) Скачать бэк (https://github.com/NikitaSosyuk/NSGames-BackEnd) 
2) В файле application.properties указать логин и пароль от Postgres и создать database с названием "ns_games": 
spring.datasource.username=ns_user
spring.datasource.password=ns_password
3) Запустить бэк
4) Выполнить post запрос по такому URL localhost/game/putAll
5) Перейти в папку NSGames; Установить Pods (pod install)
6) Дождаться пока все скомпилится и запустить приложение)
7) Зарегистрировать 2-ух пользователей, чтобы проверить чат и остальной функционал
8) Лучше запускать на двух симуляторах
