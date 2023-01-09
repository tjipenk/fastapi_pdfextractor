FROM python:3.8

RUN apt-get update && apt-get install -y ocrmypdf

COPY requirements.txt .

# RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./app ./

CMD ["uvicorn", "app.pdfapi:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]