from django.http import HttpResponse
from django.shortcuts import render
import hornoPlot, hornoControl
import json

def horno(request):

    return render(request,'index.html',{'temperatura':[0], 'voltaje':0,'periodo':0})

def mostrar(request):
    periodo = request.GET['periodo']
    voltaje = request.GET['voltaje']
    temperatura = hornoControl.getTemperature(float(voltaje),float(periodo)).pop()
    hornoPlot.getData(float(voltaje),float(periodo))

    return render(request, 'index.html',{'voltaje':voltaje,'periodo':periodo, 'temperatura' : [temperatura]})
    #return HttpResponse(grafico)