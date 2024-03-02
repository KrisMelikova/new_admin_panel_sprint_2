## API для кинотеатра 
### возвращает список фильмов в формате, описанном в openapi-файле, и позволяющий получить информацию об одном фильме

____________________________________________________________________________
Как запустить проект и проверить его работу:
____________________________________________________________________________

Активация виртуального окружения
```
source venv/bin/activate
```

Запуск приложения с docker compose:
```
docker-compose up
```

Приложение будет доступно по адресу:
```
http://127.0.0.1:80
```

Админка:
```
http://127.0.0.1:80/admin
```

Генерация superuser, чтобы войти в админку:
```
docker ps
docker exec -it new_admin_panel_sprint_2_service_1 bash
cd movies_app
python manage.py createsuperuser
```

Заполнение базы данными:
```
cd sqlite_to_postgres
python load_data.py
```
____________________________________________________________________________
Часть, которая будет актуальна при разработке и отладке:
____________________________________________________________________________

Установка зависимостей
```
pip3 install -r requirements.txt
```

Запуск отладочного сервера:
```
python manage.py runserver <port>

python manage.py migrate

python3 load_data.py (см. sqlite_to_postgres папку)
```

Вход в интерактивный интерпретатор
```
python manage.py shell
```
Docker:
```
docker build -t django_api .
docker run -p 8000:8000 --rm --name django django_api
```

Для отладки c docker compose могут пригодиться:
```
docker-compose down
docker-compose build
docker exec -it <name> bash
```