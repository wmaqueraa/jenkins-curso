#!/bin/bash

echo "1.- Iniciando Ejecucion de Pruebas en Jenkins "

if [ ! -d "venv" ]; then
    echo "   1.1.- Entorno virtual no encontrado. Creandolo.."
    python3 -m venv venv
fi
#Activar entorno virtual (compatible con sh y bash)
#. venv/bin/activate
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then #Para Windows
    source venv/Scripts/activate
else
    echo "Error : no se pudo activar el entorno virtual"
    exit 1
fi
echo "2- Instalando dependencias....."
pip install --upgrade pip
pip install -r requirements.txt

echo "3.- Creando carpeta reports..."
mkdir -p reports

echo "4.- Ejecutando pruebas con Pytest......."
venv/bin/pytest tests/ --junitxml=reports/test-result.xml --html=reports/test-results.html --self-contained-html

echo "5.- Pruebas finalizadas resultados en reports"