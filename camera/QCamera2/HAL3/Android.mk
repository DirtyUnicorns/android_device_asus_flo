LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        QCamera3Factory.cpp \
        QCamera3Hal.cpp \
        QCamera3HWI.cpp \
        QCamera3Mem.cpp \
        QCamera3Stream.cpp \
        QCamera3Channel.cpp \
        QCamera3PostProc.cpp \
        ../util/QCameraCmdThread.cpp \
        ../util/QCameraQueue.cpp

LOCAL_CFLAGS := -Wall -Werror
LOCAL_CFLAGS += -DHAS_MULTIMEDIA_HINTS

LOCAL_C_INCLUDES := \
        $(LOCAL_PATH)/../stack/common \
        frameworks/native/include/media/openmax \
        frameworks/native/include \
        frameworks/av/include \
        hardware/qcom/media/msm8974/libstagefrighthw \
        system/media/camera/include \
        $(LOCAL_PATH)/../../mm-image-codec/qexif \
        $(LOCAL_PATH)/../../mm-image-codec/qomx_core \
        $(LOCAL_PATH)/../util

ifneq ($(filter msm8974 msm8x74,$(TARGET_BOARD_PLATFORM)),)
LOCAL_C_INCLUDES += \
        hardware/qcom/display/msm8974/libgralloc
else
LOCAL_C_INCLUDES += \
        hardware/qcom/display/msm8960/libgralloc
endif

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES  := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_SHARED_LIBRARIES := libcamera_client liblog libhardware libutils libcutils libdl
LOCAL_SHARED_LIBRARIES += libmmcamera_interface libmmjpeg_interface libui libcamera_metadata

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.$(TARGET_DEVICE)
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)
