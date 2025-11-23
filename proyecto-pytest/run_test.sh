#!/bin/bash
echo "1. Iniciando ejecución de pruebas en Jenkins"

echo "2. Creando entorno virtual..."
python3 -m venv venv

echo "3. Activando entorno virtual..."
source venv/bin/activate

echo "4. Instalando dependencias..."
pip install --upgrade pip
pip install -r requirements.txt

echo "5. Ejecutando Pytest..."
pytest --maxfail=1 --disable-warnings -q

echo "6. Generando reportes..."
pytest --junitxml=reports/resultados.xml

echo "7. Terminó la ejecución de pruebas"
