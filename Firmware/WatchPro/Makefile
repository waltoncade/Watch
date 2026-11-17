# WatchPro firmware - command-line build for VS Code (mirrors Atmel Studio "Debug" config in WatchPro.cproj)
# Uses the ARM GCC and GNU make that ship with Atmel Studio 7. Run from Firmware\WatchPro:
#   "C:\Program Files (x86)\Atmel\Studio\7.0\shellutils\make.exe"          -> build
#   ... make.exe flash   -> chip erase + program + verify + reset via Atmel-ICE (SWD)
#   ... make.exe clean

PROJECT    := WatchPro
DEVICE     := atsam4ls2a
TOOL       := atmelice
INTERFACE  := swd

ATMEL      := C:/Program Files (x86)/Atmel/Studio/7.0
TOOLBIN    := $(ATMEL)/toolchain/arm/arm-gnu-toolchain/bin
CC         := "$(TOOLBIN)/arm-none-eabi-gcc.exe"
OBJCOPY    := "$(TOOLBIN)/arm-none-eabi-objcopy.exe"
OBJDUMP    := "$(TOOLBIN)/arm-none-eabi-objdump.exe"
SIZE       := "$(TOOLBIN)/arm-none-eabi-size.exe"
ATPROGRAM  := "$(ATMEL)/atbackend/atprogram.exe"
MKDIR      := "$(ATMEL)/shellutils/mkdir.exe" -p
RM         := "$(ATMEL)/shellutils/rm.exe" -rf

PRJ        := WatchPro
BUILD      := build
OBJDIR     := $(BUILD)/obj
ELF        := $(BUILD)/$(PROJECT).elf

SRCS := \
  $(PRJ)/src/main.c \
  $(PRJ)/src/ASF/common/boards/user_board/init.c \
  $(PRJ)/src/ASF/common/services/clock/sam4l/dfll.c \
  $(PRJ)/src/ASF/common/services/clock/sam4l/osc.c \
  $(PRJ)/src/ASF/common/services/clock/sam4l/pll.c \
  $(PRJ)/src/ASF/common/services/clock/sam4l/sysclk.c \
  $(PRJ)/src/ASF/common/services/delay/sam/cycle_counter.c \
  $(PRJ)/src/ASF/common/services/sleepmgr/sam4l/sleepmgr.c \
  $(PRJ)/src/ASF/common/utils/interrupt/interrupt_sam_nvic.c \
  $(PRJ)/src/ASF/sam/drivers/ast/ast.c \
  $(PRJ)/src/ASF/sam/drivers/bpm/bpm.c \
  $(PRJ)/src/ASF/sam/drivers/flashcalw/flashcalw.c \
  $(PRJ)/src/ASF/sam/drivers/gpio/gpio.c \
  $(PRJ)/src/ASF/sam/utils/cmsis/sam4l/source/templates/exceptions.c \
  $(PRJ)/src/ASF/sam/utils/cmsis/sam4l/source/templates/gcc/startup_sam4l.c \
  $(PRJ)/src/ASF/sam/utils/cmsis/sam4l/source/templates/system_sam4l.c \
  $(PRJ)/src/ASF/sam/utils/syscalls/gcc/syscalls.c

INCDIRS := \
  src/ASF/common/boards src/ASF/sam/utils src/ASF/sam/utils/header_files \
  src/ASF/sam/utils/preprocessor src/ASF/thirdparty/CMSIS/Include \
  src/ASF/thirdparty/CMSIS/Lib/GCC src/ASF/common/utils \
  src/ASF/sam/utils/cmsis/sam4l/include src/ASF/sam/utils/cmsis/sam4l/source/templates \
  src/ASF/common/boards/user_board src src/config \
  src/ASF/sam/drivers/ast src/ASF/sam/drivers/bpm src/ASF/sam/drivers/flashcalw \
  src/ASF/common/services/clock src/ASF/common/services/delay \
  src/ASF/common/services/sleepmgr src/ASF/sam/drivers/gpio src/ASF/common/services/ioport

DEFS := -D__SAM4LS2A__ -D__ATSAM4LS2A__ -DDEBUG -Dscanf=iscanf -Dprintf=iprintf \
        -DBOARD=USER_BOARD -DARM_MATH_CM4=true

CFLAGS := -x c -mthumb -mcpu=cortex-m4 $(DEFS) $(addprefix -I$(PRJ)/,$(INCDIRS)) \
  -O1 -g3 -fdata-sections -ffunction-sections -mlong-calls -pipe -fno-strict-aliasing -std=gnu99 \
  -Wall -Wstrict-prototypes -Wmissing-prototypes -Werror-implicit-function-declaration -Wpointer-arith \
  -Wchar-subscripts -Wcomment -Wformat=2 -Wimplicit-int -Wmain -Wparentheses -Wsequence-point \
  -Wreturn-type -Wswitch -Wtrigraphs -Wunused -Wuninitialized -Wunknown-pragmas -Wfloat-equal -Wundef \
  -Wshadow -Wbad-function-cast -Wwrite-strings -Wsign-compare -Waggregate-return -Wmissing-declarations \
  -Wformat -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls \
  -Wnested-externs -Wlong-long -Wunreachable-code -Wcast-align --param max-inline-insns-single=500 \
  -MD -MP

LDSCRIPT := $(PRJ)/src/ASF/sam/utils/linker_scripts/sam4l/sam4l2/gcc/flash.ld
LDFLAGS  := -mthumb -mcpu=cortex-m4 -Wl,-Map=$(BUILD)/$(PROJECT).map -Wl,--gc-sections \
            -Wl,--entry=Reset_Handler -Wl,--cref -T$(LDSCRIPT) -L$(PRJ)/src/ASF/thirdparty/CMSIS/Lib/GCC
LIBS     := -Wl,--start-group -larm_cortexM4l_math -lm -Wl,--end-group

OBJS := $(patsubst $(PRJ)/%.c,$(OBJDIR)/%.o,$(SRCS))

.PHONY: all clean flash erase reset info size

all: $(BUILD)/$(PROJECT).hex $(BUILD)/$(PROJECT).bin $(BUILD)/$(PROJECT).lss size

$(OBJDIR)/%.o: $(PRJ)/%.c
	@$(MKDIR) $(dir $@)
	@echo CC  $<
	@$(CC) $(CFLAGS) -c -o $@ $<

$(ELF): $(OBJS) $(LDSCRIPT)
	@echo LD  $@
	@$(CC) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)

$(BUILD)/$(PROJECT).hex: $(ELF)
	@$(OBJCOPY) -O ihex -R .eeprom -R .fuse -R .lock -R .signature $< $@

$(BUILD)/$(PROJECT).bin: $(ELF)
	@$(OBJCOPY) -O binary $< $@

$(BUILD)/$(PROJECT).lss: $(ELF)
	@$(OBJDUMP) -h -S $< > $@

size: $(ELF)
	@$(SIZE) $<

flash: all
	$(ATPROGRAM) -t $(TOOL) -i $(INTERFACE) -d $(DEVICE) chiperase program -f $(ELF) --verify
	$(ATPROGRAM) -t $(TOOL) -i $(INTERFACE) -d $(DEVICE) reset

erase:
	$(ATPROGRAM) -t $(TOOL) -i $(INTERFACE) -d $(DEVICE) chiperase

reset:
	$(ATPROGRAM) -t $(TOOL) -i $(INTERFACE) -d $(DEVICE) reset

info:
	$(ATPROGRAM) -t $(TOOL) -i $(INTERFACE) -d $(DEVICE) info

clean:
	$(RM) $(BUILD)

-include $(OBJS:.o=.d)
