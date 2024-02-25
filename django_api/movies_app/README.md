## API для кинотеатра (возвращает список фильмов в формате, описанном в openapi-файле, и позволяющий получить информацию об одном фильме)

### ! Использовалась DB с прошлого спринта

Активация виртуального окружения
```
source venv/bin/activate
```

Установка зависимостей
```
pip3 install -r requirements.txt
```

Запуск проекта:
```
python manage.py runserver <port>

python manage.py makemigrations
python manage.py migrate

python3 load_data.py (см. sqlite_to_postgres папку)
```

Вход в интерактивный интерпретатор
```
python manage.py shell
```