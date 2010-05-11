PRODUCT_NAME := avatar_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := passion
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_ID=EPE54B \
    BUILD_DISPLAY_ID=EPE54B \
    PRODUCT_NAME=passion \
    BUILD_VERSION_TAGS="ota-rel-keys,test-keys" \
    BUILD_FINGERPRINT="google/passion/passion/mahimahi:2.1-update1/ERE27/24178:user/release-keys" \
    PRIVATE_BUILD_DESC="passion-user 2.1-update1 ERE27 24178 release-keys" 

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=avatar \
    ro.modversion=distilled-0.133

TARGET_PREBUILT_KERNEL := vendor/htc/passion/kernel

PRODUCT_PACKAGES += \
    framework-res \
    AccountAndSyncSettings \
    ApplicationsProvider \
    Bluetooth \
    Browser \
    Calculator \
    Calendar \
    CalendarProvider \
    Camera \
    CertInstaller \
    Contacts \
    ContactsProvider \
    DeskClock \
    DownloadProvider \
    DrmProvider \
    Email \
    Gallery3D \
    GlobalSearch \
    GoogleSearch \
    HTMLViewer \
    LatinIME \
    Launcher2 \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    MediaProvider \
    Mms \
    Music \
    PackageInstaller \
    Phone \
    PicoTts \
    Provision \
    Settings \
    SettingsProvider \
    SoundRecorder \
    Stk \
    Superuser \
    Sync \
    TelephonyProvider \
    TtsService \
    UserDictionaryProvider \
    VisualizationWallpapers \
    VoiceDialer \
    VpnServices \
    libRS \
    librs_jni \
    lights.mahimahi \
    sensors.mahimahi

# misc
TARGET_OTA_SCRIPT_MODE := edify
TARGET_OTA_BACKUPTOO := true
USE_CAMERA_STUB := false
ENABLE_ANIMATED_GIF := true
PRODUCT_POLICY := android.policy_phone
KERNEL_MODULES_DIR := /system/lib/modules
TINY_TOOLBOX := true
WITH_WINDOWS_MEDIA := true

# sounds
include frameworks/base/data/sounds/OriginalAudio.mk
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    vendor/avatar/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/avatar/prebuilt/etc/dnsmasq.conf:system/etc/dnsmasq.conf \
    vendor/avatar/prebuilt/etc/resolv.conf:system/etc/resolv.conf \
    vendor/avatar/prebuilt/bin/fix_permissions:system/bin/fix_permissions \
    vendor/avatar/prebuilt/xbin/busybox:system/xbin/busybox \
    vendor/avatar/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_LOCALES := \
    en_US \
    de_AT \
    de_CH \
    de_DE \
    en_GB \
    fr_FR \
    hdpi

include vendor/htc/passion/device_passion.mk
