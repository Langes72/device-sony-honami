# Copyright 2014 The Android Open Source Project
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

TARGET_KERNEL_CONFIG := aosp_rhine_honami_defconfig

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/qcom/proprietary/msm8974aa/honami/Android.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Enhanced NFC
$(call inherit-product, vendor/pac/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/pac/config/common_full_phone.mk)

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/honami/overlay

# Device etc
PRODUCT_COPY_FILES += \
    device/sony/honami/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/sony/honami/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    device/sony/honami/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf

# Bootanimation
PRODUCT_COPY_FILES += \
   vendor/pac/prebuilt/common/media/bootanimation/1080.zip:system/media/bootanimation.zip

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.honami \
    init.honami \
    ueventd.honami

# Lights
PRODUCT_PACKAGES += \
    lights.honami

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.honami

# NFC
PRODUCT_PACKAGES += \
    nfc.honami

PRODUCT_NAME := pac_honami
PRODUCT_DEVICE := honami
PRODUCT_MODEL := Xperia Z1 (AOSP)
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony

PRODUCT_AAPT_CONFIG := large
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420 \
    ro.usb.pid_suffix=19E

PAC_BOOTANIMATION_NAME := 1080

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/rhine/platform.mk)
$(call inherit-product, vendor/sony/rhine-honami/honami-vendor.mk)
