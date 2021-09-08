# syntax=docker/dockerfile:1
FROM python:3
ENV PATH="/build_scripts:${PATH}"
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=app.settings
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/

COPY ./build_scripts/ /build_scripts

RUN chmod +x /build_scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

RUN adduser headbrewer
RUN chown -R headbrewer:headbrewer /vol
RUN chmod -R 755 /vol/web

USER headbrewer

CMD ["entrypoint.sh"]