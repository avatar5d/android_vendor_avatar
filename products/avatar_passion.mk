#
# Copyright (C) 2009 The Android Open Source Project
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

############################
# hdpi
############################

TARGET_OTA_SCRIPT_MODE=edify

# build/target/product.core.mk
PRODUCT_POLICY := android.policy_phone

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=avatarmod

PRODUCT_PACKAGES += \
    framework-res \
    Browser \
    Contacts \
    Launcher \
    HTMLViewer \
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
    Bugreport
# end core.mk

# build/target/product/generic.mk
PRODUCT_PACKAGES += \
    AccountAndSyncSettings \
    AlarmClock \
    AlarmProvider \
    Bluetooth \
    Calculator \
    Calendar \
    Camera \
    CertInstaller \
    DrmProvider \
    Email \
    Gallery \
    Mms \
    Music \
    Settings \
    Sync \
    Updater \
    CalendarProvider \
    SyncProvider
# end generic.mk

USE_CAMERA_STUB := false

# Let's grab the hdpi versions of apps and some extras
PRODUCT_PACKAGES += \
    DeskClock \
    DownloadProvider \
    Gallery3D \
    GlobalSearch \
    Launcher2 \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    SoundRecorder \
    VisualizationWallpapers \
    VoiceDialer \
    libRS \
    librs_jni

PRODUCT_PACKAGES += Superuser 

PRODUCT_PACKAGE_OVERLAYS := vendor/avatar/overlay

# Build WebKit with V8
#JS_ENGINE:=v8

# Enable animated GIF in WebKit
ENABLE_ANIMATED_GIF:=true

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Pick up some sounds
include frameworks/base/data/sounds/OriginalAudio.mk
include frameworks/base/data/sounds/AudioPackage4.mk

TARGET_OTA_BACKUPTOOL=True

PRODUCT_COPY_FILES += \
    vendor/avatar/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/avatar/prebuilt/common/etc/dnsmasq.conf:system/etc/dnsmasq.conf \
    vendor/avatar/prebuilt/common/etc/e2fsck.conf:system/etc/e2fsck.conf \
    vendor/avatar/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/avatar/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/avatar/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/avatar/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/avatar/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/avatar/prebuilt/common/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    vendor/avatar/prebuilt/common/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd \
    vendor/avatar/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/avatar/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    vendor/avatar/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/avatar/prebuilt/common/bin/usb-tether:system/bin/usb-tether \
    vendor/avatar/prebuilt/common/bin/shutdown:system/bin/shutdown \
    vendor/avatar/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/avatar/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/avatar/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh \
    vendor/avatar/prebuilt/common/xbin/dropbear-keygen:system/xbin/dropbear-keygen

# Various prebuilt stuff that hasen't been android-ized yet
PRODUCT_COPY_FILES += \
    vendor/avatar/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    vendor/avatar/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/avatar/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/avatar/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/avatar/prebuilt/common/etc/profile:system/etc/profile \
    vendor/avatar/prebuilt/common/xbin/bash:system/xbin/bash \
    vendor/avatar/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/avatar/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/avatar/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/avatar/prebuilt/common/xbin/nano:system/xbin/nano \
    vendor/avatar/prebuilt/common/xbin/powertop:system/xbin/powertop

PRODUCT_PACKAGES += \
    Provision \
    GoogleSearch \
    LatinIME

PRODUCT_LOCALES := \
    en_US \
    ar_EG \
    ar_IL \
    bg_BG \
    ca_ES \
    cs_CZ \
    da_DK \
    de_AT \
    de_CH \
    de_DE \
    de_LI \
    el_GR \
    en_AU \
    en_CA \
    en_GB \
    en_IE \
    en_IN \
    en_NZ \
    en_SG \
    en_ZA \
    es_ES \
    es_US \
    fi_FI \
    fr_BE \
    fr_CA \
    fr_CH \
    fr_FR \
    he_IL \
    hi_IN \
    hr_HR \
    hu_HU \
    id_ID \
    it_CH \
    it_IT \
    iw_IL \
    ja_JP \
    ko_KR \
    lt_LT \
    lv_LV \
    nb_NO \
    nl_BE \
    nl_NL \
    pl_PL \
    pt_BR \
    pt_PT \
    ro_RO \
    ru_RU \
    sk_SK \
    sl_SI \
    sr_RS \
    sv_SE \
    th_TH \
    tl_PH \
    tr_TR \
    uk_UA \
    vi_VN \
    zh_CN \
    zh_TW \
    hdpi

############################
# end hdpi
############################

PRODUCT_NAME := avatar_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=EPE54B BUILD_DISPLAY_ID=EPE54B PRODUCT_NAME=passion BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.1-update1/ERE27/24178:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.1-update1 ERE27 24178 release-keys"

PRODUCT_COPY_FILES +=  \
    vendor/avatar/prebuilt/passion/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGES += \
    Stk

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=avatarmod-0.0.1

TARGET_PREBUILT_KERNEL := vendor/htc/passion/kernel

include vendor/htc/passion/device_passion.mk
