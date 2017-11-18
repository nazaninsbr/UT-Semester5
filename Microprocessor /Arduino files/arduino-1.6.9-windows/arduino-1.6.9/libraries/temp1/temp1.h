/*
  temp1.h - library for DHT11
  Created by javad khaghani November,21,2016 
 */

#ifndef temp1_h
#define temp1_h 
#include "Arduino.h"

class temp1 
{
  public:
  temp1(int data_pin);
  void begin();
  float getDataTemp();
  float getDataHumidity();
  void end();
  void measure();
  void measureOne();
  float tempOne();
  float humidityOne();

  private:
  int _data_pin=2;
  float _sum_temp=0;
  float _data_temp[20];
  float _average_temp=0;
  float _sum_humidity=0;
  float _data_humidity[20];
  float _average_humidity;
  int i;
  int temp_element;
  int humidity_element;
  float _sum_test;
  float _tempOneData;
  float _humidityOneData;

};

#endif
