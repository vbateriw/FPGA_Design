/*
 * Simple DEMO to illustrate how to transfer data from/to UART
 */


#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <alt_types.h>
#include <io.h>
#include "system.h"
#include "sys/alt_irq.h"
#include "UART.h"

#define BAUD_RATE_0 115200      //used for variable baud rate
#define BAUD_RATE_1 115200




////////////////////// This is for IRQ service routines, UART cannot work without IRQ
void InitUart()
{
int context_uart1,context_uart2;

InitUart1(BAUD_RATE_0);
InitUart2(BAUD_RATE_1);

alt_ic_isr_register(UART_0_IRQ_INTERRUPT_CONTROLLER_ID, UART_0_IRQ,IsrUart1,&context_uart1,0x0 ); // install UART2 ISR
alt_ic_isr_register(UART_1_IRQ_INTERRUPT_CONTROLLER_ID, UART_1_IRQ,IsrUart2,&context_uart2,0x0); // install UART2 ISR

alt_ic_irq_enable(UART_0_IRQ_INTERRUPT_CONTROLLER_ID, UART_0_IRQ);
alt_ic_irq_enable(UART_1_IRQ_INTERRUPT_CONTROLLER_ID, UART_1_IRQ);
}

int main()
{

	printf("\n\nSending from UART 0 TX0 to UART 1 RX1!!!!!\n");
	InitUart();

	// Create simple data stream
unsigned char bb;
	unsigned char ch[4]={0}; //initialize
	int i = 0;
	while(1){
	ch[0]=100;
	ch[1]=25;
	ch[2]=5;
	ch[3]=6;
	for(i=0;i<4;i++){
		bb = ch[i];

		PutUart1(bb); // send data to UART 0

		}

	if(!EmptyUart2()){ // Check if UART 1 has content
	unsigned char cc = GetUart2();  //Collect data from UART 1
	printf("THIS IS FROM UART 0 %d\n", cc); // Print data out
	}
usleep(1000000); // for printf
	}


return 0;
}
