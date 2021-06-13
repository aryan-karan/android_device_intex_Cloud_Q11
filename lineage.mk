# Release name
PRODUCT_RELEASE_NAME := Cloud_Q11

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/intex/Cloud_Q11/lineage_Cloud_Q11.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := Cloud_Q11
PRODUCT_NAME := lineage_Cloud_Q11
PRODUCT_BRAND := Intex
PRODUCT_MODEL := Cloud Q11
PRODUCT_MANUFACTURER := intex
PRODUCT_RELEASE_NAME := Intex Cloud Q11

#PRODUCT_BUILD_PROP_OVERRIDES += \
#    BUILD_FINGERPRINT=alps/6.0/MRA58K/1470300415:user/test-keys \
#    PRIVATE_BUILD_DESC="full_vsun6580_we_m-user 6.0 MRA58K 1470300415 test-keys"

BUILD_FINGERPRINT := "google/redfin/redfin:11/RQ3A.210605.005/7349499:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="redfin-user 11 RQ3A.210605.005 7349499 release-keys"

# SuperUser
WITH_SU := false
WITH_ROOT := false