#include "crane.h"

//Global Variables
extern QueueHandle_t xQueueRemoteInput;

void TIM4_Init(void){
	// Enable clocks for TIM4 and GPIOB
	RCC->APB1ENR1 |= RCC_APB1ENR1_TIM4EN;
	RCC->AHB2ENR  |= RCC_AHB2ENR_GPIOBEN;

	// === GPIO Setup for PB6 (CH1) ===
	GPIOB->MODER &= ~(0b11 << (6 * 2));
	GPIOB->MODER |=  (0b10 << (6 * 2));        // Alternate Function
	GPIOB->AFR[0] &= ~(0xF << (6 * 4));
	GPIOB->AFR[0] |=  (0x2 << (6 * 4));        // AF2 (TIM4_CH1)
	GPIOB->OSPEEDR |= (0b11 << (6 * 2));       // High speed
	GPIOB->PUPDR   &= ~(0b11 << (6 * 2));      // No pull-up/down

	// === GPIO Setup for PB7 (CH2) ===
	GPIOB->MODER &= ~(0b11 << (7 * 2));
	GPIOB->MODER |=  (0b10 << (7 * 2));        // Alternate Function
	GPIOB->AFR[0] &= ~(0xF << (7 * 4));
	GPIOB->AFR[0] |=  (0x2 << (7 * 4));        // AF2 (TIM4_CH2)
	GPIOB->OSPEEDR |= (0b11 << (7 * 2));       // High speed
	GPIOB->PUPDR   &= ~(0b11 << (7 * 2));      // No pull-up/down

	// === Timer Base Setup ===
	TIM4->CR1 &= ~TIM_CR1_CMS;  // Edge-aligned
	TIM4->CR1 &= ~TIM_CR1_DIR;  // Up-counting
	TIM4->PSC = 0;              // Prescaler
	TIM4->ARR = 1136;           // Auto-reload (PWM period)
	TIM4->CCR1 = 0;             // Start CH1 at 0% duty
	TIM4->CCR2 = 0;             // Start CH2 at 0% duty

	// === PWM Mode for CH1 (PB6) ===
	TIM4->CCMR1 &= ~TIM_CCMR1_OC1M;
	TIM4->CCMR1 |=  (TIM_CCMR1_OC1M_1 | TIM_CCMR1_OC1M_2);  // PWM Mode 1
	TIM4->CCMR1 |=  TIM_CCMR1_OC1PE;                       // Preload enable
	TIM4->CCER  |=  TIM_CCER_CC1E;                         // Enable CH1 output

	// === PWM Mode for CH2 (PB7) ===
	TIM4->CCMR1 &= ~TIM_CCMR1_OC2M;
	TIM4->CCMR1 |=  (TIM_CCMR1_OC2M_1 | TIM_CCMR1_OC2M_2);  // PWM Mode 1
	TIM4->CCMR1 |=  TIM_CCMR1_OC2PE;                       // Preload enable
	TIM4->CCER  |=  TIM_CCER_CC2E;                         // Enable CH2 output

	// === Enable Timer ===
	TIM4->CR1 |= TIM_CR1_CEN;

	// (Optional) Enable interrupt if needed
	// NVIC_EnableIRQ(TIM4_IRQn);
}

void prvSetupHardware(){
	//startup the 16 MHz HSI
	RCC->CR |= RCC_CR_HSION;
  while((RCC->CR & RCC_CR_HSIRDY) == 0);
	
	//switch to the HSI
	RCC->CFGR |= RCC_CFGR_SW_HSI;
	
	//Enalbe preipheral clocks
	RCC->AHB2ENR |= RCC_AHB2ENR_GPIOAEN;
	RCC->AHB2ENR |= RCC_AHB2ENR_GPIOBEN;
	RCC->AHB2ENR |= RCC_AHB2ENR_GPIOCEN;
	
	//Enable ADC clock
	RCC->AHB2ENR |= RCC_AHB2ENR_ADCEN;    // Enable ADC
	
	//Enable both ADC's
	ADC1_Init();
	ADC2_Init();
	
	//Enable hall effect for weight track
	hall_effect_init();
	
	//Enable outputs for weight motor
	general_motors_init();
	
	//Enable uart
	USART3_Init();
	
	//Enable timer
	TIM4_Init();
	
	//enable outputs for rotate motor init
	rotate_motor_init();
	
	//enable outputs for arm motors
	arm_motor_init();
}