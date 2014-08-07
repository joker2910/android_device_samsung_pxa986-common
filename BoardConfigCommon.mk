# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from marvell-common
-include device/samsung/marvell-common/BoardConfigCommon.mk

BOARD_VENDOR := samsung

# Platform
TARGET_BOARD_PLATFORM := mrvl
TARGET_CPU_VARIANT := cortex-a9

# Architecture
TARGET_CPU_SMP := true

# Flags for Krait CPU
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Marvell configuration
BOARD_EGL_CFG := device/samsung/pxa986-common/configs/egl.cfg

# Wifi driver
BOARD_HAVE_MARVELL_WIFI          := true
BOARD_WLAN_DEVICE                := mrvl
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WIFI_EXT_MODULE_PATH             := "/system/lib/modules/mlan.ko"
WIFI_EXT_MODULE_NAME             := "mlan"
WIFI_EXT_MODULE_ARG              := ""
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/sd8xxx.ko"
WIFI_DRIVER_MODULE_NAME	         := "sd8xxx"
WIFI_DRIVER_MODULE_ARG           := "drv_mode=5 cfg80211_wext=12 sta_name=wlan uap_name=wlan wfd_name=p2p fw_name=mrvl/sd8787_uapsta.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/proc/mwlan/config"
WIFI_DRIVER_FW_PATH_STA          := "drv_mode=5"
WIFI_DRIVER_FW_PATH_AP           := "drv_mode=6"
WIFI_DRIVER_FW_PATH_P2P          := "drv_mode=5"

# MRVL
BOARD_USES_MRVL_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMRVL_HARDWARE

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 17
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun%d/file"

# Audio
BOARD_USES_ALSA_AUDIO := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/pxa986-common/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    device.te \
    file_contexts
