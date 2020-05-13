-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Enable", "cEnable", true)
Menu.Spacing()
Menu.SliderFloat("POS Y", "fMinectaftHY", -1000, 1000, "%.2f", 333)
Menu.SliderFloat("POS X", "SMinectaftD", -1000, 1000, "%.2f", -250)
Menu.SliderFloat("Size", "SMinectaftS", -20, 100, "%.2f", 1.67)
Menu.SliderFloat("Distance", "disXminectaft", 0, 100, "%.2f", 28)

local Health_Offset = Hack.GetOffset("DT_BasePlayer", "m_iHealth");


Render.DelImage("hrt1")
Render.DelImage("hrt2")


local ImageInited = false
function InitImage()
	if (not ImageInited) then	
		if (not Render.IsImage("hrt1")) then
			URLDownloadToFile("https://i.imgur.com/aZQi8wa.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\hrt1.png")
			Render.LoadImage("hrt1", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\hrt1.png")
			return
        end
        if (not Render.IsImage("hrt2")) then
			URLDownloadToFile("https://i.imgur.com/PYX86Wz.png", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\hrt2.png")
			Render.LoadImage("hrt2", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\hrt2.png")
			return
		end
		ImageInited = true
	end
end


function Paint()
   InitImage()
   if (not Menu.GetBool("cEnable")) then return end;
   if (not Utils.IsLocalAlive()) then return end;

   POSTY = Menu.GetFloat("fMinectaftHY")
   POSTX = Menu.GetFloat("SMinectaftD")
   sizeX = Menu.GetFloat("SMinectaftS")
   dist = Menu.GetFloat("disXminectaft")

   local Player = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 
   if (not Player) then return end;

   local Health_Offset = Hack.GetOffset("DT_BasePlayer", "m_iHealth");
   local health = Player:GetPropInt(Health_Offset);

   for i = 1, 10 do
      local OffsetX = POSTX + dist * i 

      if (health >= 10 * i) then
         Render.Image("hrt1", Globals.ScreenWidth() / 2 + OffsetX, Globals.ScreenHeight() / 2 + POSTY, Globals.ScreenWidth() / 2 + 25 + OffsetX + sizeX, Globals.ScreenHeight() / 2 + POSTY+ 25 + sizeX, Color.new(255, 255, 255, 255), 0, 0, 1, 1) 
      elseif (health >= 10 * (i - 1)) then
        Render.Image("hrt2", Globals.ScreenWidth() / 2 + OffsetX, Globals.ScreenHeight() / 2 + POSTY, Globals.ScreenWidth() / 2 + 25 + OffsetX + sizeX, Globals.ScreenHeight() / 2 + POSTY + 25  + sizeX, Color.new(255, 255, 255, 255), 0, 0, 1, 1) 
      else
         -- no heart
      end
   end
end
Hack.RegisterCallback("PaintTraverse", Paint)

