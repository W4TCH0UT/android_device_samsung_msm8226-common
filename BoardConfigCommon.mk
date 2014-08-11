#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

USE_CAMERA_STUB := true

BOARD_VENDOR := samsung-qcom

# inherit from the proprietary version
-include vendor/samsung/msm8226-common/BoardConfigVendor.mk
-include vendor/samsung/ms013g/BoardConfigVendor.mk

# Platform
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

-include device/samsung/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/msm8226-common

TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/ms013g
TARGET_KERNEL_CONFIG := VARIANT_DEFCONFIG=msm8226-sec_ms013g_eur_defconfig msm8226-sec_defconfig SELINUX_DEFCONFIG=selinux_defconfig
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
TARGET_KERNEL_SOURCE := kernel/samsung/ms013g
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/msm8226-common/mkbootimg.mk
TARGET_CUSTOM_DTBTOOL := dtbTool

# QCOM BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Audio
AUDIO_FEATURE_DISABLED_FM :=
AUDIO_FEATURE_DISABLED_SSR := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# GPS
TARGET_NO_RPC := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/config/egl.cfg
TARGET_DISPLAY_USE_RETIRE_FENCE :=
TARGET_QCOM_DISPLAY_VARIANT := caf-new

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_QCOM_MEDIA_VARIANT := caf-new

# Use qcom power hal
TARGET_POWERHAL_VARIANT := qcom

# Enable CPU boosting events in the power HAL
TARGET_USES_CPU_BOOST_HINT := true

TARGET_HW_DISK_ENCRYPTION := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := device/samsung/msm8226-common/cmhw/

# Assert
TARGET_OTA_ASSERT_DEVICE := g7102,g7105

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true

BOARD_HAS_NO_SELECT_BUTTON := true
