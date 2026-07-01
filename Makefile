TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = InstantDismissAdMob

InstantDismissAdMob_FILES = Tweak.x
InstantDismissAdMob_CFLAGS = -fobjc-arc -w -DTHEOS_LEAN_AND_MEAN

include $(THEOS_MAKE_PATH)/tweak.mk
