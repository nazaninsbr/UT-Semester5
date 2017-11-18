#ifndef YL69_h
#define YL69_h
#include "Arduino.h"

class YL69{

 public:
	YL69(uint8_t analogpin, int digitalpin);
    void begin();
    float getDataYL69();
    void end();
	int measure();

 private:
			uint8_t _ap;
			int _dp;
			int _data[20];
                        int _sum;
			int _yl69_element;
			float _average_yl69;
			int _current_yl69;
			int _datacheck[10];
			int _sum_check;
			float _average_check;
			int _element_check;
			int i;
                        int _mudOneData;
};

#endif
