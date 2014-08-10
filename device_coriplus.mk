$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/coriplus/coriplus-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/coriplus/overlay

# Based on dhinesh77 sources - testing
# LDPI assets
PRODUCT_AAPT_CONFIG := normal ldpi mdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

# Based on dhinesh77 sources to reference- testing
# Init files
PRODUCT_COPY_FILES += \
	device/samsung/coriplus/init.rhea_ss_coriplus.rc:root/init.rhea_ss_coriplus.rc \
	device/samsung/coriplus/init.bcm2165x.usb.rc:root/init.bcm2165x.usb.rc \
	device/samsung/coriplus/init.log.rc:root/init.log.rc \
	device/samsung/coriplus/lpm.rc:root/lpm.rc \
	device/samsung/coriplus/ueventd.rhea_ss_coriplus.rc:root/ueventd.rhea_ss_coriplus.rc \
  device/samsung/coriplus/init.recovery.rhea_ss_coriplus.rc:root/init.recovery.rhea_ss_coriplus.rc \
	device/samsung/coriplus/fstab.rhea_ss_coriplus:root/fstab.rhea_ss_coriplus 

PRODUCT_COPY_FILES += \
	device/samsung/coriplus/vold.fstab:system/etc/vold.fstab 

# Based on dhinesh77 sources to reference- testing
# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/coriplus/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/coriplus/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	device/samsung/coriplus/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/coriplus/Generic.kl:system/usr/keylayout/Generic.kl \
	device/samsung/coriplus/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl 

# Based on dhinesh77 sources to reference- testing
# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs \
  make_ext4fs 

# Based on dhinesh77 sources to reference- testing
# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Based on dhinesh77 sources to reference- testing
# Misc other modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default

# Based on dhinesh77 sources to reference- testing
# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode 
	

# Based on dhinesh77 sources to reference- testing
# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Based on dhinesh77 sources to reference- testing
# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Based on dhinesh77 sources to reference- testing
# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungBCMRIL 

# Based on dhinesh77 sources to reference- testing
# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Based on dhinesh77 sources to reference- testing
# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Based on dhinesh77 sources to reference- testing
# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Based on dhinesh77 sources to reference- testing
# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240

# Based on dhinesh77 sources to reference- testing
# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# Based on dhinesh77 sources to reference- testing
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

LOCAL_PATH := device/samsung/coriplus
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_coriplus
PRODUCT_DEVICE := coriplus
