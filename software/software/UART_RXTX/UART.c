/* main UART functions for read/write operations.
 *
 */


#include "system.h"
#include "altera_avalon_uart_regs.h"


//creating RX TX buffers
#define RX_BUFFER_SIZE_1 1024
#define TX_BUFFER_SIZE_1 1024
#define RX_BUFFER_SIZE_2 1024
#define TX_BUFFER_SIZE_2 1024

// Creating head and tail
unsigned short TxHead_1=0;
unsigned short TxTail_1=0;
unsigned char tx_buffer_1[TX_BUFFER_SIZE_1];

unsigned short RxHead_1=0;
unsigned short RxTail_1=0;
unsigned char rx_buffer_1[RX_BUFFER_SIZE_1];

unsigned short TxHead_2=0;
unsigned short TxTail_2=0;
unsigned char tx_buffer_2[TX_BUFFER_SIZE_2];

unsigned short RxHead_2=0;
unsigned short RxTail_2=0;
unsigned char rx_buffer_2[RX_BUFFER_SIZE_2];


// initialize UART 1
void InitUart1(unsigned int BaudRate)
{
unsigned int divisor;

divisor = (ALT_CPU_FREQ/BaudRate) +1;
IOWR_ALTERA_AVALON_UART_DIVISOR(UART_0_BASE, divisor);
IOWR_ALTERA_AVALON_UART_CONTROL(UART_0_BASE, ALTERA_AVALON_UART_CONTROL_RRDY_MSK);
}

// initialize UART 2
void InitUart2(unsigned int BaudRate)
{
unsigned int divisor;

divisor = (ALT_CPU_FREQ/BaudRate) +1;
IOWR_ALTERA_AVALON_UART_DIVISOR(UART_0_BASE, divisor);
IOWR_ALTERA_AVALON_UART_CONTROL(UART_0_BASE, ALTERA_AVALON_UART_CONTROL_RRDY_MSK);
}




// Interrupt Service Routine for UART 1
void IsrUart1(void* context, unsigned int id)
{
int sr;

sr = IORD_ALTERA_AVALON_UART_STATUS(UART_0_BASE);
if(sr & ALTERA_AVALON_UART_STATUS_RRDY_MSK);
{
rx_buffer_1[RxHead_1] = IORD_ALTERA_AVALON_UART_RXDATA(UART_0_BASE);
IOWR_ALTERA_AVALON_UART_STATUS(UART_0_BASE, 0);
if (++RxHead_1 > (RX_BUFFER_SIZE_1-1)) RxHead_1 = 0;
}
if(sr & ALTERA_AVALON_UART_STATUS_TRDY_MSK)
{
if(IORD_ALTERA_AVALON_UART_CONTROL(UART_0_BASE) & ALTERA_AVALON_UART_CONTROL_TRDY_MSK);
{
if (TxTail_1 != TxHead_1)
{
IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, tx_buffer_1[TxTail_1]);
if (++TxTail_1 > (TX_BUFFER_SIZE_1 -1)) TxTail_1 = 0;
}
else IOWR_ALTERA_AVALON_UART_CONTROL(UART_0_BASE, ALTERA_AVALON_UART_CONTROL_RRDY_MSK);
}
}
}


// Interrupt Service Routine for UART 2
void IsrUart2(void* context, unsigned int id)
{
int sr;

sr = IORD_ALTERA_AVALON_UART_STATUS(UART_1_BASE);
if(sr & ALTERA_AVALON_UART_STATUS_RRDY_MSK);
{
rx_buffer_2[RxHead_2] = IORD_ALTERA_AVALON_UART_RXDATA(UART_1_BASE);
IOWR_ALTERA_AVALON_UART_STATUS(UART_1_BASE, 0);
if (++RxHead_2 > (RX_BUFFER_SIZE_2-1)) RxHead_2 = 0;
}
if(sr & ALTERA_AVALON_UART_STATUS_TRDY_MSK)
{
if(IORD_ALTERA_AVALON_UART_CONTROL(UART_1_BASE) & ALTERA_AVALON_UART_CONTROL_TRDY_MSK);
{
if (TxTail_2 != TxHead_2)
{
IOWR_ALTERA_AVALON_UART_TXDATA(UART_1_BASE, tx_buffer_2[TxTail_2]);
if (++TxTail_2 > (TX_BUFFER_SIZE_2 -1)) TxTail_2 = 0;
}
else IOWR_ALTERA_AVALON_UART_CONTROL(UART_1_BASE, ALTERA_AVALON_UART_CONTROL_RRDY_MSK);
}
}
}


// Check if UART 1 registers have data
unsigned char EmptyUart1()
{
if(RxHead_1 == RxTail_1) return 1;
return 0;
}

// Check if UART 2 registers have data
unsigned char EmptyUart2()
{
if(RxHead_2 == RxTail_2) return 1;
return 0;
}


// Collect data received by UART 1
unsigned char GetUart1(void)
{
unsigned char rxChar;

/* buffer is empty */

rxChar=rx_buffer_1[RxTail_1];
if (++RxTail_1 > (RX_BUFFER_SIZE_1-1)) RxTail_1=0;

return rxChar;
}


// Collect data received by UART 2
unsigned char GetUart2(void)
{
unsigned char rxChar;

/* buffer is empty */

rxChar=rx_buffer_2[RxTail_2];
if (++RxTail_2 > (RX_BUFFER_SIZE_2-1)) RxTail_2=0;

return rxChar;
}


//Send data using UART 1
unsigned char PutUart1(unsigned char in_char)
{
unsigned short size;
unsigned int z;

z = IORD_ALTERA_AVALON_UART_STATUS(UART_0_BASE) & ALTERA_AVALON_UART_STATUS_TRDY_MSK;

if ((TxHead_1==TxTail_1) && z) IOWR_ALTERA_AVALON_UART_TXDATA(UART_0_BASE, in_char);
else
{
if (TxHead_1 >= TxTail_1) size = TxHead_1 - TxTail_1;
else size = ((TX_BUFFER_SIZE_1-1) - TxTail_1) + TxHead_1;
if (size > (TX_BUFFER_SIZE_1 - 3)) return (-1);
tx_buffer_1[TxHead_1] = in_char;
if (++TxHead_1 > (TX_BUFFER_SIZE_1-1)) TxHead_1 = 0;
z = IORD_ALTERA_AVALON_UART_CONTROL(UART_0_BASE) | ALTERA_AVALON_UART_CONTROL_TRDY_MSK;
IOWR_ALTERA_AVALON_UART_CONTROL(UART_0_BASE, z);
}
return(1);
}


//Send data using UART 2
unsigned char PutUart2(unsigned char in_char)
{
unsigned short size;
unsigned int z;

z = IORD_ALTERA_AVALON_UART_STATUS(UART_1_BASE) & ALTERA_AVALON_UART_STATUS_TRDY_MSK;

if ((TxHead_2==TxTail_2) && z) IOWR_ALTERA_AVALON_UART_TXDATA(UART_1_BASE, in_char);
else
{
if (TxHead_2 >= TxTail_2) size = TxHead_2 - TxTail_2;
else size = ((TX_BUFFER_SIZE_2-1) - TxTail_2) + TxHead_2;
if (size > (TX_BUFFER_SIZE_2 - 3)) return (-1);
tx_buffer_2[TxHead_2] = in_char;
if (++TxHead_2 > (TX_BUFFER_SIZE_2-1)) TxHead_2 = 0;
z = IORD_ALTERA_AVALON_UART_CONTROL(UART_1_BASE) | ALTERA_AVALON_UART_CONTROL_TRDY_MSK;
IOWR_ALTERA_AVALON_UART_CONTROL(UART_1_BASE, z);
}
return(1);
}

