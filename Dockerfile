FROM python:3.13.3-slim

WORKDIR /app

EXPOSE 3000

COPY app/requirements.txt .

RUN pip install -r requirements.txt

COPY app/ .

CMD ["python3", "app.py"]