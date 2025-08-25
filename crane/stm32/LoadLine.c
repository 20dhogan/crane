#include "crane.h"

extern QueueHandle_t xQueueRemoteInput;

void LoadLine(void *argument){
  uint8_t RemoteCommand = 0;
	uint8_t speed = 0;
	uint8_t LineCommand = 0;
	
	while(1){
		//We need to peek the most recent command from the controller
		xQueuePeek(xQueueRemoteInput, &RemoteCommand, 100);
		
		//Now lets parse the speed command and LineCommand out
		LineCommand = (RemoteCommand >> 0) & 0x03;
		speed = (RemoteCommand >> 6) & 0x03;
		
		switch(LineCommand){
			case 0b01:
				//load line down (fwd)
				if(speed == 0b00){
					//25% dudy cycle
					TIM4->CCR1 = DutyCyclePercentToCCR(68);
					TIM4->CCR2 = 0;
				} else if(speed == 0b01){
					//50% dudy cycle
					TIM4->CCR1 = DutyCyclePercentToCCR(78);
					TIM4->CCR2 = 0;
				} else if(speed == 0b10){
					//75% dudy cycle
					TIM4->CCR1 = DutyCyclePercentToCCR(85);
					TIM4->CCR2 = 0;
				} else {
					//100% dudy cycle
					TIM4->CCR1 = DutyCyclePercentToCCR(100);
					TIM4->CCR2 = 0;
				}
			break;
			
			case 0b10:
				//load line up (rev)
				if(speed == 0b00){
					//25% dudy cycle
					TIM4->CCR1 = 0;
					TIM4->CCR2 = DutyCyclePercentToCCR(68);
				} else if(speed == 0b01){
					//50% dudy cycle
					TIM4->CCR1 = 0;
					TIM4->CCR2 = DutyCyclePercentToCCR(78);
				} else if(speed == 0b10){
					//75% dudy cycle
					TIM4->CCR1 = 0;
					TIM4->CCR2 = DutyCyclePercentToCCR(85);
				} else {
					//100% dudy cycle
					TIM4->CCR1 = 0;
					TIM4->CCR2 = DutyCyclePercentToCCR(100);
				}
			break;
			
			case 0b00:
			default:
				//lock the motor
				//both motors 0% dudy cycle
				TIM4->CCR1 = 0;
				TIM4->CCR2 = 0;
			break;		
		}
		vTaskDelay(100);
	}
}

uint16_t DutyCyclePercentToCCR(uint8_t percent) {
	if (percent > 100) percent = 100;
	return (TIM4->ARR * percent) / 100;
}
