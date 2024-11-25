# MSSQL-LOCAL

Запуск локального контейнера с БД MSSQL

## Подготовка

Необходимо создать каталог `mssql_data` в корне проекта и создать в нем подкаталоги `data`, `log`, `secrets` для монтирования каталогов в файловую систему контейнера.

При возникновении проблем с запуском контейнера - ошибка `permission denied` необходимо сделать следующие действия:

````bash
cd mssql_data
sudo chown 10001 data
sudo chown 10001 log
sudo chown 10001 secrets
````

Доступ к каталогу в этом случае может быть ограничен. Для просмотра содержимого каталогов используйте `sudo`:

````bash
sudo cat mssql_data/log/errorlog
````

## Миграции

Миграции выполняются автоматически при запуске контейнера, уже выполненные миграции будут выполняться повторно, это необходимо учитывать при локальном запуске (на стенде этот эффект не имеет значения в связи с отсутствием смонтированной файловой системы).

Миграции выполняются из `*.sql` файлов, отсортированных по имени в алфавитном порядке. Поэтому желательно использовать формат имени файла в таком шаблоне `<время_создания_миграции_в_unixtimestamp>_<имя_миграции>.sql`

```
1732541730226_init_db.sql
1732541730236_init_user.sql
...
```

## Возврат в исходное состояние

Для сброса данных БД необходимо удалить содержимое подкатологов `mssql_data`


## Запуск на Apple Silicon (M1, M2, M3)

[StackOverflow](https://stackoverflow.com/questions/73937152/sql-server-not-running-inside-docker-in-m1-processor)

* Install Ventura, the newest MacOS
* Upgrade Docker to latest
* Docker Settings > General: [X] Use virtualization framework and
* Docker Settings > Features in Development: [X] Use Rosetta...