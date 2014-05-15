--[[

LuCI zdclient
Author:tsl0922
Email:tsl0922@sina.com

]]--

module("luci.controller.zdclient", package.seeall)

function index()
	require("luci.i18n")
	luci.i18n.loadc("zdclient")

	if nixio.fs.access("/etc/config/zdclient") then
	local page 
	page = entry({"admin", "services", "zdclient"}, cbi("zdclient"), _("zdclient"), 10)
	page.i18n = "zdclient"
	page.dependent = true
	end
end
