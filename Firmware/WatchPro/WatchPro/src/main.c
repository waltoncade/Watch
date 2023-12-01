/**
 * \file
 *
 * \brief Empty user application template
 *
 */

/**
 * \mainpage User Application template doxygen documentation
 *
 * \par Empty user application template
 *
 * Bare minimum empty user application template
 *
 * \par Content
 *
 * -# Include the ASF header files (through asf.h)
 * -# "Insert system clock initialization code here" comment
 * -# Minimal main function that starts with a call to board_init()
 * -# "Insert application code here" comment
 *
 */

/*
 * Include header files for all drivers that have been imported from
 * Atmel Software Framework (ASF).
 */
/*
 * Support and FAQ: visit <a href="https://www.microchip.com/support/">Microchip Support</a>
 */
#include <asf.h>

/* Global ul_ms_ticks in milliseconds since start of application */
volatile uint32_t ul_ms_ticks = 0;

static void mdelay(uint32_t ul_dly_ticks)
{
	uint32_t ul_cur_ticks;
	
	ul_cur_ticks = ul_ms_ticks;
	while ((ul_ms_ticks - ul_cur_ticks) < ul_dly_ticks) {
	}
}

void SysTick_Handler(void)
{
	ul_ms_ticks++;
}

int main (void)
{
	//sysclk_init();
	board_init();
	ioport_init();
	
	ioport_set_port_dir(0, GPIO_PA02, IOPORT_DIR_OUTPUT);
	ioport_set_port_dir(0, GPIO_PA09, IOPORT_DIR_OUTPUT);
	//ioport_set_port_mode(LED_PORT, EXAMPLE_BUTTON_MASK,	IOPORT_MODE_PULLUP);
	
	if (SysTick_Config(sysclk_get_cpu_hz() / 1000)) {
		while (1) {  /* Capture error */
		}
	}

	/* Set LED IOPORTs high */
	
	while (1) {
		ioport_set_port_level(0, GPIO_PA02, IOPORT_PIN_LEVEL_LOW);
		ioport_set_port_level(0, GPIO_PA09, IOPORT_PIN_LEVEL_HIGH);
		mdelay(1000);
		ioport_set_port_level(0, GPIO_PA09, IOPORT_PIN_LEVEL_LOW);
		ioport_set_port_level(0, GPIO_PA02, IOPORT_PIN_LEVEL_HIGH);
		mdelay(1000);
	}
}
