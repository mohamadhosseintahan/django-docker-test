FROM python:3.10
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt update
RUN apt install -y python3-dev
RUN apt install -y  default-mysql-client
RUN apt install -y default-libmysqlclient-dev

WORKDIR /opt/A

RUN pip install --upgrade pip

COPY requirements.txt /opt/A

RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements.txt

COPY . /opt/A