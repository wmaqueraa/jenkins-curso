#!/bin/bash
set -e 

echo "activando el entorno virtual..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
#Activar entorno virtual (compatible con sh y bash)
#. venv/bin/activate
source venv/bin/activate

echo "instalando dependencias....."
pip install --upgrade pip
pip install -r requirements.txt

echo "Creando carpeta reports..."
mkdir -p reports

echo "ejecutando pruebas con Pytest......."
venv/bin/pytest tests/ --junitxml=reports/test-result.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas resultados en reports" 