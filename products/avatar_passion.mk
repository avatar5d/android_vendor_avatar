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
    ro.rommanager.developerid=avatarmod \
    ro.modversion=avatarmod-0.0.1

TARGET_PREBUILT_KERNEL := vendor/htc/passion/kernel

PRODUCT_PACKAGES += \
    framework-res \
    AccountAndSyncSettings \
    AlarmClock \
    AlarmProvider \
    ApplicationsProvider \
    Bluetooth \
    Browser \
    Bugreport \
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
    SyncProvider \
    TelephonyProvider \
    TtsService \
    Updater \
    UserDictionaryProvider \
    VisualizationWallpapers \
    VoiceDialer \
    VpnServices \
    libRS \
    librs_jni \
    lights.mahimahi \
    sensors.mahimahi

# misc
TARGET_OTA_SCRIPT_MODE:=edify
TARGET_OTA_BACKUPTOOL:=true
USE_CAMERA_STUB:=false
ENABLE_ANIMATED_GIF:=true
PRODUCT_POLICY:=android.policy_phone

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# sounds
include frameworks/base/data/sounds/OriginalAudio.mk
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    vendor/avatar/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/avatar/prebuilt/common/etc/dnsmasq.conf:system/etc/dnsmasq.conf \
    vendor/avatar/prebuilt/common/etc/e2fsck.conf:system/etc/e2fsck.conf \
    vendor/avatar/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/avatar/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/avatar/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    vendor/avatar/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \

# Various prebuilt stuff that hasen't been android-ized yet
PRODUCT_COPY_FILES += \
    vendor/avatar/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    vendor/avatar/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/avatar/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/avatar/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/avatar/prebuilt/common/xbin/bash:system/xbin/bash \
    vendor/avatar/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/avatar/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/avatar/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/avatar/prebuilt/common/xbin/nano:system/xbin/nano \
    vendor/avatar/prebuilt/common/xbin/powertop:system/xbin/powertop

# Boot animation
PRODUCT_COPY_FILES +=  \
    vendor/avatar/prebuilt/passion/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_LOCALES := \
    en_US \
    de_AT \
    de_CH \
    de_DE \
    en_GB \
    fr_FR \
    hdpi

include vendor/htc/passion/device_passion.mk
