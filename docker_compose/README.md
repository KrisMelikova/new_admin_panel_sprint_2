Запуск сервера:
```
python manage.py runserver <port>
```

Docker:
```
docker build -t django_2 .
docker run -p <host port>:<docker port> --rm --name dj_2 django_2
```