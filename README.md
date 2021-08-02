[comment]: <> (# Техническое задание)

[comment]: <> (В качестве второго задания предлагаем расширить проект «Панель администратора»: запустить приложение через WSGI/ASGI, настроить отдачу статических файлов через Nginx и подготовить инфраструктуру для работы с Docker. Для этого перенесите в репозиторий код, который вы написали в первом спринте, и выполните задания из папки `tasks`.)

[comment]: <> (## Используемые технологии)

[comment]: <> (- Приложение запускается под управлением сервера WSGI/ASGI.)

[comment]: <> (- Для отдачи [статических файлов]&#40;https://nginx.org/ru/docs/beginners_guide.html#static&#41; используется **Nginx.**)

[comment]: <> (- Виртуализация осуществляется в **Docker.**)

[comment]: <> (## Основные компоненты системы)

[comment]: <> (1. **Cервер WSGI/ASGI** — сервер с запущенным приложением.)

[comment]: <> (2. **Nginx** — прокси-сервер, который является точкой входа для web-приложения.)

[comment]: <> (3. **PostgreSQL** — реляционное хранилище данных. )

[comment]: <> (4. **ETL** — механизм обновления данных между PostgreSQL и ES.)

[comment]: <> (## Схема сервиса)

[comment]: <> (![all]&#40;images/all.png&#41;)

[comment]: <> (## Требования к проекту)

[comment]: <> (1. Приложение должно быть запущено через WSGI/ASGI.)

[comment]: <> (2. Все компоненты системы находятся в Docker.)

[comment]: <> (3. Отдача статических файлов осуществляется за счёт Nginx.)

[comment]: <> (## Рекомендации к проекту)

[comment]: <> (1. Для работы с WSGI/ASGI-сервером база данных использует специального юзера.)

[comment]: <> (2. Для взаимодействия между контейнерами используйте docker compose.)

 
# Проект второго спринт

«Панель администратора»: запускается приложение через WSGI/ASGI, отдает статические файловы через Nginx. Инфраструктуру проекта реализована через Docker.

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

При работе над проектом использован стек технологий: **[Django](https://www.djangoproject.com/)**, **[Python](https://www.python.org/)**, **[PostgreSQL](https://www.postgresql.org/)**, **[NGINX](https://nginx.org/)**, **[Docker](https://www.docker.com/)**, **[Docker-Compose](https://docs.docker.com/compose/)**, **[GitHub](https://github.com)**, код написан в IDE **[PyCharm](https://www.jetbrains.com/pycharm/)**, **[OS Linux Mint](https://linuxmint.com/)**