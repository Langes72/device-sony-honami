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

# Boot animation
TARGET_SCREEN_HEIGHT := 1940
TARGET_SCREEN_WIDTH := 1080

## Specify phone tech before including full_phone
$(call inherit-product, vendor/broken/config/gsm.mk)

# Inherit some common broken stuff.
$(call inherit-product, vendor/broken/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/broken/config/nfc_enhanced.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, device/sony/rhine/device.mk)
$(call inherit-product, vendor/sony/honami/honami-vendor.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, prebuilts/chromium/webview_prebuilt.mk)
$(call inherit-product-if-exists, vendor/google/products/gms.mk)

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/honami/overlay

PRODUCT_COPY_FILES += \
    device/sony/honami/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/sony/honami/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    device/sony/honami/rootdir/system/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf \
    device/sony/honami/rootdir/system/etc/sensors_calib.conf:system/etc/sensors_calib.conf

PRODUCT_NAME := broken_honami
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
