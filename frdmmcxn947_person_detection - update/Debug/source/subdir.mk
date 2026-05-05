################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../source/demo_info.cpp \
../source/get_top_n.cpp \
../source/main.cpp \
../source/model.cpp \
../source/model_ops_npu.cpp \
../source/output_postproc.cpp \
../source/person_det.cpp \
../source/persondet_post_processing.cpp 

C_SRCS += \
../source/EZH_Camera.c \
../source/display.c \
../source/fsl_os_abstraction_bm.c \
../source/ov7670.c \
../source/semihost_hardfault.c \
../source/timer.c \
../source/usb_device_cdc_acm.c \
../source/usb_device_ch9.c \
../source/usb_device_class.c \
../source/usb_device_dci.c \
../source/usb_device_descriptor.c \
../source/usb_device_ehci.c \
../source/usb_device_khci.c \
../source/usb_phy.c \
../source/usb_video_stream.c \
../source/virtual_com.c 

S_SRCS += \
../source/model_data.s 

CPP_DEPS += \
./source/demo_info.d \
./source/get_top_n.d \
./source/main.d \
./source/model.d \
./source/model_ops_npu.d \
./source/output_postproc.d \
./source/person_det.d \
./source/persondet_post_processing.d 

C_DEPS += \
./source/EZH_Camera.d \
./source/display.d \
./source/fsl_os_abstraction_bm.d \
./source/ov7670.d \
./source/semihost_hardfault.d \
./source/timer.d \
./source/usb_device_cdc_acm.d \
./source/usb_device_ch9.d \
./source/usb_device_class.d \
./source/usb_device_dci.d \
./source/usb_device_descriptor.d \
./source/usb_device_ehci.d \
./source/usb_device_khci.d \
./source/usb_phy.d \
./source/usb_video_stream.d \
./source/virtual_com.d 

OBJS += \
./source/EZH_Camera.o \
./source/demo_info.o \
./source/display.o \
./source/fsl_os_abstraction_bm.o \
./source/get_top_n.o \
./source/main.o \
./source/model.o \
./source/model_data.o \
./source/model_ops_npu.o \
./source/output_postproc.o \
./source/ov7670.o \
./source/person_det.o \
./source/persondet_post_processing.o \
./source/semihost_hardfault.o \
./source/timer.o \
./source/usb_device_cdc_acm.o \
./source/usb_device_ch9.o \
./source/usb_device_class.o \
./source/usb_device_dci.o \
./source/usb_device_descriptor.o \
./source/usb_device_ehci.o \
./source/usb_device_khci.o \
./source/usb_phy.o \
./source/usb_video_stream.o \
./source/virtual_com.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__NEWLIB__ -DPRINTF_FLOAT_ENABLE -DCPU_MCXN947VDF -DCPU_MCXN947VDF_cm33 -DCPU_MCXN947VDF_cm33_core0 -DSDK_DEBUGCONSOLE_UART -DARM_MATH_CM33 -D__FPU_PRESENT=1 -DTF_LITE_STATIC_MEMORY -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DLCD_IMPL_FLEXIO=1 -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\source" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\source\font" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\utilities" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\flatbuffers\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\gemmlowp" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\component\lists" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\component\uart" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\drivers" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\device" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\startup" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\tensorflow\lite\micro\kernels\neutron" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\ruy" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\CMSIS" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\neutron\common\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\neutron\driver\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\source\image" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\source\model" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\board" -O3 -fno-common -g3 -gdwarf-4 -Wall -Wno-strict-aliasing -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -flto -ffat-lto-objects -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

source/%.o: ../source/%.cpp source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C++ Compiler'
	arm-none-eabi-c++ -std=gnu++11 -DCPU_MCXN947VDF -DPRINTF_FLOAT_ENABLE -DCPU_MCXN947VDF_cm33 -DCPU_MCXN947VDF_cm33_core0 -DSDK_DEBUGCONSOLE_UART -DARM_MATH_CM33 -D__FPU_PRESENT=1 -DTF_LITE_STATIC_MEMORY -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\utilities" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\flatbuffers\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\gemmlowp" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\component\lists" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\component\uart" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\drivers" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\device" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\startup" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\tensorflow\lite\micro\kernels\neutron" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\ruy" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\CMSIS" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\neutron\common\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\eiq\tensorflow-lite\third_party\neutron\driver\include" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\source\image" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\source\model" -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\board" -O3 -fno-common -g3 -gdwarf-4 -Wall -fno-rtti -fno-exceptions -Wno-sign-compare -Wno-strict-aliasing -Wno-deprecated-declarations -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

source/%.o: ../source/%.s source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU Assembler'
	arm-none-eabi-gcc -c -x assembler-with-cpp -D__NEWLIB__ -I"C:\Users\nth25\NXP\frdmmcxn947_person_detection - Copy\source" -g3 -gdwarf-4 -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/EZH_Camera.d ./source/EZH_Camera.o ./source/demo_info.d ./source/demo_info.o ./source/display.d ./source/display.o ./source/fsl_os_abstraction_bm.d ./source/fsl_os_abstraction_bm.o ./source/get_top_n.d ./source/get_top_n.o ./source/main.d ./source/main.o ./source/model.d ./source/model.o ./source/model_data.o ./source/model_ops_npu.d ./source/model_ops_npu.o ./source/output_postproc.d ./source/output_postproc.o ./source/ov7670.d ./source/ov7670.o ./source/person_det.d ./source/person_det.o ./source/persondet_post_processing.d ./source/persondet_post_processing.o ./source/semihost_hardfault.d ./source/semihost_hardfault.o ./source/timer.d ./source/timer.o ./source/usb_device_cdc_acm.d ./source/usb_device_cdc_acm.o ./source/usb_device_ch9.d ./source/usb_device_ch9.o ./source/usb_device_class.d ./source/usb_device_class.o ./source/usb_device_dci.d ./source/usb_device_dci.o ./source/usb_device_descriptor.d ./source/usb_device_descriptor.o ./source/usb_device_ehci.d ./source/usb_device_ehci.o ./source/usb_device_khci.d ./source/usb_device_khci.o ./source/usb_phy.d ./source/usb_phy.o ./source/usb_video_stream.d ./source/usb_video_stream.o ./source/virtual_com.d ./source/virtual_com.o

.PHONY: clean-source

