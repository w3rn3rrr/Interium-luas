-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Kill Image", "bKillImage", true)
Menu.Checkbox("HeadShot Image", "bKillImageHeadShot", true)
Menu.Checkbox("WallBang Image", "bKillImageWallBang", true)
Menu.Checkbox("Kill History Imageы", "bKillImageHistory", true)
Menu.Checkbox("Sound After Ace", "bKillImageSoundA", true)
Menu.Checkbox("Sound After Kills", "bKillImageSoundK", true)
Menu.Checkbox("Sound After HeadShot", "bKillImageSoundHS", true)
Menu.SliderFloat("Pos Y", "fKillImagePosY", -1000, 1000, "%.2f", -150)

local ImageSize = 150
local MaxTicks = 32
local MinusAlpha = 16


local ImageInited = false

Render.DelImage("Kill_1")
Render.DelImage("Kill_2")
Render.DelImage("Kill_3")
Render.DelImage("Kill_4")
Render.DelImage("Kill_5")
Render.DelImage("Kill_HS1")
Render.DelImage("Kill_HS2")
Render.DelImage("Kill_WB")
Render.DelImage("Kill_dd")

FileSys.CreateDirectory(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\")
FileSys.CreateDirectory(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\")
		
    
    -here u can chenge the img path
function InitImage()
	if (not ImageInited) then	
		if (not Render.IsImage("Kill_1")) then
			URLDownloadToFile("https://i.imgur.com/2uhe8RF.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_1", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_2")) then
			URLDownloadToFile("https://i.imgur.com/wCZe19L.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_2", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_3")) then
			URLDownloadToFile("https://i.imgur.com/Dy69DM2.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_3", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_4")) then
			URLDownloadToFile("https://i.imgur.com/CRY813o.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_4", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_5")) then
			URLDownloadToFile("https://i.imgur.com/DdO9NyB.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_5", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_HS1")) then
			URLDownloadToFile("https://i.imgur.com/TkFzMAr.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_HS1", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_HS2")) then
			URLDownloadToFile("https://i.imgur.com/E4o0fZ5.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_HS2", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_WB")) then
			URLDownloadToFile("https://i.imgur.com/8ChcCrK.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_WB", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_dd")) then
			URLDownloadToFile("https://i.imgur.com/ROGJCyZ.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_dd", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		if (not Render.IsImage("Kill_ddHS")) then
			URLDownloadToFile("https://i.imgur.com/pvfYqqJ.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			Render.LoadImage("Kill_ddHS", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\temp")
			return
		end
		
		URLDownloadToFile("https://cdn.discordapp.com/attachments/382580856621105164/676141066260578305/wow.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\wow.wav")
		
		URLDownloadToFile("https://cdn.discordapp.com/attachments/382580856621105164/676354116284448768/MultiKill_2_SP.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\2st.wav")
		
		URLDownloadToFile("https://cdn.discordapp.com/attachments/382580856621105164/676354117848793088/MultiKill_3_SP.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\3st.wav")
		
		URLDownloadToFile("https://cdn.discordapp.com/attachments/382580856621105164/676354120096940032/MultiKill_4_SP.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\4st.wav")

		URLDownloadToFile("https://cdn.discordapp.com/attachments/382580856621105164/676434673949474866/headshot.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\hs.wav")

		ImageInited = true
	end
end

local iKillCount = 0
local iKillWithHS = { false, false, false, false, false }
local bImageHS = 0
local bImageWB = false
local iImageAlpha = 0
local dKillsHS = 0

local Ticks = 0

function Func(Event)
	if (not Utils.IsLocalAlive()) then
		iKillCount = 0
		iImageAlpha = 0
		return
	end

	if (Event:GetName() == "round_start") then 
		Ticks = 0
		iImageAlpha = 0
		
		iKillCount = 0
		ImageHS = 0
	end
	
	if (Event:GetName() == "player_death") then
        local IsLocalShot = IEngine.GetPlayerForUserID(Event:GetInt("attacker", 0)) == IEngine.GetLocalPlayer()
		if IsLocalShot then
			local Player = IEntityList.GetPlayer(IEngine.GetPlayerForUserID(Event:GetInt("userid", 0)))
			if (Player and Player:GetClassId() == 40 and not Player:IsTeammate()) then 
				iKillCount = iKillCount + 1
				Ticks = MaxTicks 
				iImageAlpha = 255
				
				
				if (iKillCount == 5 and Menu.GetBool("bKillImageSoundA")) then 
					PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\wow.wav")

				elseif (iKillCount == 2 and Menu.GetBool("bKillImageSoundK")) then 
					PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\2st.wav")
				   
				elseif (iKillCount == 3 and Menu.GetBool("bKillImageSoundK")) then 
					PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\3st.wav")
				   
				elseif (iKillCount == 4 and Menu.GetBool("bKillImageSoundK")) then 
					PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\4st.wav")
				   end
			  
			   	if (Event:GetInt("penetrated", 0) > 0) then
					bImageWB = true
				else
					bImageWB = false
					
					if (Event:GetBool("headshot", false)) then
						bImageHS = bImageHS + 1
						iKillWithHS[iKillCount] = true
						if (Menu.GetBool("bKillImageSoundHS") and iKillCount ~= 5) then
							PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\KillImage-w3rn3r\\hs.wav")
						end
					else
						iKillWithHS[iKillCount] = false
						bImageHS = 0
					end
				end
				
				
				if (iKillCount > 5) then
					iKillCount = 1
				end
			end
        end
	end 
end
Hack.RegisterCallback("FireEventClientSideThink", Func)


local function Draw()

	if (not Utils.IsLocalAlive()) then
		--iKillCount = 0
		iImageAlpha = 0
	end

	InitImage()
  
-- render the small img (right bottom place)

	if (Menu.GetBool("bKillImageHistory")) then
		local ImageOffset = 0
		for i = 1, iKillCount do
			if (iKillWithHS[i]) then
				Render.Image("Kill_ddHS", Globals.ScreenWidth() - Globals.ScreenWidth() / 3.5 - 10 + ImageOffset, Globals.ScreenHeight() - 25 - 10, Globals.ScreenWidth() - Globals.ScreenWidth() / 3.5 + 10 + ImageOffset, Globals.ScreenHeight() - 25 + 10, Color.new(255, 255, 255, 255), 0, 0, 1, 1) 
			else
				Render.Image("Kill_dd", Globals.ScreenWidth() - Globals.ScreenWidth() / 3.5 - 10 + ImageOffset, Globals.ScreenHeight() - 25 - 10, Globals.ScreenWidth() - Globals.ScreenWidth() / 3.5 + 10 + ImageOffset, Globals.ScreenHeight() - 25 + 10, Color.new(255, 255, 255, 255), 0, 0, 1, 1) 
			end

			ImageOffset = ImageOffset - 20
		end
	end 

--render the main img 

	PosY = Menu.GetFloat("fKillImagePosY")
	if (iImageAlpha > 0) then 
		if (bImageWB and Menu.GetBool("bKillImageWallBang")) then	
			Render.Image("Kill_WB", Globals.ScreenWidth() / 2 - ImageSize / 2, Globals.ScreenHeight() / 2 - ImageSize / 2 - PosY, Globals.ScreenWidth() / 2 + ImageSize / 2, Globals.ScreenHeight() / 2 + ImageSize / 2 - PosY, Color.new(255, 255, 255, iImageAlpha), 0, 0, 1, 1) 
		elseif (bImageHS == 1 and Menu.GetBool("bKillImageHeadShot")) then	
			Render.Image("Kill_HS1", Globals.ScreenWidth() / 2 - ImageSize / 2, Globals.ScreenHeight() / 2 - ImageSize / 2 - PosY, Globals.ScreenWidth() / 2 + ImageSize / 2, Globals.ScreenHeight() / 2 + ImageSize / 2 - PosY, Color.new(255, 255, 255, iImageAlpha), 0, 0, 1, 1) 
		elseif (bImageHS > 1 and Menu.GetBool("bKillImageHeadShot")) then	
			Render.Image("Kill_HS2", Globals.ScreenWidth() / 2 - ImageSize / 2, Globals.ScreenHeight() / 2 - ImageSize / 2 - PosY, Globals.ScreenWidth() / 2 + ImageSize / 2, Globals.ScreenHeight() / 2 + ImageSize / 2 - PosY, Color.new(255, 255, 255, iImageAlpha), 0, 0, 1, 1) 
		elseif (Menu.GetBool("bKillImage")) then	
			if (iKillCount == 1) then
				Render.Image("Kill_1", Globals.ScreenWidth() / 2 - ImageSize / 2, Globals.ScreenHeight() / 2 - ImageSize / 2 - PosY, Globals.ScreenWidth() / 2 + ImageSize / 2, Globals.ScreenHeight() / 2 + ImageSize / 2 - PosY, Color.new(255, 255, 255, iImageAlpha), 0, 0, 1, 1) 
			elseif (iKillCount == 2) then 
				Render.Image("Kill_2", Globals.ScreenWidth() / 2 - ImageSize / 2, Globals.ScreenHeight() / 2 - ImageSize / 2 - PosY, Globals.ScreenWidth() / 2 + ImageSize / 2, Globals.ScreenHeight() / 2 + ImageSize / 2 - PosY, Color.new(255, 255, 255, iImageAlpha), 0, 0, 1, 1) 
			elseif (iKillCount == 3) then 
				Render.Image("Kill_3", Globals.ScreenWidth() / 2 - ImageSize / 2, Globals.ScreenHeight() / 2 - ImageSize / 2 - PosY, Globals.ScreenWidth() / 2 + ImageSize / 2, Globals.ScreenHeight() / 2 + ImageSize / 2 - PosY, Color.new(255, 255, 255, iImageAlpha), 0, 0, 1, 1) 
			elseif (iKillCount == 4) then 
				Render.Image("Kill_4", Globals.ScreenWidth() / 2 - ImageSize / 2, Globals.ScreenHeight() / 2 - ImageSize / 2 - PosY, Globals.ScreenWidth() / 2 + ImageSize / 2, Globals.ScreenHeight() / 2 + ImageSize / 2 - PosY, Color.new(255, 255, 255, iImageAlpha), 0, 0, 1, 1) 
			elseif (iKillCount == 5) then 
				Render.Image("Kill_5", Globals.ScreenWidth() / 2 - ImageSize / 2, Globals.ScreenHeight() / 2 - ImageSize / 2 - PosY, Globals.ScreenWidth() / 2 + ImageSize / 2, Globals.ScreenHeight() / 2 + ImageSize / 2 - PosY, Color.new(255, 255, 255, iImageAlpha), 0, 0, 1, 1) 
			end	
		end
	end
end
Hack.RegisterCallback("PaintTraverse", Draw)


function CreateMove(pCmd, p_bSendPacket)
    if (not Utils.IsLocalAlive()) then 
        return
    end
	
	if (Ticks == 0 and iImageAlpha > 0) then iImageAlpha = iImageAlpha - MinusAlpha end
	if (Ticks > 0) then Ticks = Ticks - 1 end
end   
Hack.RegisterCallback("CreateMove", CreateMove)




