#include "crane.h"

extern QueueHandle_t xQueueRemoteInput;
static bool turnMotor[4][4] = {
    {1, 1, 0, 0},
    {0, 1, 1, 0},
    {0, 0, 1, 1},
    {1, 0, 0, 1}
};

void rotate(void *argument){
  uint8_t RemoteCommand = 0;
	uint8_t RotateCommand = 0;
	uint8_t speed = 0;
	int placement = 0;
	
	while(1){
		//We need to peek the most recent command from the controller
		xQueuePeek(xQueueRemoteInput, &RemoteCommand, 100);
		
		//parse LineCommand out
		RotateCommand = (RemoteCommand >> 4) & 0x03;		
		speed = (RemoteCommand >> 6) & 0x03;
		
		if(RotateCommand == 0b00){
			for(int i = 0; i < 4; i++){
				gpio_Write(GPIOC, i+6, 0);
			}
			vTaskDelay(500);
		} else if(RotateCommand == 0b01){
			
			for(int i = 0; i < 4; i++){
				gpio_Write(GPIOC, i+6, turnMotor[placement][i]);
			}
			
			if(placement == 3){
				placement = 0;
			} else {
				placement++;
			}
			
			switch(speed){
				case 0b00:
					vTaskDelay(50);				
				break;
				
				case 0b01:
					vTaskDelay(25);
				break;
				
				case 0b10:
					vTaskDelay(15);
				break;
				
				case 0b11:
					vTaskDelay(8);
				break;
			}
			
		} else if(RotateCommand == 0b10) {
			for(int i = 0; i < 4; i++){
				gpio_Write(GPIOC, i+6, turnMotor[placement][i]);
			}
			
			if(placement == 0){
				placement = 3;
			} else {
				placement--;
			}
			
			switch(speed){
				case 0b00:
					vTaskDelay(50);				
				break;
				
				case 0b01:
					vTaskDelay(25);
				break;
				
				case 0b10:
					vTaskDelay(15);
				break;
				
				case 0b11:
					vTaskDelay(8);
				break;
			}
		}
	
	}
}

void rotate_motor_init(){
	//PC 2,3,4,5 will be used to run the weight motor and the line motor.
	GPIOC->MODER &= 0xFFF00FFF; //clear pins 6-9
	GPIOC->MODER |= 0x00055000; //set pins 6-9 as output
}