FROM python:3.6

WORKDIR	/app
COPY app /app
CMD ["python", "cambia.py", "input.csv", "output.csv"]
