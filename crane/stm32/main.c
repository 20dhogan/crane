#include "crane.h"

volatile QueueHandle_t xQueueRemoteInput = NULL;

int main(void){
	TaskHandle_t xHandleWeight = NULL;
	TaskHandle_t xHandleLoadLine = NULL;
	TaskHandle_t xHandleRotate = NULL;
	TaskHandle_t xHandleArm = NULL;
	
	xQueueRemoteInput = xQueueCreate(1, sizeof(uint8_t));
	
	if (xQueueRemoteInput != NULL) { //check if the queues were created successfully
			prvSetupHardware();

			xTaskCreate(
				weight,
				"this task manages the weight on the track and the ADC's",
				256,
				NULL,
				1,
				&xHandleWeight
			);
		
			xTaskCreate(
				LoadLine,
				"this task manages the Load Line",
				256,
				NULL,
				1,
				&xHandleLoadLine
			);
				
			xTaskCreate(
					rotate,
					"contorls rotate task",
					256,
					NULL,
					1,
					&xHandleRotate
				);
				
			xTaskCreate(
					arm,
					"this task controls the arm going up and down",
					256,
					NULL,
					1,
					&xHandleArm
				);
			
			vTaskStartScheduler();
			
			while(1);	
  }
	
	return 0;
}