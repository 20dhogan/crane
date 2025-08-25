#include "crane.h"

extern QueueHandle_t xQueueRemoteInput;

void solenoid(void *argument){
  uint8_t RemoteCommand = 0;
	uint8_t LineCommand = 0;
	uint8_t OldLineCommand = 0;
	
	while(1){
		//We need to peek the most recent command from the controller
		xQueuePeek(xQueueRemoteInput, &RemoteCommand, 100);
		
		//parse LineCommand out
		LineCommand = (RemoteCommand >> 0) & 0x03;
		
		//Here we will contorl the solonoid
		if((LineCommand == 0b00 && OldLineCommand == 0b01) || (LineCommand == 0b00 && OldLineCommand == 0b10)){
			//We need to engage the solonid BREAK!
			vTaskDelay(300);
			gpio_Write(GPIOC, 4, false);
			gpio_Write(GPIOC, 5, true);
			vTaskDelay(4000);
			gpio_Write(GPIOC, 4, false);
			gpio_Write(GPIOC, 5, false);
		} else if((LineCommand == 0b01 && OldLineCommand == 0b00) || (LineCommand == 0b10 && OldLineCommand == 0b00)){
			//Release Break
			gpio_Write(GPIOC, 4, true);
			gpio_Write(GPIOC, 5, false);
			vTaskDelay(4000);
			gpio_Write(GPIOC, 4, false);
			gpio_Write(GPIOC, 5, false);
		}
		
		OldLineCommand = LineCommand;
		vTaskDelay(50);
	}
}