<center>
  <i>
    Все пока в сыром ввиде. Можно залогиниться и зарегистрироваться, но нельзя разлогиниться, разве что куки почистить.
  </i>
</center>
<ul>
  <li>Создана ветвь dev.</li>
</ul>
Добавляю ветку Redmain


Настройка database.yml<br>
<pre>default: &default
  adapter: mysql2
  database: zw_dev
  encoding: utf8
  username: (username)
  password: (password)
  socket: /var/run/mysqld/mysqld.sock

test:
  <<: *default
  database: zw_test

production:
  <<: *default
  database: zw_prod
  
development:
  <<: *default
  pool: 8
