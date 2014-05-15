#Zdclient
#Author:pentie
#原项目主页：https://code.google.com/p/zdcclient/
#zdclient for openwrt with luci
#Author:ouyang
github:https://github.com/ouyangshiliang/zdclient-luci-openwrt
#Email:ouyangshiliang223@gmail.com

include $(TOPDIR)/rules.mk
	PKG_NAME:=zdclient
	PKG_VERSION:=1.2.2
	PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://raw.githubusercontent.com/ouyangshiliang/zdclient-luci-openwrt/master/
PKG_INSTALL:=1
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/zdclient
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=CERNET
	DEPENDS:=+bash +libpcap +libstdcpp +libiconv-full +libintl-full
	TITLE:=zdclient is digitalchina client.
endef

define Package/zdclient/description
If you can¡'t figure out what this program does, you¡'re probably
brain-dead and need immediate medical attention.
endef

define Build/Prepare
	tar -zxvf $(TOPDIR)/dl/$(PKG_NAME)-$(PKG_VERSION).tar.gz  -C $(BUILD_DIR)
	$(CP) $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/src/* $(PKG_BUILD_DIR)/
endef

define Package/zdclient/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/zdclient $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) $(PKG_BUILD_DIR)/files/zdclient $(1)/etc/init.d/zdclient
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/files/runzdclient $(1)/usr/sbin/runzdclient
endef
$(eval $(call BuildPackage,zdclient))
