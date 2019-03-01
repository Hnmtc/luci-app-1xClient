--[[
/*
	* Name:         1xClient
	* Version:      2.0
	* Description:  Controller For 1xClient
	* Created:      2019-03-01
	* Copyright (C) 2019-2022 Hsy <info@hsy.ink>
*/
]]--

require("luci.sys")

if luci.sys.call("pidof 1xClient >/dev/null") == 0 then
	m = Map("1xClient", translate("1xClient"), "%s - %s" %{translate("1xClient"), translate("RUNNING")})
else
	m = Map("1xClient", translate("1xClient"), "%s - %s" %{translate("1xClient"), translate("NOT RUNNING")})
end

-- General Setting
s = m:section(TypedSection, "1xClient", translate("General Setting"))
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", translate("Enable"))
enable.default   = 0
enable.rmempty   = false

debug = s:option(Flag, "debug", translate("Debug"))
debug.default   = 0
debug.rmempty   = false

username = s:option(Value, "username", translate("Username"))
password = s:option(Value, "password", translate("Password"))
password.password = true
ifname = s:option(ListValue, "ifname", translate("Interfaces"))
for k, v in ipairs(luci.sys.net.devices()) do
	if v ~= "lo" then
		ifname:value(v)
	end
end

return m
