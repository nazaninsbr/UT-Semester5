#include "Arduino.h"
#include "temp1.h"
//#include <TimerOne.h>
#include <DHT.h>
#include <DHT_U.h>
#include <Adafruit_Sensor.h>

#define DHTTYPE      DHT11   

sensors_event_t event;

temp1::temp1(int data_pin)
{
  pinMode(data_pin,INPUT);
  _data_pin=data_pin;
 
}

void temp1::begin()
{
 temp_element=0;
 humidity_element=0;
 //Timer1.initialize(3000000);
 //Timer1.attachInterrupt(measure);
 
 for( i=0; i<20; i++)
 {
   _data_temp[i]=999;
   _data_humidity[i]=999;
 }
}


float temp1::getDataTemp()
{
  i=0;
  _sum_temp=0;
  while(_data_temp[i]!= 999)
  {
    _sum_temp =_sum_temp+_data_temp[i];
    i++;
    if(i==20)
      break;
  }

  _average_temp = (_sum_temp/i);
  return _average_temp;
}


float temp1::getDataHumidity()
{
  i=0;
  _sum_humidity=0;
  while(_data_humidity[i] != 999)
  {
   _sum_humidity =_sum_humidity+_data_humidity[i];
   i++;
   if(i==20)
     break;
  }
  _average_humidity = (_sum_humidity/i);
  return _average_humidity;
   
}


void temp1::measure()
{
  DHT_Unified dht(_data_pin, DHT11);
  dht.begin();
  dht.temperature().getEvent(&event);
  while (isnan(event.temperature)) 
  {
    delay(5);
    dht.temperature().getEvent(&event);
  }
  
  if(_data_temp[0]==999)
  {
    _sum_test=0;
    for(i=0;i<20;i++)
    {
      _sum_test=_sum_test +event.temperature;
      dht.temperature().getEvent(&event);
      delay(500);
    }
   
    _data_temp[0]= (_sum_test/20);
    temp_element=1;
  }
  else if(_data_temp[0]!=999)
  { 
    getDataTemp();
    while(((event.temperature-_average_temp)>3)&&((event.temperature-_average_temp)<-3))
    {
      delay(5);
      dht.temperature().getEvent(&event);
    }  
    _data_temp[temp_element] = event.temperature;
    temp_element++;
    
    if(temp_element==20)
      temp_element=0;
  }
  
  dht.humidity().getEvent(&event);
  while (isnan(event.relative_humidity)) 
  {
    delay(5);
    dht.humidity().getEvent(&event);
  }

  if(_data_humidity[0]==999)
  {
    _sum_test=0;
    for(i=0;i<20;i++)
    {
      _sum_test=_sum_test +event.relative_humidity;
      dht.humidity().getEvent(&event);
      delay(500);
    }
   
    _data_humidity[0]= (_sum_test/20);
    humidity_element=1;
  }
  else if(_data_humidity[0]!=999)
  { 
    getDataHumidity();
    while(((event.relative_humidity-_average_humidity)>3)&&((event.relative_humidity-_average_humidity)<-3))
    {
      delay(5);
      dht.humidity().getEvent(&event);
    }   
      
    _data_humidity[humidity_element] = event.relative_humidity;
    humidity_element++;
    
    if(humidity_element==20)
      humidity_element=0; 
  }
 
}


void temp1::end()
{
 //Timer1.detachInterrupt();
	
	for (i = 0; i<20; i++)
	{
	    _data_temp[i] = 999;
	    _data_humidity[i] = 999;
	}
}


	
void temp1::measureOne()
{
  for(i=0;i<30;i++)
  {
    measure();
    delay(2000);
  }
}

float temp1::tempOne()
{
_tempOneData=getDataTemp();
end();
return _tempOneData;
}

float temp1::humidityOne()
{
_humidityOneData=getDataHumidity();
end();
return _humidityOneData;
}

