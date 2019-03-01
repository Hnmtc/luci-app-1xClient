--[[
/*
	* Name:         1xClient
	* Version:      2.0
	* Description:  Controller For 1xClient
	* Created:      2019-03-01
	* Copyright (C) 2019-2022 Hsy <info@hsy.ink>
*/
]]--
module("luci.controller.1xClient", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/1xClient") then
		return
	end

	local page

	page = entry({"admin", "services", "1xClient"}, cbi("1xClient"), _("1xClient"))
	page.dependent = true
end
