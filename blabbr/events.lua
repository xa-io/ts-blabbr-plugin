--
-- Testmodule callback functions
--
-- To avoid function name collisions, you should use local functions and export them with a unique package name.
--

local function onTalkStatusChangeEvent(serverConnectionHandlerID, status, isReceivedWhisper, clientID)
--	print("Blabbr: onTalkStatusChangeEvent: " .. serverConnectionHandlerID .. " " .. status .. " " .. isReceivedWhisper .. " " .. clientID)
	if status == ts3defs.TalkStatus.STATUS_TALKING then
		local displayName, error = ts3.getClientDisplayName(serverConnectionHandlerID, clientID)
		local uniqueIdentifier, error = ts3.getClientVariableAsString(serverConnectionHandlerID, clientID, ts3defs.ClientProperties.CLIENT_UNIQUE_IDENTIFIER)

		-- Get the current time in HH:MM:SS format
		local timestamp = os.date("<%H:%M:%S>")
		
		-- Construct the message with the timestamp
		local message = timestamp .. " [URL=client://" .. clientID .. "/" .. uniqueIdentifier .. "][color=green]" .. displayName .. "[/color][/URL]"

		-- Print the message to the TeamSpeak chat window
		ts3.printMessage(serverConnectionHandlerID, ":: " .. message, 1)
	end    
end

blabbr_events = {
	onTalkStatusChangeEvent = onTalkStatusChangeEvent
}
