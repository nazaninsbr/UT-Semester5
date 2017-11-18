#include "Arduino.h"
#include "YL69.h"
YL69::YL69(uint8_t analogpin, int digitalpin){

	pinMode(digitalpin,INPUT);
	_ap=analogpin;
	_dp=digitalpin;

	}

void YL69::begin(){
	_yl69_element = 0;
	for (int i = 0; i <20; i++) {
		_data[i] = 1100;
	}
}

float YL69::getDataYL69(){
	i = 0;
	_sum = 0;
	while (_data[i] != 1100)
	{
		_sum = _data[i]+_sum;
		i++;
		if (i == 20)
		  break;
	}
		
	_average_yl69 =(_sum/i);
	return _average_yl69;
}

void YL69::end(){
    for (int i = 0; i <20; i++) 
    {
        _data[i] =1100;
    }  
}

int YL69::measure(){

	_current_yl69= analogRead(_ap);
	if (_data[0] == 1100)
	{
		_data[0] = _current_yl69;
		_yl69_element= 1;
	}
	else if (_data[0] != 1100)
	{
		getDataYL69();
		while (((_current_yl69 - _average_yl69) > 30) && ((_current_yl69 - _average_yl69) < -30))
		{
			for (i = 0; i < 10; i++)
			{
				_datacheck[i] = analogRead(_ap);
				_sum_check = _sum_check + _datacheck[i];
				delay(5);
			}
			_average_check = (_sum_check / 10);
			if ((_current_yl69 - _average_check<-30) && (_current_yl69 - _average_check>30))
			{
				_current_yl69 = analogRead(_ap);
				continue;
			}
		}
		_data[_yl69_element] = _current_yl69;
       _yl69_element++;

		if (_yl69_element == 20)
			_yl69_element = 0;
	}
}

void YL69::measureOne()
{
  for(i=0;i<30;i++)
  {
    measure();
    delay(2000);
  }
}

float YL69::mudOne()
{
_mudOneData=getDataTemp();
end();
return _mudOneData;
}