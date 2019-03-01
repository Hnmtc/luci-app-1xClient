#
	# Name:    luci-app-1xClient
	# Version: v2.0
	# Author:  Hsy <info@hsy.ink>
	# Date:    2019-03-01
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

PKG_NAME:=luci-app-1xClient
PKG_VERSION=2.0
PKG_MAINTAINER:=Hsy <info@hsy.ink>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI Support for Lenovo 802.1x Client.
	DEPENDS:=+1xClient
endef

define Package/$(PKG_NAME)/description
	This package contains LuCI configuration pages for Lenovo 802.1x Client.
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/files/usr/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/1xClient.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./files/usr/model/cbi/1xClient.lua $(1)/usr/lib/lua/luci/model/cbi/1xClient.lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/usr/controller/1xClient.lua $(1)/usr/lib/lua/luci/controller/1xClient.lua
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
