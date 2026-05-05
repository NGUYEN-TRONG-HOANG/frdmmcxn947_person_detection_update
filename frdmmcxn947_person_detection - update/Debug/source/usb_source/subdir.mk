################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/usb_source/fsl_component_generic_list.c \
../source/usb_source/fsl_os_abstraction_bm.c \
../source/usb_source/usb_device_cdc_acm.c \
../source/usb_source/usb_device_ch9.c \
../source/usb_source/usb_device_class.c \
../source/usb_source/usb_device_dci.c \
../source/usb_source/usb_device_descriptor.c \
../source/usb_source/usb_device_ehci.c \
../source/usb_source/usb_device_khci.c \
../source/usb_source/usb_phy.c \
../source/usb_source/virtual_com.c 

C_DEPS += \
./source/usb_source/fsl_component_generic_list.d \
./source/usb_source/fsl_os_abstraction_bm.d \
./source/usb_source/usb_device_cdc_acm.d \
./source/usb_source/usb_device_ch9.d \
./source/usb_source/usb_device_class.d \
./source/usb_source/usb_device_dci.d \
./source/usb_source/usb_device_descriptor.d \
./source/usb_source/usb_device_ehci.d \
./source/usb_source/usb_device_khci.d \
./source/usb_source/usb_phy.d \
./source/usb_source/virtual_com.d 

OBJS += \
./source/usb_source/fsl_component_generic_list.o \
./source/usb_source/fsl_os_abstraction_bm.o \
./source/usb_source/usb_device_cdc_acm.o \
./source/usb_source/usb_device_ch9.o \
./source/usb_source/usb_device_class.o \
./source/usb_source/usb_device_dci.o \
./source/usb_source/usb_device_descriptor.o \
./source/usb_source/usb_device_ehci.o \
./source/usb_source/usb_device_khci.o \
./source/usb_source/usb_phy.o \
./source/usb_source/virtual_com.o 


# Each subdirectory must supply rules for building sources it contributes
source/usb_source/%.o: ../source/usb_source/%.c source/usb_source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__NEWLIB__ -DPRINTF_FLOAT_ENABLE -DCPU_MCXN947VDF -DCPU_MCXN947VDF_cm33 -DCPU_MCXN947VDF_cm33_core0 -DSDK_DEBUGCONSOLE_UART -DARM_MATH_CM33 -D__FPU_PRESENT=1 -DTF_LITE_STATIC_MEMORY -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DLCD_IMPL_FLEXIO=1 -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\source" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\source\usb_source" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\source\font" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\utilities" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\eiq\tensorflow-lite" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\eiq\tensorflow-lite\third_party\flatbuffers\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\eiq\tensorflow-lite\third_party\gemmlowp" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\component\lists" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\component\uart" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\drivers" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\device" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\startup" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\eiq\tensorflow-lite\tensorflow\lite\micro\kernels\neutron" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\eiq\tensorflow-lite\third_party\ruy" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\CMSIS" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\eiq\tensorflow-lite\third_party\neutron\common\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\eiq\tensorflow-lite\third_party\neutron\driver\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\source\image" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\source\model" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\board" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection\source\video" -O3 -fno-common -g3 -gdwarf-4 -Wall -Wno-strict-aliasing -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source-2f-usb_source

clean-source-2f-usb_source:
	-$(RM) ./source/usb_source/fsl_component_generic_list.d ./source/usb_source/fsl_component_generic_list.o ./source/usb_source/fsl_os_abstraction_bm.d ./source/usb_source/fsl_os_abstraction_bm.o ./source/usb_source/usb_device_cdc_acm.d ./source/usb_source/usb_device_cdc_acm.o ./source/usb_source/usb_device_ch9.d ./source/usb_source/usb_device_ch9.o ./source/usb_source/usb_device_class.d ./source/usb_source/usb_device_class.o ./source/usb_source/usb_device_dci.d ./source/usb_source/usb_device_dci.o ./source/usb_source/usb_device_descriptor.d ./source/usb_source/usb_device_descriptor.o ./source/usb_source/usb_device_ehci.d ./source/usb_source/usb_device_ehci.o ./source/usb_source/usb_device_khci.d ./source/usb_source/usb_device_khci.o ./source/usb_source/usb_phy.d ./source/usb_source/usb_phy.o ./source/usb_source/virtual_com.d ./source/usb_source/virtual_com.o

.PHONY: clean-source-2f-usb_source

