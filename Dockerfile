FROM python:3.10-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    && pip uninstall -y setuptools wheel \
    && rm -rf /usr/local/lib/python3.10/site-packages/setuptools*

COPY app/ .

EXPOSE 5000

CMD ["python", "app.py"]