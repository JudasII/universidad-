import time
def enviromentTemp():
    return 18
def temperatureValues(voltage, measureT, previous):
    return voltage * measureT + previous

def getTemperature(voltage, measureT):
    temperatures =[]
    temperatures.append(enviromentTemp())
    for i in range(1,20):
        temperatures.append(temperatureValues(voltage,measureT,temperatures[i-1]))
    return temperatures

def saveTemperatures(temperatures, measureT):
    temperatureFile = open('temperatures.txt','r')
    temperatureFile.read()
    temperatureFile = open('temperatures.txt','a')    
    for i in range(0,len(temperatures)):
        temperatureFile.write(str(i*measureT) + "," + str(temperatures[i])+"\n")
    temperatureFile.close()    
