import pytest 

def multiplicar(a,b):
    """Funcion que Multipla dos numeros"""
    return a*b

def test_multiplicar():
    assert multiplicar(1,2) == 2
    assert multiplicar(-1,1) == -1
    assert multiplicar(0,0) == 0 

def test_multiplicar_fail():
    assert multiplicar(1,3) == 6 