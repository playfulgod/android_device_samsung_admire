# Copyright (C) 2011 The Android Open Source Project
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
#

DEVICE_PACKAGE_OVERLAYS += device/samsung/admire/overlay

PRODUCT_PACKAGES += \
    copybit.admire \
    gps.admire \
    gralloc.admire \
    libOmxCore \
    lights.msm7k \
    rzscontrol \
    screencap \
    setup_fs

# Recovery tools
PRODUCT_PACKAGES += \
    dump_image \
    e2fsck \
    erase_image \
    flash_image \
    make_ext4fs

# Service Mode Secret Code
PRODUCT_PACKAGES += \
    SamsungServiceMode

# MADTeam modifications
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/bin/madconfig:system/bin/madconfig

# Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Kernel modules
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/modules/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/admire/prebuilt/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/admire/prebuilt/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/admire/prebuilt/modules/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/admire/prebuilt/modules/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/admire/prebuilt/modules/sec_param.ko:root/lib/modules/sec_param.ko

# Board-specific init & scripts
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/init.admire.rc:root/init.rc \
    device/samsung/admire/prebuilt/ueventd.admire.rc:root/ueventd.rc

# Workaround for wifi & bluetooth mac addresses
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/admire/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/admire/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf

# VOLD configuration
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/etc/vold.fstab:system/etc/vold.fstab
    
# Media profiles
#PRODUCT_COPY_FILES += \
#    device/samsung/admire/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/admire/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# memory twaks
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/bin/lowmemvalue:system/bin/lowmemvalue \
    device/samsung/admire/prebuilt/bin/toggleshutter:system/bin/toggleshutter \
    device/samsung/admire/prebuilt/99mebitweaks:system/etc/init.d/99mebitweaks

# Enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
     ro.com.google.locationfeatures=1 \
     ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# MetroPCS
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/admire/prebuilt/etc/cdma-carriers-conf.xml:system/etc/cdma-carriers-conf.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.csc.sales_code=MTR \
	ril.sales_code=MTR \
	ro.com.google.clientidbase=android-samsung \
	ro.com.google.clientidbase.yt=android-samsung \
	ro.com.google.clientidbase.am=android-samsung \
	ro.com.google.clientidbase.gmm=android-samsung \
	ro.com.google.clientidbase.ms=android-metropcs-us

# RIL properties
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libargs=-d/dev/smd0 \
    rild.libpath=/system/lib/libsec-ril.so \
    ro.ril.samsung_cdma=true \
    ro.telephony.ril_class=samsung \
    ro.ril.def.agps.mode=2 \
    ro.cdma.home.operator.numeric=311660 \
    ro.cdma.home.operator.alpha=MetroPCS \
    net.cdma.pppd.authtype=require-chap \
    net.cdma.pppd.user=user[SPACE]MPCS \
    net.cdma.datalinkinterface=/dev/ttyCDMA0 \
    net.cdma.ppp.interface=ppp0 \
    net.connectivity.type=CDMA1 \
    net.interfaces.defaultroute=cdma \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.ril.def.preferred.network=0 \
    ro.telephony.default_network=0 \
    ro.cdma.voicemail.number=mine

# Keymap properties
#PRODUCT_PROPERTY_OVERRIDES += \
#    android.keychar.europa_keypad0=/system/usr/keychars/europa_keypad0.kcm.bin \
#    android.keylayout.europa_headset=/system/usr/keylayout/europa_headset.kl \
#    android.keylayout.europa_keypad0=/system/usr/keylayout/europa_keypad0.kl \
#    hw.keyboards.0.devname=europa_keypad0 \
#    hw.keyboards.65538.devname=europa_headset

# Networking properties
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=60

# Performance & graphics properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=24m \
    persist.sys.purgeable_assets=1 \
    persist.sys.use_dithering=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=160

# Compcache properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=0

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/admire/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/samsung/admire/admire-vendor.mk)

$(call inherit-product, build/target/product/full_base.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_eu_supl.mk)
PRODUCT_COPY_FILES += \
    device/samsung/admire/prebuilt/etc/gps.conf:system/etc/gps.conf

# LDPI assets
PRODUCT_LOCALES += ldpi mdpi

PRODUCT_NAME := generic_admire
PRODUCT_DEVICE := admire
PRODUCT_MODEL := admire
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
