FROM python:3.10-alpine

COPY requirements.txt minecraft_exporter.py /
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["python","-u","minecraft_exporter.py"]

RUN addgroup -S -g 1000 minecraft && adduser -s /bin/sh -h /minecraft/ -u 1000 -S -G minecraft minecraft

USER minecraft
