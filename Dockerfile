# syntax=docker/dockerfile:1
FROM python:3.9
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PROFILE=prod
# ENV DJANGO_SETTINGS_MODULE=port.settings
WORKDIR /app/api
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . ./
EXPOSE 8000
# RUN ls
ENTRYPOINT ["./docker-entrypoint.sh"]
