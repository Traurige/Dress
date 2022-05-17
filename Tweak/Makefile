TWEAK_NAME = Dress
$(TWEAK_NAME)_FILES = Dress.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -DTHEOS_LEAN_AND_MEAN
$(TWEAK_NAME)_FRAMEWORKS = UIKit
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei
$(TWEAK_NAME)_LIBRARIES = gcuniversal

export SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
