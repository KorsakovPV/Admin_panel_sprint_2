FROM python:3.7.4

WORKDIR /code

RUN mkdir -p movies_admin/requirements

COPY movies_admin/requirements/*.txt movies_admin/requirements/

RUN pip install -r movies_admin/requirements/production.txt

COPY . .

CMD gunicorn movies_admin.config.wsgi:application --bind 0.0.0.0:8000