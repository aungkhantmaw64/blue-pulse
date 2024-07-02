FROM debian:11-slim

RUN apt-get update -y && apt-get install -y \
  build-essential python3-dev python3-pip python3-venv \
  git curl wget cmake


WORKDIR /app

ADD ./tools/requirements.txt /app

RUN pip install -r requirements.txt

ADD entrypoint.sh /app/

ENTRYPOINT ["/app/entrypoint.sh" ]
