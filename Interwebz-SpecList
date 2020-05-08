-- code are trash :/

-- change the font here
URLDownloadToFile("https://cdn.discordapp.com/attachments/377022549361426432/707182823169065010/visitor2.ttf", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\visitor2.ttf")
local CustomFont =   GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\visitor2.ttf"


local FontInited = false
function InitFont()
	if (not FontInited) then
		Render.LoadFont("FontNameLol", CustomFont, 32)
		FontInited = true
	end
end


-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Text("                           SPECTATOR LIST");
Menu.Text("                                by w3rn3r");
Menu.SliderFloat("X Position", "SSliderXpos", 1, Globals.ScreenWidth(), "%.0f", 150)
Menu.ColorPicker("Main color", "McolorSL", 132, 125, 209, 255)

-- Init Offsets
local hObserverTarget_Offset = Hack.GetOffset("DT_BasePlayer", "m_hObserverTarget")
local iObserverMode_Offset = Hack.GetOffset("DT_BasePlayer", "m_iObserverMode")


-- Init Spec Info
local SpecCount = 0
local SpecNames = {  }


local function LocalAlive()
    local Player = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 
    if (not Player or Player:GetClassId() ~= 40) then return false end

    return Player:IsAlive()
end


local function FindTarget()
    -- Local Looking
    local Player = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 
    if (not Player or Player:GetClassId() ~= 40 or Player:IsAlive() or Player:IsDormant()) then return -1 end


    -- Target Playing
    local TargetObserver = Player:GetPropInt(hObserverTarget_Offset) -- int bc need adress
    if (TargetObserver <= 0) then return -1 end

    local TargetHandle = IEntityList.GetClientEntityFromHandleA(TargetObserver) 
    local Target = IEntityList.ToPlayer(TargetHandle) 
    if (not Target or Target:GetClassId() ~= 40 or not Target:IsAlive() or Target:IsDormant()) then return -1 end

    
    return Target:GetIndex()
end


function BuildSpecList(TargetIndex)
    if (TargetIndex == -1) then return end

    for i = 1, 64 do
        if (i == IEngine.GetLocalPlayer()) then goto continue end

 
        -- Player Looking
        local Player = IEntityList.GetPlayer(i) 
        if (not Player or Player:GetClassId() ~= 40 or Player:IsAlive() or Player:IsDormant()) then goto continue end

        local PlayerInfo = CPlayerInfo.new()
        if (not Player:GetPlayerInfo(PlayerInfo)) then goto continue end
    
        local PlayerName = PlayerInfo.szName
        if (PlayerName == "GOTV") then goto continue end
        

        -- Target Playing
        local TargetObserver = Player:GetPropInt(hObserverTarget_Offset) -- int bc need adress
        if (TargetObserver <= 0) then goto continue end

        local TargetHandle = IEntityList.GetClientEntityFromHandleA(TargetObserver) 
        local Target = IEntityList.ToPlayer(TargetHandle) 
        if (not Target or Target:GetClassId() ~= 40 or not Target:IsAlive() or Target:IsDormant()) then goto continue end


        -- Build
        if (TargetIndex ~= Target:GetIndex()) then goto continue end
        local PlayerObserverMode = Player:GetPropInt(iObserverMode_Offset)
  
        if (PlayerObserverMode == 4 or PlayerObserverMode == 5) then
            SpecCount = SpecCount + 1
            SpecNames[SpecCount] = PlayerName
        end


        ::continue::
    end
end


function UpdateSpecList()
    SpecCount = 0
    SpecNames = {  }

    if (LocalAlive()) then
        BuildSpecList(IEngine.GetLocalPlayer())
    else
        BuildSpecList(FindTarget())
    end
end


-- Render
function RenderSpecList()
    local MidposY = Globals.ScreenHeight() / 2
    local XposSL = Menu.GetFloat("SSliderXpos");

    --upper quad 
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL - 31, MidposY - 6) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL + 134, MidposY - 6) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL + 111, MidposY + 17) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL - 54, MidposY + 17) 
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2)
    
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL - 30, MidposY - 4) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL + 130, MidposY - 4) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL + 110, MidposY + 15) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL - 50, MidposY + 15)
    Render.PolyFilled(4, Color.new(58, 57, 58, 255), true, 2)

    Render.Text("SPECTATOR LIST", Globals.ScreenWidth() - XposSL - 13, MidposY, 12, Menu.GetColor("McolorSL"), false, true, "FontNameLol")
--1
    for i = 1, SpecCount do


    if i == 1 then 
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 17) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 17)
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 38) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 38)
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2)

    --spec1 darks
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL - 52, MidposY + 1 + 17)
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL + 109, MidposY + 1 + 17) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL + 109, MidposY + 1 + 35) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL - 52, MidposY + 1 + 35)
    Render.PolyFilled(4, Color.new(46, 45, 46, 255), true, 2)
    end


    if i == 2 then    
        --spec2  
        Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 37) 
        Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 37)
        Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 58) 
        Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 58)
        Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2)
        --spec2 white
        Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 109, MidposY + 37) 
        Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 52, MidposY + 37)
        Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 52, MidposY + 56) 
        Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 109, MidposY + 56)
        Render.PolyFilled(4, Color.new(70, 68, 70, 255), true, 2) 
    end



    if i == 3 then 
    --spec3  
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 57) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 57)
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 78) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 78)
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2)
    --spec3 darks
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL - 52, MidposY + 1 + 57)
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL + 109, MidposY + 1 + 57) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL + 109, MidposY + 1 + 75) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL - 52, MidposY + 1 + 75)
    Render.PolyFilled(4, Color.new(46, 45, 46, 255), true, 2)

end

    if i == 4 then 
    --spec4  
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 77) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 77) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 98) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 98) 
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2) 
    --spec4 white 
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 109, MidposY + 77) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 52, MidposY + 77) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 52, MidposY + 95) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 109, MidposY + 95) 
    Render.PolyFilled(4, Color.new(70, 68, 70, 255), true, 2) 
    end 
    

    if i == 5 then 
    --spec5  
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 97) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 97) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 118) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 118) 
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2) 
    --spec5 darks
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL - 52, MidposY + 1 + 97) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL + 109, MidposY + 1 + 97) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL + 109, MidposY + 1 + 115) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL - 52, MidposY + 1 + 115) 
    Render.PolyFilled(4, Color.new(46, 45, 46, 255), true, 2) 
    end

 
    if i == 6 then 
    --spec6 
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 117) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 117) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 138) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 138) 
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2) 
    --spec6 white 
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 109, MidposY + 117) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 52, MidposY + 117) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 52, MidposY + 135) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 109, MidposY + 135) 
    Render.PolyFilled(4, Color.new(70, 68, 70, 255), true, 2) 
        end
    
   
    if i == 7 then 
    --spec7  
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 157) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 157) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 178) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 178) 
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2) 
    --spec7 darks
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL - 52, MidposY + 1 + 157) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL + 109, MidposY + 1 + 157) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL + 109, MidposY + 1 + 175) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL - 52, MidposY + 1 + 175) 
    Render.PolyFilled(4, Color.new(46, 45, 46, 255), true, 2) 
            end

        --8
    if i == 8 then 
    --spec8  
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 177) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 177) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 198) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 198) 
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2) 
    --spec8 white 
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 109, MidposY + 177) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 52, MidposY + 177) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 52, MidposY + 195) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 109, MidposY + 195) 
    Render.PolyFilled(4, Color.new(70, 68, 70, 255), true, 2) 
        end    
    
    if i == 9 then 
    --spec9
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 197) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 197) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 218) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 218) 
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2) 
    --spec9 darks
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 109, MidposY + 197) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 52, MidposY + 197) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 52, MidposY + 215) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 109, MidposY + 215) 
    Render.PolyFilled(4, Color.new(46, 45, 46, 255), true, 2) 
        end

    if i == 10 then 
    --spec10 
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 111, MidposY + 217) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 54, MidposY + 217) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 54, MidposY + 238) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 111, MidposY + 238) 
    Render.PolyFilled(4, Color.new(79, 78, 79, 255), true, 2) 
    --spec10 white 
    Render.AddPoly(0, Globals.ScreenWidth() - XposSL + 109, MidposY + 217) 
    Render.AddPoly(1, Globals.ScreenWidth() - XposSL - 52, MidposY + 217) 
    Render.AddPoly(2, Globals.ScreenWidth() - XposSL - 52, MidposY + 235) 
    Render.AddPoly(3, Globals.ScreenWidth() - XposSL + 109, MidposY + 235) 
    Render.PolyFilled(4, Color.new(70, 68, 70, 255), true, 2) 
        end

    Render.Text(SpecNames[i], Globals.ScreenWidth() - XposSL - 40, MidposY + 1 + 20 * i, 12, Color.new(255, 255, 255, 255), false, true, "FontNameLol")
    
       -- Render.Text_1("", Globals.ScreenWidth() - XposSL + 45, MidposY + 10 + 18 * i, Color.new(255, 255, 255, 255), 2, SpecNames[i])
    end
end


local function SpecList()
    if (not Utils.IsLocal()) then return end

    InitFont()
    
    UpdateSpecList()
    RenderSpecList()
end
Hack.RegisterCallback("PaintTraverse", SpecList)
