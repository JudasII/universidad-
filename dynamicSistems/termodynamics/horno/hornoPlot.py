import time
import hornoControl
import matplotlib.pyplot as pyplot
import matplotlib.animation as animation
from matplotlib import style
import mpld3

Xs = []
Ys = []
def getData(volt, period):
    hornoControl.saveTemperatures(hornoControl.getTemperature(float (volt),float(period)),float(period))
    graph_data = open('temperatures.txt', 'r').read()
    lines = graph_data.split('\n')
    for line in lines:
        if len(line) > 1:
            x, y = line.split(',')
            Xs.append(float(x))
            Ys.append(float(y))
#    grafica = pyplot.figure()
#    for i in range(0,len(Xs)):
#        pyplot.scatter(Xs[i], Ys[i])
#    pyplot.show()

def getYs():
    return Ys