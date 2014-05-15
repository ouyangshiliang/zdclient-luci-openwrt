--[[
https://code.google.com/p/zdcclient/
Zdclient
Author:pentie
原项目主页：https://code.google.com/p/zdcclient/
zdclient for openwrt with luci
Author:ouyang
Email:ouyangshiliang223@gmail.com

]]--
local fs  = require "nixio.fs"
local sys = require "luci.sys"
local uci = require "luci.model.uci".cursor()
require("luci.tools.webadmin")

m = Map("zdclient", translate("zdclient"), translate("A DigitalChina Supplicant for Linux and openwrt os.The Author is pentie.ouyang made it for openwrt."))
function m.on_commit(self)
os.execute("/etc/init.d/zdclient start")
end

s = m:section(TypedSection, "option", translate("Start option"),translate("Configure zdclient's start option"))
s.anonymous = true

s:option(Flag, "enable", translate("zdclient_enable"), translate("enable or disable zdclient")).default="0"


s:option(Flag, "boot", translate("Start at boot"), translate("Start zdclient when the route is booting.")).default="0"


s = m:section(TypedSection, "zdclient", translate("Config zdclient"),translate("The options below are all of zdclient's arguments. The options below will work when dhcp and noipMode is set."))
s.anonymous = true

s:option(Value, "Username", translate("Username")).default="xxx"

pw=s:option(Value, "Password", translate("Password"))
pw.password = true
pw.rmempty = false
pw.default= "xxx"

nic=s:option(ListValue, "Nic", translate("net card name"))
nic.anonymous = true
for k, v in pairs(luci.sys.net.devices()) do
	nic:value(v)
end

t= s:option(ListValue, "DhcpMode", translate("DHCP type"),translate("default to 1"))
t:value("0", translate("0(DhcpMode off)"))
t:value("1", translate("1(DhcpMode on)"))
t.default = "1"

t= s:option(ListValue, "ip type", translate("ip type"),translate("default to 0"))
t:value("0", translate("0(ip type off)"))
t:value("1", translate("1(ip type on)"))
t.default = "0"

s:option(Value, "IP", translate("IP"),translate("default to localhost's IP 169.0.0.1")).default="169.0.0.1"

s:option(Value, "Mask", translate("netmask"),translate("default to localhost's netmask")).default="255.255.255.0"

s:option(Value, "Gateway", translate("gateway"),translate("default gateway to 192.168.1.1")).default="192.168.1.1"

s:option(Value, "DNS", translate("DNS"),translate("default DNS to 192.168.1.1")).default="192.168.1.1"

s:option(Value, "Version", translate("client version"),translate("default to 3.6.04.1110fk.")).default="3.6.04.1110fk"


return m
