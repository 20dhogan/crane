#include "crane.h"

//Globial Varialbes
extern QueueHandle_t xQueueRemoteInput;

//UART*******************************************************************************************
void USART_Init(USART_TypeDef * USARTx){
	//Disable USART
	USARTx->CR1 &= ~USART_CR1_UE;
	
	USARTx->CR1 &= ~USART_CR1_M;
	
	USARTx->CR2 &= ~USART_CR2_STOP;
	
	USARTx->CR1 &= ~USART_CR1_PCE;
	
	USARTx->CR1 &= ~USART_CR1_OVER8;
	
	USARTx->BRR = 0x683;
	
	USARTx->CR1 |= (USART_CR1_TE | USART_CR1_RE);
	
	USARTx->CR1 |= USART_CR1_UE;
	
	while((USARTx->ISR & USART_ISR_TEACK) == 0);
	
	while((USARTx->ISR & USART_ISR_REACK) == 0);
}

void USART3_Init(void){	
	 //Set PB10 and PB11 to Alternate Function mode
	 GPIOB->MODER &= 0xFF0FFFFF;
	 GPIOB->MODER |= 0x00A00000; // Alternate function Mode

	 //code from text book page 551
	 GPIOB->AFR[1] |= (0x7 << (4*2)) | (0x7 << (4*3)); //seting pins 10&11 to AF 7
	
	 GPIOB->OSPEEDR |= 0xF<<(2*10);
	
	 GPIOB->PUPDR &= 0xFF0FFFFF;
	 GPIOB->PUPDR |= 0x00500000;
	
	 GPIOB->OTYPER &= ~(0x3<<10);
      
   RCC->CCIPR &= ~RCC_CCIPR_USART3SEL;
   RCC->CCIPR |= RCC_CCIPR_USART3SEL_0;
	
	 //Enable USART clk
	 RCC->APB1ENR1 |= RCC_APB1ENR1_USART3EN;
	
	//To enable interupts
	USART3->CR1 |= USART_CR1_RXNEIE; //Receive register not empty interrupt
	NVIC_SetPriority(USART3_IRQn, 0);
	NVIC_EnableIRQ(USART3_IRQn);

	USART_Init(USART3);
}

uint8_t USART_Read(USART_TypeDef *USARTx){	
	while(!(USARTx->ISR & USART_ISR_RXNE));
	return USARTx->RDR;
}

void USART3_IRQHandler(void){
	uint8_t byte_message = USART_Read(USART3);
	xQueueOverwriteFromISR(xQueueRemoteInput, &byte_message, pdFALSE);
}