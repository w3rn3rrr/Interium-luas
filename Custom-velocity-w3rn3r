
local EDline = "___________________________________________________________"
local CLplace = " "

-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Text(CLplace)
Menu.Text(EDline)
Menu.Text("                                Velosity v3")
Menu.Checkbox("Show Velocity", "bShowVelocity", true)
Menu.Text("Show Velocity Old")
Menu.Combo( "Show Velocity Old", "iShowVelocityOld", { "None", "Add To Velocity", "New Object" }, 1);
Menu.Checkbox("Show Units", "bShowUnits", false)
--Menu.Checkbox("Show Vert", "bShowVert", true)
Menu.Text("Show Vert")
Menu.Combo( "Show Vert", "iShowVert", { "None", "Add To Units", "New Object" }, 1);
Menu.Checkbox("Show JB Status", "bShowJBStatus", false)
Menu.Checkbox("Show Round Info to Chat", "bShowRoundInfo", false)
Menu.Checkbox("Show LJ Info to Chat", "bShowLJInfo", true)
Menu.Checkbox("Enable LJ Sounds", "bEnableLJSound", true)
Menu.Spacing()
Menu.Spacing()
Menu.Checkbox("Show Velocity Graph", "bShowVelocityGraph", true)
Menu.Checkbox("Show Stamina Graph", "bShowStaminaGraph", true)
Menu.Checkbox("Show Graph Start Line", "bShowVelocityLine1", true)
Menu.Checkbox("Show Velocity Old on Graph", "bShowVelocityOldOnGraph", true)
Menu.Checkbox("Show Velocity Plus on Graph", "bShowVelocityPlusOnGraph", true)
Menu.Checkbox("Show JB on Graph", "bShowJBOnGraph", true)
Menu.SliderFloat("Graph Size X", "fGraphSizeX", 1, 1000, "%.0f", 136)
Menu.SliderFloat("Graph Size Y", "fGraphSizeY", 0, 3, "%.2f", 0.18)
Menu.Spacing()
Menu.Spacing()
Menu.SliderFloat("Pos Y", "fVelPosY", 0, 10, "%.2f", 1.08)
Menu.SliderFloat("Size units", "SVunits", 1, 1000, "%.0f", 24)
Menu.ColorPicker("Color of main velocity line", "VGcolor", 255, 255, 255, 255)
Menu.ColorPicker("Stabl. velocity", "LVcolorT", 127, 44, 255, 255)
Menu.ColorPicker("> vel", "LVcolorS", 127, 44, 255, 255)
Menu.ColorPicker("< vel", "LVcolorM", 127, 44, 255, 255)
Menu.ColorPicker("Velocity text in grapf", "CVgraf", 255, 255, 255, 255)
Menu.ColorPicker("Stamina line", "VSGcolor", 58, 92, 224, 255)
Menu.ColorPicker("jb text color", "JBcolorV", 58, 92, 224, 255)




FileSys.CreateDirectory(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\")    
URLDownloadToFile("https://cdn.discordapp.com/attachments/673132064295485490/678738952412332069/perfect.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\perfect.wav")
URLDownloadToFile("https://cdn.discordapp.com/attachments/673132064295485490/678738951535853639/ownage.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\ownage.wav")
URLDownloadToFile("https://cdn.discordapp.com/attachments/673132064295485490/678738953070706689/godlike.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\godlike.wav")
URLDownloadToFile("https://cdn.discordapp.com/attachments/382580856621105164/678729162097426432/comboking.wav", GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\comboking.wav")




-- Customize from Menu
local PosY = 0
local SizeY = 0

local TextOffsetY = 0

-- Offsets
local fFlags_Offset = Hack.GetOffset("DT_BasePlayer", "m_fFlags")
local vVelocity_Offset = Hack.GetOffset("DT_BasePlayer", "m_vecVelocity[0]")
local vOrigin_Offset = Hack.GetOffset("DT_BaseEntity", "m_vecOrigin")
local fStamina_Offset = Hack.GetOffset("DT_CSPlayer", "m_flStamina")

-- Flag States
local ON_GROUND = 0

-- For Vec
local function VecLenght(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
end
local function VecLenght2D(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y)
end
local function Dist(Vec1, Vec2)
    local vBuf = Vector.new()

    vBuf.x = Vec1.x - Vec2.x
    vBuf.y = Vec1.y - Vec2.y
    vBuf.z = Vec1.z - Vec2.z

    return VecLenght2D(vBuf)
end

local MoveType_NOCLIP = 8
local MoveType_LADDER = 9
local function IsCanMovement(MoveType)
    if (MoveType == MoveType_NOCLIP or MoveType == MoveType_LADDER) then
        return false
    end

    return true
end


local fVelocity_old = 0 -- Just Velocity old for all
local vVelocity_old = Vector.new() -- For Check JB

-- Info For Round
local Jumps = 0
local Strafes = 0
local JBs = 0

-- Graph
local Mnoj = 5
local VelocityArray = { }
local StaminaArray = { }
local PlusOnGroundVelocityArray = { }
local OnGroundVelocityArray = { }
local IsJBArray = { }
local VelocityrraySize = 150
for i = 1, 9999 do
    VelocityArray[i] = 0
    StaminaArray[i] = 0
    PlusOnGroundVelocityArray[i] = -999
    OnGroundVelocityArray[i] = -999
    IsJBArray[i] = -999
end

-- Ignore some Times
local OnGroundTime = 0
local OnGroundTimeMax = 1250 -- Visual
local NotJumpingTimeMax = 100 -- Rebuild

-- For Velocity Old
local IsOnGroud_old = false
local VelocityOnGround_old = 0
local VelocityOnGround = 0
-- For JB Status
local IsJBTime = 0
local IsJBTimeMax = 250
-- Units
local LastUnits = 0
local LastVert = 0
local vOriginOnGround = Vector.new()

-- KZ
local KZ_Jumps = 0
local KZ_TimeMax = 25
--
local KZ_Strafes = 0
local KZ_MaxVelocity = 0
local KZ_PreVelocity = 0


local JumpComboM = 0

function BuildVelocityInfo(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    if (not IsCanMovement(iMoveType)) then return end

    -- Build Velocity
    if (IsBit(Flags, ON_GROUND)) then
        if (OnGroundTime == 0) then OnGroundTime = GetTickCount() end
    else
        if (OnGroundTime > 0 and GetTickCount() > (OnGroundTime + NotJumpingTimeMax)) then
            VelocityOnGround_old = 0
            VelocityOnGround = 0
    
            --LastUnits = 0
            --LastVert = 0
        end
        OnGroundTime = 0
    end

    -- KZ
    if (IsOnGroud_old and not IsBit(Flags, ON_GROUND)) then
        KZ_Jumps = KZ_Jumps + 1
    elseif (vVelocity_old.z < 0 and vVelocity.z > 0) then
        KZ_Jumps = KZ_Jumps + 1
    end
    if (not IsBit(Flags, ON_GROUND)) then
        if (KZ_PreVelocity == 0) then KZ_PreVelocity = fVelocity end
        if (KZ_MaxVelocity < fVelocity) then KZ_MaxVelocity = fVelocity end
        if (KZ_PreZ == 0) then KZ_PreZ = math.abs(vOrigin.z) end
        if (vVelocity.z > 0) then KZ_MaxZ = math.abs(vOrigin.z) end
    end
    if (OnGroundTime > 0 and GetTickCount() > (OnGroundTime + KZ_TimeMax)) then
        if (KZ_Jumps == 1 and LastUnits > 200 and LastUnits < 500) then
            local Text = "[\x0EInterium\x01] "



        if (LastUnits >= 245) then                                                  --yellow
            Text = Text .. "\x08Units: \x0D" .. LastUnits
            else    Text = Text .. "\x08Units: \x03" .. LastUnits                   --gold
        end




            Text = Text .. "\x01 | \x08Strafes:  \x03" .. KZ_Strafes
            Text = Text .. "\x01 | \x08Pre:  \x03" .. KZ_PreVelocity
            Text = Text .. "\x01 | \x08Max:  \x03" .. KZ_MaxVelocity
            IChatElement.ChatPrintf(0, 0, Text)

            if (LastUnits >= 245 and LastUnits <= 260) then 
                JumpComboM = JumpComboM + 1
            elseif (LastUnits < 245) then 
                JumpComboM = 0
            end


        if (Menu.GetBool("bEnableLJSound")) then 
            if (LastUnits >= 230 and LastUnits < 240 ) then 
                PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\perfect.wav")
            
            elseif (LastUnits >= 240 and LastUnits < 245 ) then 
                PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\godlike.wav")
            
            elseif (LastUnits >= 245 and LastUnits < 260 and JumpComboM < 3) then 
                PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\ownage.wav") 
            end
            if (JumpComboM == 3) then 
                PlaySound(GetAppData() .. "\\INTERIUM\\CSGO\\FilesForLUA\\comboking.wav") 
                JumpComboM = 0
            end
        end
        
        end
 
 
        KZ_Jumps = 0

        KZ_Strafes = 0
        KZ_MaxVelocity = 0
        KZ_PreVelocity = 0
    end


    -- Build Velocity
    if (IsOnGroud_old and not IsBit(Flags, ON_GROUND)) then -- Just Jump ?
        VelocityOnGround_old = VelocityOnGround
        VelocityOnGround = fVelocity

        Jumps = Jumps + 1

        if (VelocityOnGround ~= 0) then
            OnGroundVelocityArray[VelocityrraySize * 2] = VelocityOnGround
        end
        if (VelocityOnGround_old ~= 0 and VelocityOnGround ~= 0) then
            PlusOnGroundVelocityArray[VelocityrraySize * 2] = VelocityOnGround - VelocityOnGround_old
        end
    else -- JB ?
        if (vVelocity_old.z < 0 and vVelocity.z > 0) then
            IsJBArray[VelocityrraySize * 2] = 1
            IsJBTime = GetTickCount() + IsJBTimeMax
            JBs = JBs + 1

            VelocityOnGround_old = VelocityOnGround
            VelocityOnGround = fVelocity
        
            if (VelocityOnGround ~= 0) then
                OnGroundVelocityArray[VelocityrraySize * 2] = VelocityOnGround
            end
            if (VelocityOnGround_old ~= 0 and VelocityOnGround ~= 0) then
                PlusOnGroundVelocityArray[VelocityrraySize * 2] = VelocityOnGround - VelocityOnGround_old
            end
        end
    end


    -- Save Units with with JB
    if (vVelocity_old.z < 0 and vVelocity.z > 0) then
        LastUnits = math.floor(Dist(vOriginOnGround, vOrigin) + 37 + 0.5)
        LastVert = math.floor((vOriginOnGround.z - vOrigin.z) * -1 + 3 + 0.5)
        vOriginOnGround = vOrigin
    end
    -- Save Units with Jumps
    if (not IsOnGroud_old and IsBit(Flags, ON_GROUND)) then
        LastUnits = math.floor(Dist(vOriginOnGround, vOrigin) + 37 + 0.5)
        LastVert = math.floor((vOriginOnGround.z - vOrigin.z) * -1 + 3 + 0.5)
    elseif (IsOnGroud_old and IsBit(Flags, ON_GROUND) or IsOnGroud_old and not IsBit(Flags, ON_GROUND)) then
        vOriginOnGround = vOrigin
    end


    -- Delete OnGround Saves bc u r OnGround so long
    if (IsBit(Flags, ON_GROUND) and GetTickCount() > (OnGroundTime + OnGroundTimeMax)) then
        VelocityOnGround_old = 0
        VelocityOnGround = 0

        LastUnits = 0
        LastVert = 0
    end
end

function DrawGraph(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    if (not Menu.GetBool("bShowVelocityGraph")) then 
        return
    end

    -- Render Graph
    local NoRender = false
    for i = 2, VelocityrraySize * 2 do
        if (VelocityArray[i] ~= -999) then
            local VelNow = VelocityArray[i]
            if (VelNow > 400) then VelNow = 400 end
            if (VelNow < 0) then VelNow = 0 end

            local VelOld = VelocityArray[i - 1]
            if (VelOld > 400) then VelOld = 400 end
            if (VelOld < 0) then VelOld = 0 end

            Render.AddPoly(i - 2, Globals.ScreenWidth() / 2 - VelocityrraySize + i, PosY - VelOld * SizeY)
            Render.AddPoly(i - 1, Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - VelNow * SizeY)
            --Render.Line(Globals.ScreenWidth() / 2 - VelocityrraySize + i, PosY - VelOld * SizeY, Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - VelNow * SizeY, Color.new(255, 255, 255, 255), 1)

            -- Render Speed
            if (OnGroundVelocityArray[i] ~= -999 and Menu.GetBool("bShowVelocityOldOnGraph")) then
                local Text = tostring(OnGroundVelocityArray[i])
                if (PlusOnGroundVelocityArray[i] ~= -999 and Menu.GetBool("bShowVelocityPlusOnGraph")) then
                    Text = "(" .. Text .. ")"
                end

                if (VelOld > VelNow) then
                    Render.Text_1(Text, Globals.ScreenWidth() / 2 - VelocityrraySize + i, PosY - VelOld * SizeY - 16, 12, Menu.GetColor("CVgraf"), true, true)
                else
                    Render.Text_1(Text, Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - VelNow * SizeY - 16, 12, Menu.GetColor("CVgraf"), true, true)
                end

                --Render.Text_1(PlusOnGroundVelocityArray[i], Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1 - 1, PosY - OnGroundVelocityArray[i] * SizeY - 43, 12, col3, true, true)
                --Render.Text_1("(" .. OnGroundVelocityArray[i] .. ")", Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - OnGroundVelocityArray[i] * SizeY - 32, 12, Color.new(200, 200, 200, 255), true, true)
            end

            -- Render Speed Plus
            if (PlusOnGroundVelocityArray[i] ~= -999 and Menu.GetBool("bShowVelocityPlusOnGraph")) then

                local Text = tostring(PlusOnGroundVelocityArray[i])
                if (PlusOnGroundVelocityArray[i] >= 0) then
                    Text = "+" .. Text
                end

                local col3 = Color.new()
                if (PlusOnGroundVelocityArray[i] > 0) then
                    col3 = Color.new(100, 225, 25, 255)
                elseif (PlusOnGroundVelocityArray[i] < 0) then
                    col3 = Color.new(225, 50, 50, 255)
                else
                    col3 = Color.new(255, 150, 50, 255)
                end

                if (VelOld > VelNow) then
                    Render.Text_1(Text, Globals.ScreenWidth() / 2 - VelocityrraySize + i - 1, PosY - VelOld * SizeY - 28, 12, col3, true, true)
                else
                    Render.Text_1(Text, Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1 - 1, PosY - VelNow * SizeY - 28, 12, col3, true, true)
                end

                --Render.Text_1(PlusOnGroundVelocityArray[i], Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1 - 1, PosY - OnGroundVelocityArray[i] * SizeY - 43, 12, col3, true, true)
                --Render.Text_1("(" .. OnGroundVelocityArray[i] .. ")", Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - OnGroundVelocityArray[i] * SizeY - 32, 12, Color.new(200, 200, 200, 255), true, true)
            end

            -- Render JB
            if (IsJBArray[i] == 1 and Menu.GetBool("bShowJBOnGraph")) then
                if (VelOld > VelNow) then
                    Render.Text_1("JB", Globals.ScreenWidth() / 2 - VelocityrraySize + i, PosY - VelOld * SizeY - 40, 12, Menu.GetColor("JBcolorV"), true, true)
                else
                    Render.Text_1("JB", Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - VelNow * SizeY - 40, 12,  Menu.GetColor("JBcolorV"), true, true)
                end

                --Render.Text_1(PlusOnGroundVelocityArray[i], Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1 - 1, PosY - OnGroundVelocityArray[i] * SizeY - 43, 12, col3, true, true)
                --Render.Text_1("(" .. OnGroundVelocityArray[i] .. ")", Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - OnGroundVelocityArray[i] * SizeY - 32, 12, Color.new(200, 200, 200, 255), true, true)
            end
        end
    end
    --Graph main line 
    Render.Poly(VelocityrraySize * 2, Menu.GetColor("VGcolor"), false, 2)
end

function DrawStaminaGraph(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    if (not Menu.GetBool("bShowStaminaGraph")) then 
        return
    end

    -- Render Graph
    for i = 2, VelocityrraySize * 2 do
        if (StaminaArray[i] ~= -999) then
            local StaminaNow = StaminaArray[i] * 2
            local StaminaOld = StaminaArray[i - 1] * 2

            Render.AddPoly(i - 2, Globals.ScreenWidth() / 2 - VelocityrraySize + i, PosY - StaminaOld * SizeY)
            Render.AddPoly(i - 1, Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - StaminaNow * SizeY)
            --Render.Line(Globals.ScreenWidth() / 2 - VelocityrraySize + i, PosY - VelOld * SizeY, Globals.ScreenWidth() / 2 - VelocityrraySize + i + 1, PosY - VelNow * SizeY, Color.new(255, 255, 255, 255), 1)
        end
    end
    --Stamina graph
    Render.Poly(VelocityrraySize * 2, Menu.GetColor("VSGcolor"), false, 2)
end

function DrawVelocity(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    -- Render Velocity or Velocity with Old Velocity [TYPE 1]
    local Text = tostring(fVelocity)
    if (not Menu.GetBool("bShowVelocity")) then 
        Text = ""
    end
    --if (Menu.GetInt("iShowVelocityOld") == 1 and VelocityOnGround > 0) then 
    --    Text = Text .. " (" .. tostring(VelocityOnGround) .. ")"
    --end

    -- Build Speed Color
    local col = Color.new()
    if (fVelocity > fVelocity_old) then
        col = Menu.GetColor("LVcolorS")
    elseif (fVelocity < fVelocity_old) then
        col = Menu.GetColor("LVcolorM")
    else
        col = Menu.GetColor("LVcolorT")
    end
 

    if (Menu.GetInt("iShowVelocityOld") == 1 and VelocityOnGround > 0) then 
        -- Build Velocity Color
        local col2 = Color.new()
        if (VelocityOnGround > VelocityOnGround_old) then
            col2 = Menu.GetColor("LVcolorS")
        elseif (VelocityOnGround < VelocityOnGround_old) then
            col2 = Menu.GetColor("LVcolorM")
        else
            col2 = Menu.GetColor("LVcolorT")
        end

        Render.Text_1(Text, Globals.ScreenWidth() / 2 - Render.CalcTextSize_1("(" .. VelocityOnGround .. ")", 24).x / 2, PosY + 10 + TextOffsetY, Menu.GetFloat("SVunits"), col, true, true)
        Render.Text_1("(" .. VelocityOnGround .. ")", Globals.ScreenWidth() / 2 - Render.CalcTextSize_1("(" .. VelocityOnGround .. ")", 24).x / 2 + Render.CalcTextSize_1(Text, 24).x / 2 + 4, PosY + 10 + TextOffsetY, 24, col2, false, true)
    else
        Render.Text_1(Text, Globals.ScreenWidth() / 2, PosY + 10 + TextOffsetY, Menu.GetFloat("SVunits"), col, true, true)
    end

    TextOffsetY = TextOffsetY + 22
end


function DrawOldVelocity(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    if (Menu.GetInt("iShowVelocityOld") ~= 2) then 
        return
    end

    -- Build Velocity Color
    local col2 = Color.new()
    if (VelocityOnGround > VelocityOnGround_old) then
        col2 = Color.new(25, 255, 100, 255)
    elseif (VelocityOnGround < VelocityOnGround_old) then
        col2 = Color.new(225, 100, 100, 255)
    else
        col2 = Color.new(255, 200, 100, 255)
    end

    -- Render Old Velocity [TYPE 2]
    if (VelocityOnGround > 0) then

        Render.Text_1("(" .. VelocityOnGround .. ")", Globals.ScreenWidth() / 2, PosY + 10 + TextOffsetY, 24, col2, true, true)
        TextOffsetY = TextOffsetY + 22

    end
end

local a1 = 0
local a2 = 0
local a3 = 
{
    [0]  = "" ,
    [1]  =  "velocity ",

}
function DoClanTag()
    if (Utils.IsLocal()) then
        if (a1 < GetTickCount()) then     
            a2 = a2 + 1
            if (a2 > 1) then
                a2 = 0
            end
            Utils.SetClantag(a3[a2] .. tostring(VelocityOnGround()))
            a1 = GetTickCount() + delay
        end  
    end
end
Hack.RegisterCallback("PaintTraverse", DoClanTag)




function DrawUnits(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    -- Units
    if (not Menu.GetBool("bShowUnits") and not Menu.GetInt("iShowVert")) then 
        return
    end

    TextOffsetY = TextOffsetY + 8

    local Text = LastUnits .. " Units"
    if (Menu.GetInt("iShowVert") == 1 and math.abs(LastVert) > 10) then 
        local Plus = ""
        if (LastVert >= 0) then Plus = "+" end

        Text = Text .. " [" .. Plus ..  LastVert .. " Vert]"
    end


    -- Render Units
    if (VelocityOnGround > 0 and LastUnits > 0) then
        -- Dynamic Alpha
        local a = LastUnits
        if (a > 255) then 
            a = 255
        end
        if (OnGroundTime > 0 and (OnGroundTime + OnGroundTimeMax - GetTickCount()) <= a) then 
            a = (OnGroundTime + OnGroundTimeMax - GetTickCount())
        end
        if (a < 0) then 
            a = 0
        end

        if (Menu.GetBool("bShowUnits") and LastUnits > 100) then
            Render.Text_1(Text, Globals.ScreenWidth() / 2, PosY + 10 + TextOffsetY, 24, Color.new(255, 255, 255, a), true, true)
            TextOffsetY = TextOffsetY + 22
        end
        if (Menu.GetInt("iShowVert") == 2 and math.abs(LastVert) > 10) then
            local Plus = ""
            if (LastVert >= 0) then Plus = "+" end
            Render.Text_1("" .. Plus .. LastVert .. " Vert", Globals.ScreenWidth() / 2, PosY + 10 + TextOffsetY, 24, Color.new(204, 255, 255, a), true, true)
            TextOffsetY = TextOffsetY + 22
        end
    end
end


function DrawIndicator(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    -- JB Status
    if (not Menu.GetBool("bShowJBStatus")) then 
        return
    end

    -- Render JB Status
    if (GetTickCount() < IsJBTime) then 
        TextOffsetY = TextOffsetY + 22
        if (Menu.GetInt("iShowVelocityOld") == 2) then 
            Render.Text_1("JB", Globals.ScreenWidth() / 2, PosY + 10 + TextOffsetY, 24, Color.new(255, 255, 255, 255), true, true)
        else
            Render.Text_1("JB", Globals.ScreenWidth() / 2, PosY + 10 + TextOffsetY, 24, Color.new(255, 255, 255, 255), true, true)
        end
        TextOffsetY = TextOffsetY + 22
    end
end


-- Ignore some Times
local VelocityTime = 0
local VelocityTimeToUpdate = 64

function PaintTraverse()
    TextOffsetY = 0
    PosY = Globals.ScreenHeight() / Menu.GetFloat("fVelPosY")

    VelocityrraySize = Menu.GetFloat("fGraphSizeX")
    SizeY = Menu.GetFloat("fGraphSizeY")

    if (not Utils.IsLocalAlive()) then return end

    local pLocal = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 
    if (not pLocal) then 
        return
    end

    local Flags = pLocal:GetPropInt(fFlags_Offset)
    local fVelocity = math.floor(VecLenght2D(pLocal:GetPropVector(vVelocity_Offset)) + 0.5)
    local vVelocity = pLocal:GetPropVector(vVelocity_Offset)
    local vOrigin = pLocal:GetPropVector(vOrigin_Offset)
    local iMoveType = pLocal:GetMoveType()
    local fStamina = pLocal:GetPropFloat(fStamina_Offset)

    BuildVelocityInfo(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)

    DrawStaminaGraph(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    DrawGraph(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    -- Render Line
    if (Menu.GetBool("bShowVelocityLine1")) then 
        Render.RectFilledMultiColor(Globals.ScreenWidth() / 2 - VelocityrraySize, PosY, Globals.ScreenWidth() / 2, PosY + 1, Color.new(255, 255, 255, 0), Color.new(255, 255, 255, 255), Color.new(255, 255, 255, 255), Color.new(255, 255, 255, 0))
        Render.RectFilledMultiColor(Globals.ScreenWidth() / 2, PosY , Globals.ScreenWidth() / 2 + VelocityrraySize, PosY + 1, Color.new(255, 255, 255, 255), Color.new(255, 255, 255, 0), Color.new(255, 255, 255, 0), Color.new(255, 255, 255, 255))
        
        --Render.Line(Globals.ScreenWidth() / 2 - VelocityrraySize, PosY, Globals.ScreenWidth() / 2 + VelocityrraySize, PosY, Color.new(255, 255, 255, 255), 1)
    end

    DrawVelocity(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    DrawOldVelocity(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    DrawUnits(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)
    DrawIndicator(Flags, fVelocity, vVelocity, vOrigin, iMoveType, fStamina)

    -- Save
    if (GetTickCount() - VelocityTime > VelocityTimeToUpdate) then
        fVelocity_old = fVelocity
        VelocityTime = GetTickCount()
    end

    IsOnGroud_old = IsBit(Flags, ON_GROUND)
    vVelocity_old = vVelocity

end
Hack.RegisterCallback("PaintTraverse", PaintTraverse)

local IsX = 0
local function CreateMove(cmd, p_bSendPacket)
    if (not Menu.GetBool("bShowRoundInfo") and not Menu.GetBool("bShowLJInfo")) then return end
    if (not Utils.IsLocalAlive()) then return end

    local pLocal = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 
    if (not pLocal) then 
        return
    end
    local Flags = pLocal:GetPropInt(fFlags_Offset)
    local fVelocity = math.floor(VecLenght2D(pLocal:GetPropVector(vVelocity_Offset)) + 0.5)
    local vVelocity = pLocal:GetPropVector(vVelocity_Offset)
    local vOrigin = pLocal:GetPropVector(vOrigin_Offset)
    local iMoveType = pLocal:GetMoveType()
    local fStamina = pLocal:GetPropFloat(fStamina_Offset)


    -- Build New Graph
    for i = 2, VelocityrraySize * 2 do
        VelocityArray[i - 1] = VelocityArray[i]
        StaminaArray[i - 1] = StaminaArray[i]
        PlusOnGroundVelocityArray[i - 1] = PlusOnGroundVelocityArray[i]
        OnGroundVelocityArray[i - 1] = OnGroundVelocityArray[i] 
        IsJBArray[i - 1] = IsJBArray[i] 
    end
    VelocityArray[VelocityrraySize * 2] = fVelocity
    StaminaArray[VelocityrraySize * 2] = fStamina
    PlusOnGroundVelocityArray[VelocityrraySize * 2] = -999
    OnGroundVelocityArray[VelocityrraySize * 2] = -999
    IsJBArray[VelocityrraySize * 2] = -999


    if (cmd.mousedx > 25 and (IsX == 1 or IsX == 0)) then
        Strafes = Strafes + 1
        KZ_Strafes = KZ_Strafes + 1
        IsX = 2
    elseif (cmd.mousedx < -25 and (IsX == 2 or IsX == 0)) then
        Strafes = Strafes + 1
        KZ_Strafes = KZ_Strafes + 1
        IsX = 1
    end

    if (OnGroundTime > 0 and GetTickCount() > (OnGroundTime + KZ_TimeMax * 2)) then
        KZ_Strafes = 0
        IsX = 0
    end
end   
Hack.RegisterCallback("CreateMove", CreateMove)

function FireEventClientSideThink(Event)
    if (not Menu.GetBool("bShowRoundInfo")) then return end
    if (not Utils.IsLocal()) then 
        Jumps = 0
        Strafes = 0
        JBs = 0

        return 
    end

    if (Event:GetName() == "round_start") then 
        local Text = "[\x03VelocitySys\x01] "
        Text = Text .. "\x05Jumps: \x06" .. Jumps
        Text = Text .. "\x01 | \x05Strafes: \x06" .. Strafes
        Text = Text .. "\x01 | \x05JBs: \x06" .. JBs
    
        IChatElement.ChatPrintf(0, 0, Text)
    
        Jumps = 0
        Strafes = 0
        JBs = 0
    end
end
Hack.RegisterCallback("FireEventClientSideThink", FireEventClientSideThink)
