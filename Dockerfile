FROM python:3.9-slim

# Instalar dependencias (incluyendo default-mysql-client para mysqladmin)
RUN apt-get update && apt-get install -y default-libmysqlclient-dev gcc default-mysql-client && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar e instalar las librerías desde el requirements.txt
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copiar el resto del código
COPY . .

# Exponer el puerto 8080
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["sh", "-c", "until mysqladmin ping -h mysql --silent; do echo waiting for mysql; sleep 1; done; python app/main.py"]