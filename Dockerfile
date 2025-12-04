# Используем официальный Python-образ
FROM python:3.11-slim

# Устанавливаем рабочую директорию
WORKDIR /home/ubuntu/catty-reminders-app

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем ВСЕ исходные файлы (включая папку app/)
COPY . .

# Открываем порт
EXPOSE 8181

# Команда запуска (из WORKDIR /app)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8181"]
