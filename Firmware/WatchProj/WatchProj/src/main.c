#include <asf.h>

int main (void)
{
	//sysclk_init();
	board_init();
	ioport_init();
	
	ioport_set_port_dir(0, GPIO_PA02, IOPORT_DIR_OUTPUT);
	//ioport_set_port_mode(LED_PORT, EXAMPLE_BUTTON_MASK,	IOPORT_MODE_PULLUP);

	/* Set LED IOPORTs high */
	
	while (1) {
		ioport_set_port_level(0, GPIO_PA02, IOPORT_PIN_LEVEL_LOW);
		//delay_ms(1000);
		ioport_set_port_level(0, GPIO_PA02, IOPORT_PIN_LEVEL_HIGH);
		//delay_ms(1000);
	}
}
