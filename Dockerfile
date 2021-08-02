FROM python:3.7.4

WORKDIR /code

RUN mkdir -p requirements

COPY movies_admin/requirements/*.txt requirements/

RUN pip install -r requirements/production.txt

COPY ./movies_admin .

CMD gunicorn wsgi:application --bind 0.0.0.0:8000