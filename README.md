# Техническое задание

В качестве второго задания предлагаем расширить проект «Панель администратора»: запустить приложение через WSGI/ASGI, настроить отдачу статических файлов через Nginx и подготовить инфраструктуру для работы с Docker. Для этого перенесите в репозиторий код, который вы написали в первом спринте, и выполните задания из папки `tasks`.

## Используемые технологии

- Приложение запускается под управлением сервера WSGI/ASGI.
- Для отдачи [статических файлов](https://nginx.org/ru/docs/beginners_guide.html#static) используется **Nginx.**
- Виртуализация осуществляется в **Docker.**

## Основные компоненты системы

1. **Cервер WSGI/ASGI** — сервер с запущенным приложением.
2. **Nginx** — прокси-сервер, который является точкой входа для web-приложения.
3. **PostgreSQL** — реляционное хранилище данных. 
4. **ETL** — механизм обновления данных между PostgreSQL и ES.

## Схема сервиса

![all](images/all.png)

## Требования к проекту

1. Приложение должно быть запущено через WSGI/ASGI.
2. Все компоненты системы находятся в Docker.
3. Отдача статических файлов осуществляется за счёт Nginx.

## Рекомендации к проекту

1. Для работы с WSGI/ASGI-сервером база данных использует специального юзера.
2. Для взаимодействия между контейнерами используйте docker compose.

При работе над проектом использован стек технологий: **[Django](https://www.djangoproject.com/)**, **[Python](https://www.python.org/)**, **[PostgreSQL](https://www.postgresql.org/)**, **[NGINX](https://nginx.org/)**, **[Docker](https://www.docker.com/)**, **[Docker-Compose](https://docs.docker.com/compose/)**, **[GitHub](https://github.com)**, код написан в IDE PyCharm, OS Linux Mint  

## Разворачивание проекта

1.  С клонируйте проект

        git clone https://github.com/KorsakovPV/Admin_panel_sprint_2
    
    В корневой папке находим файл .env.sample. Это шаблон файла переменных окружения. По образу и подобию необходимо создать файл .env и заполнить его своими значениями.


2. Запускаем процесс сборки и запуска контейнеров:

        docker-compose up --build

3. Накатываем миграции:

        docker-compose exec admin_panel python manage.py migrate

4. Создаем пользователя с правами администратора:

        docker-compose exec admin_panel python manage.py createsuperuser

5. Добавляем в базу тестовые случайно сгенерированные данные:

        docker-compose exec admin_panel python manage.py generating_data

6. Собираем статику:

        docker-compose exec admin_panel python manage.py collectstatic

