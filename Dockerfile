FROM docker.io/python:3.12-slim-bullseye

ENV PIP_DISABLE_PIP_VERSION_CHECK="1"

WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . ./api/

ENV FLASK_APP=./api/app.py
ENV FLASK_ENV=development
ENV PORT=1337

CMD [ "flask", "run", "--host=0.0.0.0", "--port=1337" ]