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

#
# This is the product configuration for a generic GSM,
# not specialized for any geography.
#

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/ace/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/ace/init.spade.rc:root/init.spade.rc \
    device/htc/ace/ueventd.spade.rc:root/ueventd.spade.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/ace/ace-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r8 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

DEVICE_PACKAGE_OVERLAYS += device/htc/ace/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/ace/media_profiles.xml:system/etc/media_profiles.xml

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/ace/spn-conf.xml:system/etc/spn-conf.xml \
    device/htc/ace/voicemail-conf.xml:system/etc/voicemail-conf.xml

PRODUCT_PACKAGES += \
    librs_jni \
    lights.spade \
    sensors.spade \
    gralloc.msm7x30 \
    overlay.default \
    gps.spade \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/ace/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/ace/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/ace/keychars/spade-keypad.kcm.bin:system/usr/keychars/spade-keypad.kcm.bin \
    device/htc/ace/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/ace/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/ace/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/ace/keylayout/spade-keypad.kl:system/usr/keylayout/spade-keypad.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/ace/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/ace/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/ace/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/ace/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/ace/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/ace/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/ace/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/ace/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/ace/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/ace/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/ace/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/ace/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/ace/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/ace/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/ace/dsp/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/ace/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/ace/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/ace/dsp/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/ace/dsp/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/ace/dsp/SPK_Combination.csv:system/etc/SPK_Combination.csv \
    device/htc/ace/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/ace/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/ace/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/ace/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/ace/dsp/soundimage/Sound_Dolby_A_HP.txt:system/etc/soundimage/Sound_Dolby_A_HP.txt \
    device/htc/ace/dsp/soundimage/Sound_Dolby_A_SPK.txt:system/etc/soundimage/Sound_Dolby_A_SPK.txt \
    device/htc/ace/dsp/soundimage/Sound_Dolby_V_HP.txt:system/etc/soundimage/Sound_Dolby_V_HP.txt \
    device/htc/ace/dsp/soundimage/Sound_Dolby_V_SPK.txt:system/etc/soundimage/Sound_Dolby_V_SPK.txt \
    device/htc/ace/dsp/soundimage/Sound_Dualmic.txt:system/etc/soundimage/Sound_Dualmic.txt \
    device/htc/ace/dsp/soundimage/Sound_Dualmic_EP.txt:system/etc/soundimage/Sound_Dualmic_EP.txt \
    device/htc/ace/dsp/soundimage/Sound_Dualmic_SPK.txt:system/etc/soundimage/Sound_Dualmic_SPK.txt \
    device/htc/ace/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/ace/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/ace/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/ace/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/ace/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/ace/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/ace/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/ace/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/ace/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/ace/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/ace/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/ace/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/ace/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/ace/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/ace/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt

# Additional NAM Audio DSP Profiles to NAM Package
PRODUCT_COPY_FILES += \
    device/htc/ace/nam/CodecDSPID.txt:system/etc/nam/CodecDSPID.txt \
    device/htc/ace/nam/Sound_Treble_Booster_MCLK.txt:system/etc/nam/Sound_Treble_Booster_MCLK.txt \
    device/htc/ace/nam/Sound_Vocal_Booster_MCLK.txt:system/etc/nam/Sound_Vocal_Booster_MCLK.txt \
    device/htc/ace/nam/Sound_SRS_A_SPK_MCLK.txt:system/etc/nam/Sound_SRS_A_SPK_MCLK.txt \
    device/htc/ace/nam/Sound_SRS_V_HP_MCLK.txt:system/etc/nam/Sound_SRS_V_HP_MCLK.txt \
    device/htc/ace/nam/Sound_SRS_V_SPK_MCLK.txt:system/etc/nam/Sound_SRS_V_SPK_MCLK.txt \
    device/htc/ace/nam/Sound_Jazz_MCLK.txt:system/etc/nam/Sound_Jazz_MCLK.txt \
    device/htc/ace/nam/Sound_Latin_MCLK.txt:system/etc/nam/Sound_Latin_MCLK.txt \
    device/htc/ace/nam/Sound_New_Age_MCLK.txt:system/etc/nam/Sound_New_Age_MCLK.txt \
    device/htc/ace/nam/Sound_Original_MCLK.txt:system/etc/nam/Sound_Original_MCLK.txt \
    device/htc/ace/nam/Sound_Piano_MCLK.txt:system/etc/nam/Sound_Piano_MCLK.txt \
    device/htc/ace/nam/Sound_Pop_MCLK.txt:system/etc/nam/Sound_Pop_MCLK.txt \
    device/htc/ace/nam/Sound_R_B_MCLK.txt:system/etc/nam/Sound_R_B_MCLK.txt \
    device/htc/ace/nam/Sound_Rock_MCLK.txt:system/etc/nam/Sound_Rock_MCLK.txt \
    device/htc/ace/nam/Sound_SRS_A_HP_MCLK.txt:system/etc/nam/Sound_SRS_A_HP_MCLK.txt \
    device/htc/ace/nam/Sound_Dualmic_SPK_MCLK.txt:system/etc/nam/Sound_Dualmic_SPK_MCLK.txt \
    device/htc/ace/nam/Sound_Dualmic_EP_MCLK.txt:system/etc/nam/Sound_Dualmic_EP_MCLK.txt \
    device/htc/ace/nam/Sound_Dualmic_MCLK.txt:system/etc/nam/Sound_Dualmic_MCLK.txt \
    device/htc/ace/nam/Sound_Dolby_A_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_A_SPK_MCLK.txt \
    device/htc/ace/nam/Sound_Dolby_HP_MCLK.txt:system/etc/nam/Sound_Dolby_HP_MCLK.txt \
    device/htc/ace/nam/Sound_Dolby_Spk_MCLK.txt:system/etc/nam/Sound_Dolby_Spk_MCLK.txt \
    device/htc/ace/nam/Sound_Dolby_V_HP_MCLK.txt:system/etc/nam/Sound_Dolby_V_HP_MCLK.txt \
    device/htc/ace/nam/Sound_Dolby_V_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_V_SPK_MCLK.txt \
    device/htc/ace/nam/Sound_Dolby_A_HP_MCLK.txt:system/etc/nam/Sound_Dolby_A_HP_MCLK.txt \
    device/htc/ace/nam/Sound_Bass_Booster_MCLK.txt:system/etc/nam/Sound_Bass_Booster_MCLK.txt \
    device/htc/ace/nam/Sound_Blues_MCLK.txt:system/etc/nam/Sound_Blues_MCLK.txt \
    device/htc/ace/nam/Sound_Classical_MCLK.txt:system/etc/nam/Sound_Classical_MCLK.txt \
    device/htc/ace/nam/Sound_Country_MCLK.txt:system/etc/nam/Sound_Country_MCLK.txt

# Alternate NAM gps.conf to NAM package
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/nam/gps.conf
    
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# ace uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/htc/ace/vold.fstab:system/etc/vold.fstab

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/ace/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/ace/bcm4329.ko:system/lib/modules/bcm4329.ko

$(call inherit-product-if-exists, vendor/htc/ace/ace-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/ace/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/ace/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := htc_ace
PRODUCT_DEVICE := ace
PRODUCT_MODEL := HTC Desire HD
PRODUCT_MANUFACTURER := HTC
