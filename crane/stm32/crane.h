#ifndef CRANE_H
#define CRANE_H
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include "FreeRTOS.h"
#include "queue.h"
#include "task.h"
#include "stm32l476xx.h"

//#define variables

//function delorations
//TIMER**************************************
void TIM4_Init(void);
uint16_t DutyCyclePercentToCCR(uint8_t percent);

//UART***************************************
void USART3_Init(void);
void USART3_IRQHandler(void);
uint8_t USART_Read(USART_TypeDef *USARTx);

//ADC*****************************************
void ADC1_Init(void);
void ADC2_Init(void);
uint16_t Read_ADC(ADC_TypeDef *ADCx);

//hall effect
void hall_effect_init(void);

//TASKS***************************************
void weight(void *argument);
void general_motors_init(void);
void solenoid(void *argument);
void rotate(void *argument);
void arm(void *argument);
void LoadLine(void *argument);

//Helper Functions****************************
void gpio_Write(GPIO_TypeDef *port, uint8_t pin, bool val);
bool gpio_Read(GPIO_TypeDef *port, uint8_t pin);
void rotate_motor_init();
void arm_motor_init();
void prvSetupHardware();
void shift_and_insert(uint16_t *arr, uint16_t size, uint16_t new_value);
uint16_t average_uint16(const uint16_t *arr, uint16_t size);

#endif