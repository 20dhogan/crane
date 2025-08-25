#include "crane.h"

//Globial Varialbes
extern QueueHandle_t xQueueRemoteInput;

//weight on track task
void weight(void *argument){
	const uint16_t array_size = 4;
	uint16_t front_adc_value = 0;
	uint16_t back_adc_value = 0;
	uint16_t front_average = 0;
	uint16_t back_average = 0;
	uint16_t difference_between_adc = 0;
	uint16_t cushion = 85;
	uint16_t front_array[array_size] = {0};
	uint16_t back_array[array_size] = {0};
	
	while(1){
		//front_adc_value = Read_ADC(ADC1);
		//back_adc_value = Read_ADC(ADC2);
		
		front_average = Read_ADC(ADC1) + 250;
		back_average = Read_ADC(ADC2);
		
		//now we need to find the average over the past few samples
		//shift_and_insert(front_array, array_size, front_adc_value);
		//shift_and_insert(back_array, array_size, back_adc_value);
		
		//front_average = average_uint16(front_array, array_size);
		//back_average = average_uint16(back_array, array_size);
		
		
		if(front_average > back_average){
			difference_between_adc = front_average - back_average;
			if(difference_between_adc > cushion && (gpio_Read(GPIOA, 0) == true)){
				//Then we need to move the cart twards the back
				gpio_Write(GPIOC, 3, false);
				gpio_Write(GPIOC, 2, true);
			} else {
				gpio_Write(GPIOC, 3, false);
				gpio_Write(GPIOC, 2, false);
			}			
		} else {
			difference_between_adc = back_average - front_average;
			if(difference_between_adc > cushion && (gpio_Read(GPIOC, 0) == true)){
				//Then we need to move the cart twards the front
				gpio_Write(GPIOC, 3, true);
				gpio_Write(GPIOC, 2, false);
			} else {
				gpio_Write(GPIOC, 3, false);
				gpio_Write(GPIOC, 2, false);
			}
		}
		vTaskDelay(100);
	}
}

void shift_and_insert(uint16_t *arr, uint16_t size, uint16_t new_value) {
    // Shift elements down from end toward start
    for (int i = size - 1; i > 0; i--) {
        arr[i] = arr[i - 1];
    }
    // Put the new value at the front
    arr[0] = new_value;
}

uint16_t average_uint16(const uint16_t *arr, uint16_t size) {
    uint16_t sum = 0;
    for (uint16_t i = 0; i < size; i++) {
        sum += arr[i];
    }
    return (sum + (size / 2)) / size; // rounded to nearest int
}

//ADC1 init

void ADC1_Init(void) {
    // --- 2. Configure PA1 as analog mode (channel 6) ---
    GPIOA->MODER |= 0x0000000C;          // MODER1 = 11 (analog)
    GPIOA->PUPDR &= 0xFFFFFFF3;          // No pull-up/pull-down
    GPIOA->ASCR |= (1U << 1);                  // Enable analog switch on PA1

    // --- 3. Enable SYSCFG clock and voltage booster ---
    RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
    SYSCFG->CFGR1 |= SYSCFG_CFGR1_BOOSTEN;

    // --- 4. Wake up ADC1 from deep power down ---
    if (ADC1->CR & ADC_CR_DEEPPWD)
        ADC1->CR &= ~ADC_CR_DEEPPWD;

    ADC1->CR |= ADC_CR_ADVREGEN;  // Enable voltage regulator
    for (volatile int i = 0; i < 320; i++);  // ~20us delay at 16MHz

    // --- 5. ADC Clock Configuration (HCLK/1) ---
    ADC123_COMMON->CCR &= ~(ADC_CCR_PRESC | ADC_CCR_CKMODE);
    ADC123_COMMON->CCR |= (1 << ADC_CCR_CKMODE_Pos);  // Synchronous clock mode (CKMODE = 01)

    // --- 6. ADC Calibration ---
    ADC1->CR &= ~ADC_CR_ADEN;         // Ensure ADC is disabled
    ADC1->CR |= ADC_CR_ADCAL;         // Start calibration
    while (ADC1->CR & ADC_CR_ADCAL);  // Wait for calibration complete

    // --- 7. Configure ADC parameters ---
    ADC1->CFGR &= ~(ADC_CFGR_RES | ADC_CFGR_ALIGN | ADC_CFGR_CONT | ADC_CFGR_EXTEN);
    // RES = 00 (12-bit), ALIGN = 0 (right), CONT = 0 (discontinuous), EXTEN = 00 (software trigger)

    // --- 8. Set regular sequence: 1 conversion, channel 6 (PA1) ---
    ADC1->SQR1 &= ~ADC_SQR1_L;                  // 1 conversion
    ADC1->SQR1 &= ~(0x1F << 6);                 // Clear SQ1 bits
    ADC1->SQR1 |= (6U << 6);                    // SQ1 = channel 6

    // --- 9. Set sample time for channel 6 (maximum for stable readings) ---
    ADC1->SMPR1 &= ~(7U << (3 * 6));            // Clear
    ADC1->SMPR1 |= (7U << (3 * 6));             // SMP6 = 111 (max sample time)

    // --- 10. Single-ended mode for channel 6 ---
    ADC1->DIFSEL &= ~ADC_DIFSEL_DIFSEL_6;

    // --- 11. Enable ADC ---
    ADC1->CR |= ADC_CR_ADEN;
    while (!(ADC1->ISR & ADC_ISR_ADRDY));  // Wait for ADC ready
}

void ADC2_Init(void) {
    // --- 2. Configure PC1 as analog mode (channel 2) ---
    GPIOC->MODER |= 0x0000000C;       // MODER1 = 11 (analog)
    GPIOC->PUPDR &= 0xFFFFFFF3;      // No pull-up/pull-down
    GPIOC->ASCR |= (1U << 1);              // Enable analog switch on PC1

    // --- 3. Enable SYSCFG clock and voltage booster ---
    RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
    SYSCFG->CFGR1 |= SYSCFG_CFGR1_BOOSTEN;

    // --- 4. Wake up ADC2 from deep power down ---
    if (ADC2->CR & ADC_CR_DEEPPWD)
        ADC2->CR &= ~ADC_CR_DEEPPWD;

    ADC2->CR |= ADC_CR_ADVREGEN;
    for (volatile int i = 0; i < 320; i++);  // ~20us delay at 16MHz

    // --- 5. ADC Clock Configuration (HCLK/1) ---
    ADC123_COMMON->CCR &= ~(ADC_CCR_PRESC | ADC_CCR_CKMODE);
    ADC123_COMMON->CCR |= (1 << ADC_CCR_CKMODE_Pos);  // Synchronous clock mode

    // --- 6. ADC Calibration ---
    ADC2->CR &= ~ADC_CR_ADEN;         // Ensure ADC is disabled
    ADC2->CR |= ADC_CR_ADCAL;         // Start calibration
    while (ADC2->CR & ADC_CR_ADCAL);  // Wait for calibration complete

    // --- 7. Configure ADC settings ---
    ADC2->CFGR &= ~(ADC_CFGR_RES | ADC_CFGR_ALIGN | ADC_CFGR_CONT | ADC_CFGR_EXTEN);
    // RES = 00 (12-bit), ALIGN = 0 (right), CONT = 0, EXTEN = 00 (software trigger)

    // --- 8. Set regular sequence: 1 conversion, channel 2 (PC1) ---
    ADC2->SQR1 &= ~ADC_SQR1_L;              // 1 conversion
    ADC2->SQR1 &= ~(0x1F << 6);             // Clear SQ1 bits
    ADC2->SQR1 |= (2U << 6);                // SQ1 = channel 2

    // --- 9. Set sample time for channel 2 ---
    ADC2->SMPR1 &= ~(7U << (3 * 2));        // Clear
    ADC2->SMPR1 |= (7U << (3 * 2));         // Max sample time

    // --- 10. Single-ended mode for channel 2 ---
    ADC2->DIFSEL &= ~ADC_DIFSEL_DIFSEL_2;

    // --- 11. Enable ADC2 ---
    ADC2->CR |= ADC_CR_ADEN;
    while (!(ADC2->ISR & ADC_ISR_ADRDY));  // Wait until ADC is ready
}

void hall_effect_init(){
	//PC-0 is for the halleffect sensor at the end of the track.
	GPIOC->MODER &= 0xFFFFFFFC; //Set PC-0 as input 00
	
	GPIOC->PUPDR &= 0xFFFFFFFC;//Set PC-0 as no pull 00
	//GPIOC->PUPDR |= 0x00000002;
	
	//PA-0 is for the halleffect sensor at the beginning of the track.
	GPIOA->MODER &= 0xFFFFFFFC; //Set PC-0 as input 00
	
	GPIOA->PUPDR &= 0xFFFFFFFC;//Set PC-0 as no pull 00
	//GPIOA->PUPDR |= 0x00000002;
}

void general_motors_init(){
	//PC 2,3,4,5 will be used to run the weight motor and the line motor.
	GPIOC->MODER &= 0xFFFFF00F; //clear pins 2-5
	GPIOC->MODER |= 0x00000550; //set pins 2-5 as output
	//pc 2,3 will be used to control the weight motor.
	//pc 4,5 will be used to control the line motor.
}

//ADC read funciton
uint16_t Read_ADC(ADC_TypeDef *ADCx) {
	const TickType_t timeout = pdMS_TO_TICKS(100); //our time out is 100 ms
	TickType_t start = xTaskGetTickCount();
	
    ADCx->CR |= ADC_CR_ADSTART;              // Start conversion
    while (!(ADCx->ISR & ADC_ISR_EOC)){// Wait for End Of Conversion
			if(xTaskGetTickCount() - start >= timeout){
			return 0;
			}
		}
    return (uint16_t)ADCx->DR;               // Return 12-bit result
}