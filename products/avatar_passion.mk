#$(call inherit-product, build/target/product/generic.mk)

PRODUCT_POLICY := android.policy_phone


PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=avatar


PRODUCT_PACKAGES += \
    framework-res \
    AccountAndSyncSettings \
    AlarmClock \
    AlarmProvider \
    Bluetooth \
    Browser \
    Calculator \
    Calendar \
    Camera \
    CertInstaller \
    Contacts \
    DrmProvider \
    Email \
    Gallery \
    Launcher \
    HTMLViewer \
    Mms \
    Music \
    Settings \
    Sync \
    Updater \
    CalendarProvider \
    SyncProvider \
    Provision \
    GoogleSearch \
    LatinIME \
    Phone \
    ApplicationsProvider \
    ContactsProvider \
    DownloadProvider \
    MediaProvider \
    PicoTts \
    SettingsProvider \
    TelephonyProvider \
    TtsService \
    VpnServices \
    UserDictionaryProvider \
    PackageInstaller \
    Bugreport \
    sensors.mahimahi \
    lights.mahimahi


PRODUCT_MANUFACTURER := htc
PRODUCT_NAME := nexusone
PRODUCT_DEVICE := passion 
PRODUCT_BRAND := aosp
PRODUCT_MODEL := "Nexus One"


# media profiles and capabilities spec
$(call inherit-product, vendor/avatar/products/nexusone/media_profiles.mk)
$(call inherit-product, vendor/avatar/products/nexusone/media_a1026.mk)
# stuff common to all HTC phones
$(call inherit-product, vendor/avatar/products/nexusone/common.mk)


# WARNING: the most specific overlay goes first
DEVICE_PACKAGE_OVERLAYS := vendor/avatar/products/nexusone/overlay


# kernel (comes before PRODUCT_COPY_FILES)
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := vendor/avatar/nexusone/products/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    vendor/avatar/products/nexusone/media_profiles.xml:system/etc/media_profiles.xml \
    vendor/avatar/products/nexusone/mahimahi-keypad.kl:system/usr/keylayout/mahimahi-keypad.kl \
    vendor/avatar/products/nexusone/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    vendor/avatar/products/nexusone/vold.fstab:system/etc/vold.fstab \
    vendor/avatar/products/nexusone/init.mahimahi.rc:root/init.mahimahi.rc \
    vendor/avatar/products/nexusone/bcm4329.ko:system/lib/modules/bcm4329.ko \
    vendor/avatar/products/nexusone/gps.conf_US:system/etc/gps.conf \
    $(LOCAL_KERNEL):kernel


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Passion uses high-density artwork where available
PRODUCT_LOCALES += hdpi


# Pick up some sounds
include frameworks/base/data/sounds/OriginalAudio.mk
include frameworks/base/data/sounds/AudioPackage4.mk

