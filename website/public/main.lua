--[[
     _      ___         ____  ______
    | | /| / (_)__  ___/ / / / /  _/
    | |/ |/ / / _ \/ _  / /_/ // /
    |__/|__/_/_//_/\_,_/\____/___/

    v1.6.65  |  2026-07-17  |  Roblox UI Library for scripts

    To view the source code, see the `src/` folder on the official GitHub repository.

    Author: Footagesus (Footages, .ftgs, oftgs)
    Github: https://github.com/article-hub-studio/WindUI-Skibidi
    Discord: https://discord.gg/ftgs-development-hub-1300692552005189632
    License: MIT
]]

type ConfigType__DARKLUA_TYPE_a={
Object:Instance,
Camera:Instance?,
Interactive:boolean?,
Height:number?,
Focused:boolean,

Window:any,
WindUI:any,
Tab:any,
Parent:Instance,
}local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()

local b

local d={
New=nil,
Init=nil,
Shapes={
Circle={
Image="rbxassetid://111665032676235",
Rect=Rect.new(512,512,512,512),
Radius=512,
},
CircleOutline={
Image="rbxassetid://108556680453287",
Rect=Rect.new(512,512,512,512),
Radius=512,
},
CircleGlass={
Image="rbxassetid://95600044758841",
Rect=Rect.new(512,512,512,512),
Radius=512,
},



SquircleH={
Image="rbxassetid://125083578015333",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
SquircleHOutline={
Image="rbxassetid://107043713170567",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
SquircleHGlass={
Image="rbxassetid://84819521201001",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
["SquircleH-TL-TR"]={
Image="rbxassetid://90680657206619",
Rect=Rect.new(807,512,807,512),
Radius=325,
AutoChange=false,
},
["SquircleH-BL-BR"]={
Image="rbxassetid://99216342056719",
Rect=Rect.new(0,512,0,512),
Radius=325,
AutoChange=false,
},

SquircleV={
Image="rbxassetid://124965260437653",
Rect=Rect.new(325,512,325,512),
Radius=325,
},
SquircleVOutline={
Image="rbxassetid://88808835404198",
Rect=Rect.new(325,512,325,512),
Radius=325,
},
SquircleVGlass={
Image="rbxassetid://124982801466667",
Rect=Rect.new(325,512,325,512),
Radius=325,
},

Squircle={
Image="rbxassetid://89641024074289",
Rect=Rect.new(460,460,460,460),
Radius=310,
},
SquircleOutline={
Image="rbxassetid://74029063732681",
Rect=Rect.new(512,512,512,512),
Radius=310,
},
SquircleGlass={
Image="rbxassetid://131126436897551",
Rect=Rect.new(512,512,512,512),
Radius=310,
},

["Squircle-TL-TR"]={
Image="rbxassetid://75712142040725",
Rect=Rect.new(512,512,512,512),
Radius=310,
AutoChange=false,
},
["Squircle-BL-BR"]={
Image="rbxassetid://83676684425544",
Rect=Rect.new(512,0,512,0),
Radius=310,
AutoChange=false,
},Square=
{
Image="rbxassetid://82909646051652",
Rect=Rect.new(512,512,512,512),
Radius=512,
AutoChange=false,
},
},
}

function d.Init(e,f)
b=f
return e.New
end

function d.New(e,f,g,h,i,j,l)
local m={
Radius=f or 0,
Type=g or"Circle",
GetRadius=nil,
GetType=nil,
SetRadius=nil,
SetType=nil,
}

local p={
["Glass-0.7"]="SquircleGlass",
["Glass-1"]="SquircleGlass",
["Glass-1.4"]="SquircleGlass",
["Squircle-Outline"]="SquircleOutline",
}

local function GetShape(r)
return d.Shapes[p[r]or r]or d.Shapes.Circle
end

local r=b.New(j and"ImageButton"or"ImageLabel",{
Image="",
ScaleType=l~=false and"Slice"or nil,
SliceCenter=m.Type~="Squircle"and Rect.new(512,512,512,512)or nil,
SliceScale=1,
ThemeTag=h and h.ThemeTag or nil,
BackgroundTransparency=1,
},i)

for u,v in next,h do
if not table.find({"ThemeTag"},u)then
r[u]=v
end
end

function m.SetRadius(u,v)
m.Radius=v
r.SliceScale=math.max(v/GetShape(m.Type).Radius,0.0001)
return m
end

function m.SetType(u,v)
m.Type=v
local x=GetShape(v)
r.Image=x.Image
r.SliceCenter=x.Rect
m:SetRadius(m.Radius)
return m
end

function m.GetRadius(u)
return m.Radius
end

function m.GetType(u)
return m.Type
end

m:SetRadius(f)
m:SetType(g)

b.AddSignal(r:GetPropertyChangedSignal"AbsoluteSize",function()
local u=GetShape(m.Type)
if u.AutoChange==false then
return
end

if string.find(m.Type,"Squircle")then
local v=string.find(m.Type,"Glass")and"Glass"or nil
local x=string.find(m.Type,"Outline")and"Outline"or nil

local z=math.round(r.AbsoluteSize.X/b.UIScale)
local A=math.round(r.AbsoluteSize.Y/b.UIScale)

local B=m.Radius~=0 and m.Radius or math.min(z,A)/2
local C=d.Shapes.Squircle.Radius/1024
local F=B/math.min(z,A)

local G

if z>A then
if F>=C then
G="SquircleH"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
elseif z<A then
if F>=C then
G="SquircleV"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
else
if F>=C then
G="Circle"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
end

if G~=m:GetType()then
m:SetType(G)
end
end
end)

return r,m
end

return d end function a.b()

local b=(cloneref or clonereference or function(b)
return b
end)

local d=b(game:GetService"ReplicatedStorage")
local e=b(game:GetService"HttpService")
local f=b(game:GetService"RunService")

local g="https://article-hub-studio.github.io/WindUI-Skibidi/vendor/icons/Main-v2.lua"

local function LoadBaseIcons()
local h=d:FindFirstChild"GetIcons"
if
h
and h:IsA"RemoteFunction"
and(f:IsStudio()or h:GetAttribute"WindUIIcons"==true)
then
local i,j=pcall(function()
return h:InvokeServer()
end)
if i and typeof(j)=="table"then
return j
end
end

local i,j=pcall(function()
if game.HttpGet then
return game:HttpGet(g)
end
return e:GetAsync(g)
end)
if i and type(j)=="string"and type(loadstring)=="function"then
local l=loadstring(j)
if l then
local m,p=pcall(l)
if m and typeof(p)=="table"then
return p
end
end
end

warn"[ WindUI.Icons ] Unable to load the base icon catalog; custom sources remain available"
return{}
end

local h=LoadBaseIcons()
h.AdapterVersion=3

local i={
lucidev="lucide",
lucideicons="lucide",
sf="sfsymbols",
sfsymbol="sfsymbols",
sf_symbols="sfsymbols",
gravityui="gravity",
gravity_ui="gravity",
}

h.Icons=if typeof(h.Icons)=="table"then h.Icons else{}
h.IconsType=h.IconsType or"lucide"
h.SourceAliases=if typeof(h.SourceAliases)=="table"then h.SourceAliases else{}
h.Resolvers=if typeof(h.Resolvers)=="table"then h.Resolvers else{}
h.FallbackAcrossSources=h.FallbackAcrossSources~=false

for j,l in i do
if h.SourceAliases[j]==nil then
h.SourceAliases[j]=l
end
end

local j

local function NormalizeSourceName(l)
if type(l)~="string"then
return nil
end

local m=l:lower():gsub("%s+",""):gsub("[^%w_%-]","")
if m==""then
return nil
end
return m
end

local function ResolveSourceAlias(l)
local m=NormalizeSourceName(l)
local p={}

for r=1,8 do
if not m or p[m]then
break
end
p[m]=true

local u=h.SourceAliases[m]
if not u then
break
end
m=NormalizeSourceName(u)
end

return m
end

local function NormalizeImage(l)
if type(l)=="number"then
return"rbxassetid://"..tostring(l)
end
if type(l)~="string"then
return nil
end

if l:match"^%d+$"then
return"rbxassetid://"..l
end
return l
end

local function IsDirectImage(l)
if type(l)=="number"then
return true
end
if type(l)~="string"then
return false
end

return l:match"^%d+$"~=nil
or l:match"^rbxassetid://"~=nil
or l:match"^rbxthumb://"~=nil
or l:match"^rbxgameasset://"~=nil
or l:match"^https?://"~=nil
end

local function NormalizeVector2(l)
if typeof(l)=="Vector2"then
return l
end
if typeof(l)=="table"then
return Vector2.new(tonumber(l.X or l.x or l[1])or 0,tonumber(l.Y or l.y or l[2])or 0)
end
return Vector2.zero
end

local function NormalizeDescriptor(l)
if IsDirectImage(l)then
return{
Image=NormalizeImage(l),
ImageRectSize=Vector2.zero,
ImageRectPosition=Vector2.zero,
Parts=nil,
}
end

if typeof(l)~="table"then
return nil
end

local m=l.Image or l.Asset or l.AssetId or l.Id or l.URL or l.Url
if not IsDirectImage(m)then
return nil
end

return{
Image=NormalizeImage(m),
ImageRectSize=NormalizeVector2(l.ImageRectSize or l.RectSize or l.Size),
ImageRectPosition=NormalizeVector2(
l.ImageRectPosition or l.ImageRectOffset or l.RectPosition or l.Offset
),
Parts=l.Parts,
}
end

local function ParseIconReference(l)
if typeof(l)=="table"then
return l.Source or l.Pack or l.Library or l.Type,l.Name or l.Icon or l.Key,l
end

if type(l)~="string"or IsDirectImage(l)then
return nil,l,l
end

local m,p=l:match"^@([%w_%-]+)/(.+)$"
if not m then
m,p=l:match"^([%w_%-]+):(.+)$"
end
if not m then
m,p=l:match"^([%w_%-]+)/(.+)$"
end

return m,p or l,l
end

local function FindSource(l)
local m=ResolveSourceAlias(l)
if not m then
return nil,nil
end

if h.Icons[m]then
return h.Icons[m],m
end

for p,r in h.Icons do
if NormalizeSourceName(p)==m then
return r,p
end
end

return nil,m
end

local function GetSourceNames()
local l={}
for m in h.Icons do
table.insert(l,tostring(m))
end
table.sort(l,function(m,p)
return m:lower()<p:lower()
end)
return l
end

local l

local function ResolvePackIcon(m,p,r)
if typeof(m)~="table"or p==nil then
return nil
end

local u=if typeof(m.Icons)=="table"then m.Icons else m
local v=u[p]
if v==nil then
local x=tostring(p):lower()
for z,A in u do
if tostring(z):lower()==x then
v=A
break
end
end
end

if typeof(v)=="table"and v.Alias then
return l(v.Alias,nil,(r or 0)+1)
end

local x=typeof(v)=="table"
and(v.Image or v.Asset or v.AssetId or v.Id or v.URL or v.Url)
or v
local z=NormalizeDescriptor(v)
if not z then
return nil
end

if typeof(m.Spritesheets)=="table"then
z.Image=m.Spritesheets[x]
or m.Spritesheets[tostring(x)]
or m.Spritesheets[z.Image]
or m.Spritesheets[tostring(z.Image)]
or z.Image
end

return z
end

local function ResolveProviderIcon(m,p)
local r=h.Resolvers[ResolveSourceAlias(m)]
if typeof(r)~="function"then
return nil
end

local u,v=pcall(r,p,m)
if not u then
warn(string.format("[ WindUI.Icons ] Source '%s' failed: %s",tostring(m),tostring(v)))
return nil
end

return NormalizeDescriptor(v)
end

l=function(m,p,r)
if(r or 0)>8 then
return nil
end

local u=NormalizeDescriptor(m)
if u then
return u
end

local v,x,z=ParseIconReference(m)
if typeof(z)=="table"and z.Alias then
return l(z.Alias,p,(r or 0)+1)
end

local A=ResolveSourceAlias(v or p or h.IconsType)
if A then
local B=FindSource(A)
local C=ResolvePackIcon(B,x,r)or ResolveProviderIcon(A,x)
if C then
return C
end
end

if v or not h.FallbackAcrossSources then
return nil
end

for B,C in GetSourceNames()do
if ResolveSourceAlias(C)~=A then
local F=ResolvePackIcon(h.Icons[C],x,r)
if F then
return F
end
end
end

for B,C in h.Resolvers do
if B~=A and typeof(C)=="function"then
local F=ResolveProviderIcon(B,x)
if F then
return F
end
end
end

return nil
end

local function FormatDescriptor(m,p)
if not m then
return nil
end

if p==false and m.ImageRectSize==Vector2.zero and not m.Parts then
return m.Image
end

return{m.Image,m}
end

function h.AddSourceAlias(m,p)
local r=NormalizeSourceName(m)
local u=NormalizeSourceName(p)
assert(r and u,"AddSourceAlias: alias and source must be non-empty strings")
h.SourceAliases[r]=u
return h
end

function h.RegisterIconSource(m,p,r)
local u=NormalizeSourceName(m)
assert(u,"RegisterIconSource: source must be a non-empty string")

if typeof(p)=="function"then
h.Resolvers[u]=p
elseif typeof(p)=="table"then
h.AddIcons(u,p)
else
error"RegisterIconSource: provider must be a function or icon table"
end

if typeof(r)=="table"then
for v,x in r.Aliases or{}do
h.AddSourceAlias(x,u)
end
end

return h
end

function h.AddIcons(m,p)
local r=NormalizeSourceName(m)
assert(r and typeof(p)=="table","AddIcons: packName must be string and iconsData must be table")

local u=h.Icons[r]
if typeof(u)~="table"or typeof(u.Icons)~="table"then
u={
Icons={},
Spritesheets={},
}
h.Icons[r]=u
end

for v,x in p do
local z=NormalizeDescriptor(x)
if z then
u.Icons[v]=z
u.Spritesheets[z.Image]=z.Image
elseif typeof(x)=="table"and x.Alias then
u.Icons[v]={Alias=x.Alias}
else
warn(string.format("[ WindUI.Icons ] Ignored invalid icon '%s:%s'",r,tostring(v)))
end
end

return h
end

h.RegisterIconPack=h.AddIcons
h.AddIconSource=h.RegisterIconSource

function h.AddIcon(m,p,r)
return h.AddIcons(m,{[p]=r})
end

function h.SetIconsType(m)
local p=ResolveSourceAlias(m)
assert(p,"SetIconsType: icon type must be a non-empty string")
h.IconsType=p
return h
end

function h.GetIconSources()
local m=GetSourceNames()
for p in h.Resolvers do
if not table.find(m,p)then
table.insert(m,p)
end
end
table.sort(m)
return m
end

function h.HasIcon(m,p)
return l(m,p,0)~=nil
end

function h.Init(m,p)
h.New=m
h.IconThemeTag=p
j=m
return h
end

function h.Icon(m,p,r)
return FormatDescriptor(l(m,p,0),r~=false)
end

function h.GetIcon(m,p)
return h.Icon(m,p,false)
end

function h.Icon2(m,p)
return h.Icon(m,p,true)
end

local function ResolveStyle(m,p,r)
local u=m[p]
if u==nil then
u=m[1]
end
if u==nil then
u=r
end

return{
ThemeTag=typeof(u)=="string"and u or nil,
Color=typeof(u)=="Color3"and u or nil,
Value=typeof(u)=="number"and u or nil,
}
end

local function CreateImageLabel(m)
if j then
return j("ImageLabel",m)
end

local p=Instance.new"ImageLabel"
for r,u in m do
if r~="ThemeTag"and u~=nil then
p[r]=u
end
end
return p
end

function h.Image(m)
m=if typeof(m)=="table"then m else{}
local p={
Icon=m.Icon,
Type=m.Type,
Colors=m.Colors or{h.IconThemeTag or Color3.new(1,1,1)},
Transparency=m.Transparency or{0},
Size=m.Size or UDim2.fromOffset(24,24),
IconFrame=nil,
}

local r=h.Icon2(p.Icon,p.Type)
local u=r and r[1]or""
local v=r and r[2]
or{
ImageRectSize=Vector2.zero,
ImageRectPosition=Vector2.zero,
}
local x=ResolveStyle(p.Colors,1,h.IconThemeTag or Color3.new(1,1,1))
local z=ResolveStyle(p.Transparency,1,0)

local A=CreateImageLabel{
Name="Icon",
Size=p.Size,
BackgroundTransparency=1,
ImageColor3=x.Color,
ImageTransparency=z.Value,
ThemeTag=x.ThemeTag and{
ImageColor3=x.ThemeTag,
ImageTransparency=z.ThemeTag,
}or nil,
Image=u,
ImageRectSize=v.ImageRectSize,
ImageRectOffset=v.ImageRectPosition,
}

local B=ParseIconReference(p.Icon)
for C,F in v.Parts or{}do
local G=h.Icon2(F,B or p.Type)
if G then
local H=ResolveStyle(p.Colors,C+1,x.Color or x.ThemeTag)
local J=ResolveStyle(p.Transparency,C+1,z.Value or 0)
CreateImageLabel{
Name="Part"..tostring(C),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ImageColor3=H.Color,
ImageTransparency=J.Value,
ThemeTag=H.ThemeTag and{
ImageColor3=H.ThemeTag,
ImageTransparency=J.ThemeTag,
}or nil,
Image=G[1],
ImageRectSize=G[2].ImageRectSize,
ImageRectOffset=G[2].ImageRectPosition,
Parent=A,
}
end
end

p.IconFrame=A
return p
end

return h end function a.c()

return function(b)
return{


Primary="Icon",

White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),

Dialog="Accent",

Background="Accent",
BackgroundTransparency=0,
Hover="Text",

PanelBackground="White",
PanelBackgroundTransparency=0.95,

WindowBackground="Background",

WindowShadow="Black",


WindowTopbarTitle="Text",
WindowTopbarAuthor="Text",
WindowTopbarIcon="Icon",
WindowTopbarButtonIcon="Icon",


WindowSearchBarBackground="Dialog",

TabBackground="Hover",
TabBackgroundHover="Hover",
TabBackgroundHoverTransparency=0.97,
TabBackgroundActive="Hover",
TabBackgroundActiveTransparency=0.93,
TabText="Text",
TabTextTransparency=0.3,
TabTextTransparencyActive=0,
TabTitle="Text",
TabIcon="Icon",
TabIconTransparency=0.4,
TabIconTransparencyActive=0.1,
TabBorderTransparency=1,
TabBorderTransparencyActive=0.75,
TabBorder="White",

ElementBackground="Text",
ElementBackgroundTransparency=0.93,
ElementBackgroundHover=b:AddColor("ElementBackground","#ffffff",0.1),
ElementTitle="Text",
ElementDesc="Text",
ElementIcon="Icon",

RadioGroupBackground="ElementBackground",
RadioGroupText="Text",
RadioGroupBorder="Text",
RadioGroupActive="Primary",

CheckboxGroupBackground="ElementBackground",
CheckboxGroupText="Text",
CheckboxGroupBorder="Text",
CheckboxGroupActive="Primary",
CheckboxGroupIcon="White",

SegmentedControlBackground="ElementBackground",
SegmentedControlActive="Primary",
SegmentedControlText="Text",

StepperButton="ElementBackground",
StepperValueBackground="ElementBackground",
StepperIcon="Icon",
StepperText="Text",

BadgeBackground="Primary",
BadgeText="White",
BadgeIcon="White",

KeyValueIcon="Icon",
ChipListBackground="ElementBackground",
TimelineLine="Text",
AccordionBackground="ElementBackground",
AccordionIcon="Icon",
TabBoxTabBackground="ElementBackground",
TabBoxIcon="Icon",
EmptyStateIcon="Icon",
DiscordCardBackground="ElementBackground",
DiscordCardAccent="Primary",
Path2DBackground="ElementBackground",
Path2DTrack="ElementBackground",
Path2DLine="Primary",
Path2DMarker="Primary",
Path2DLabel="Text",

PopupBackground="Background",
PopupBackgroundTransparency="BackgroundTransparency",
PopupTitle="Text",
PopupContent="Text",
PopupIcon="Icon",

DialogBackground="Dialog",
DialogBackgroundTransparency="BackgroundTransparency",
DialogTitle="Text",
DialogContent="Text",
DialogIcon="Icon",

Toggle="Button",
ToggleBar="White",

Checkbox="Primary",
CheckboxIcon="White",
CheckboxBorder="White",
CheckboxBorderTransparency=0.75,

SliderIcon="Icon",

Slider="Primary",
SliderThumb="White",
SliderIconFrom="SliderIcon",
SliderIconTo="SliderIcon",

ProgressBar="Primary",
ProgressBarTrack="Text",
ProgressBarTrackTransparency=0.9,
ProgressBarText="Text",

Tooltip=Color3.fromHex"4C4C4C",
TooltipText="White",
TooltipSecondary="Primary",
TooltipSecondaryText="White",

TabSectionIcon="Icon",

SectionIcon="Icon",

SectionExpandIcon="Icon",
SectionExpandIconTransparency=0.4,
SectionBox="Text",
SectionBoxTransparency=0.95,
SectionBoxBorder="White",
SectionBoxBorderTransparency=0.75,
SectionBoxBackground="Text",
SectionBoxBackgroundTransparency=0.97,

SearchBarBorder="White",
SearchBarBorderTransparency=0.75,

Notification="Background",
Notification2="White",
Notification2Transparency=0.965,
NotificationTitle="Text",
NotificationTitleTransparency=0,
NotificationContent="Text",
NotificationContentTransparency=0.4,
NotificationDuration="White",
NotificationDurationTransparency=0.96,
NotificationBorder="White",
NotificationBorderTransparency=0.8,

DropdownTabBorder="White",
DropdownTabBackground="ElementBackground",
DropdownBackground="Background",

LabelBackground="White",
LabelBackgroundTransparency=0.95,

ViewportBackground="ElementBackground",
ViewportBackgroundTransparency="ElementBackgroundTransparency",
}
end end function a.d()

local b=(cloneref or clonereference or function(b)
return b
end)

local d=b(game:GetService"RunService")
local e=b(game:GetService"UserInputService")
local f=b(game:GetService"TweenService")
local g=b(game:GetService"LocalizationService")
local h=b(game:GetService"HttpService")

local i=a.load'a'
local j=a.load'b'local l=

d.Heartbeat

j.SetIconsType"lucide"

local m

local p
p={
Font="rbxassetid://12187365364",
Localization=nil,
CanDraggable=true,
Theme=nil,
Themes=nil,
Icons=j,
IconAdapterVersion=j.AdapterVersion or 1,
Signals={},
Objects={},
LocalizationObjects={},
UIScale=1,
FontObjects={},
Language=string.match(g.SystemLocaleId,"^[a-z]+"),
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
},
VideoFrame={
BorderSizePixel=0,
},
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
},
ThemeFallbacks=nil,





















ThemeChangeCallbacks={},
}

function p.Init(r)
m=r

p.ThemeFallbacks=a.load'c'(p)

p.UIScale=r.UIScale

i:Init(p)
end

function p.AddSignal(r,u)
local v=r:Connect(u)
table.insert(p.Signals,v)
return v
end

function p.DisconnectAll()
for r,u in next,p.Signals do
local v=table.remove(p.Signals,r)
v:Disconnect()
end
end

function p.SafeCallback(r,...)
if not r then
return
end

local u,v=pcall(r,...)
if not u then
if m and m.Window and m.Window.Debug then local
x, z=v:find":%d+: "

warn("[ WindUI: DEBUG Mode ] "..v)

return m:Notify{
Title="DEBUG Mode: Error",
Content=not z and v or v:sub(z+1),
Style="Error",
Duration=8,
}
end
end
end

function p.Gradient(r,u)
if m and m.Gradient then
return m:Gradient(r,u)
end

local v={}
local x={}

for z,A in next,r do
local B=tonumber(z)
if B then
B=math.clamp(B/100,0,1)
table.insert(v,ColorSequenceKeypoint.new(B,A.Color))
table.insert(x,NumberSequenceKeypoint.new(B,A.Transparency or 0))
end
end

table.sort(v,function(z,A)
return z.Time<A.Time
end)
table.sort(x,function(z,A)
return z.Time<A.Time
end)

if#v<2 then
error"ColorSequence requires at least 2 keypoints"
end

local z={
Color=ColorSequence.new(v),
Transparency=NumberSequence.new(x),
}

if u then
for A,B in pairs(u)do
z[A]=B
end
end

return z
end

function p.SetTheme(r)
if typeof(r)~="table"then
r=p.Theme or(p.Themes and p.Themes.Dark)
end
if typeof(r)~="table"then
return nil
end

local u=p.Theme
p.Theme=r
p.UpdateTheme(nil,false)

for v,x in next,p.ThemeChangeCallbacks do
p.SafeCallback(x,r,u)
end

return r
end

function p.AddFontObject(r)
table.insert(p.FontObjects,r)
p.UpdateFont(p.Font)
end

function p.UpdateFont(r)
p.Font=r
for u,v in next,p.FontObjects do
v.FontFace=Font.new(r,v.FontFace.Weight,v.FontFace.Style)
end
end

function p.GetThemeProperty(r,u)
local function getValue(v,x)
if typeof(x)~="table"then
return nil
end

local z=x[v]

if z==nil then
return nil
end

if typeof(z)=="string"and string.sub(z,1,1)=="#"then
return Color3.fromHex(z)
end

if typeof(z)=="Color3"then
return z
end

if typeof(z)=="number"then
return z
end

if typeof(z)=="table"and z.Color and z.Transparency then
return z
end

if typeof(z)=="function"then
return z(x)
end

return z
end

u=if typeof(u)=="table"then u else p.Theme

local v=getValue(r,u)
if v~=nil then
if typeof(v)=="string"and string.sub(v,1,1)~="#"then
local x=p.GetThemeProperty(v,u)
if x~=nil then
return x
end
else
return v
end
end

local x=p.ThemeFallbacks and p.ThemeFallbacks[r]
if x~=nil then
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
return p.GetThemeProperty(x,u)
else
return getValue(r,{[r]=x})
end
end

local z=p.Themes and p.Themes.Dark
v=getValue(r,z)
if v~=nil then
if typeof(v)=="string"and string.sub(v,1,1)~="#"then
local A=p.GetThemeProperty(v,z)
if A~=nil then
return A
end
else
return v
end
end

if x~=nil then
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
return p.GetThemeProperty(x,z)
else
return getValue(r,{[r]=x})
end
end

return nil
end

function p.AddThemeObject(r,u,v)
if p.Objects[r]then
for x,z in pairs(u)do
p.Objects[r].Properties[x]=z
end
else
p.Objects[r]={Object=r,Properties=u}
end

if not v then
p.UpdateTheme(r,false)
end
return r
end

function p.AddLangObject(r)
local u=p.LocalizationObjects[r]
if not u then
return
end

local v=u.Object

p.SetLangForObject(r)

return v
end

function p.UpdateTheme(r,u,v,x,z,A)
local function ApplyTheme(B)
for C,F in pairs(B.Properties or{})do
local G=p.GetThemeProperty(F,p.Theme)
if G~=nil then
if typeof(G)=="Color3"then
local H=B.Object:FindFirstChild"LibraryGradient"
if H then
H:Destroy()
end

if v then
p.Tween(
B.Object,
x or 0.2,
{[C]=G},
z or Enum.EasingStyle.Quint,
A or Enum.EasingDirection.Out
):Play()
elseif u then
p.Tween(B.Object,0.08,{[C]=G}):Play()
else
B.Object[C]=G
end
elseif typeof(G)=="table"and G.Color and G.Transparency then
B.Object[C]=Color3.new(1,1,1)

local H=B.Object:FindFirstChild"LibraryGradient"
if not H then
H=Instance.new"UIGradient"
H.Name="LibraryGradient"
H.Parent=B.Object
end

H.Color=G.Color
H.Transparency=G.Transparency

for J,L in pairs(G)do
if J~="Color"and J~="Transparency"and H[J]~=nil then
H[J]=L
end
end
elseif typeof(G)=="number"then
if v then
p.Tween(
B.Object,
x or 0.2,
{[C]=G},
z or Enum.EasingStyle.Quint,
A or Enum.EasingDirection.Out
):Play()
elseif u then
p.Tween(B.Object,0.08,{[C]=G}):Play()
else
B.Object[C]=G
end
end
else
local H=B.Object:FindFirstChild"LibraryGradient"
if H then
H:Destroy()
end
end
end
end

if r then
local B=p.Objects[r]
if B then
ApplyTheme(B)
end
else
for B,C in pairs(p.Objects)do
ApplyTheme(C)
end
end
end

function p.SetThemeTag(r,u,v,x,z)
p.AddThemeObject(r,u)
p.UpdateTheme(r,false,true,v,x,z)
end

function p.SetLangForObject(r)
if p.Localization and p.Localization.Enabled then
local u=p.LocalizationObjects[r]
if not u then
return
end

local v=u.Object
local x=u.TranslationId

local z=p.Localization.Translations[p.Language]
if z and z[x]then
v.Text=z[x]
else
local A=p.Localization
and p.Localization.Translations
and p.Localization.Translations.en
or nil
if A and A[x]then
v.Text=A[x]
else
v.Text="["..x.."]"
end
end
end
end

function p.ChangeTranslationKey(r,u,v)
if p.Localization and p.Localization.Enabled then
local x=string.match(v,"^"..p.Localization.Prefix.."(.+)")
if x then
for z,A in ipairs(p.LocalizationObjects)do
if A.Object==u then
A.TranslationId=x
p.SetLangForObject(z)
return
end
end

table.insert(p.LocalizationObjects,{
TranslationId=x,
Object=u,
})
p.SetLangForObject(#p.LocalizationObjects)
end
end
end

function p.UpdateLang(r)
if r then
p.Language=r
end

for u=1,#p.LocalizationObjects do
local v=p.LocalizationObjects[u]
if v.Object and v.Object.Parent~=nil then
p.SetLangForObject(u)
else
p.LocalizationObjects[u]=nil
end
end
end

function p.SetLanguage(r)
p.Language=r
p.UpdateLang()
end

function p.Icon(r,u)
return j.Icon(r,nil,u~=false)
end

function p.AddIcons(r,u)
return j.AddIcons(r,u)
end

function p.AddIcon(r,u,v)
return j.AddIcon(r,u,v)
end

function p.RegisterIconSource(r,u,v)
return j.RegisterIconSource(r,u,v)
end

p.RegisterIconPack=p.AddIcons
p.AddIconSource=p.RegisterIconSource

function p.AddIconSourceAlias(r,u)
return j.AddSourceAlias(r,u)
end

function p.SetIconSource(r)
return j.SetIconsType(r)
end

function p.GetIconSources()
return j.GetIconSources()
end

function p.HasIcon(r,u)
return j.HasIcon(r,u)
end

function p.New(r,u,v)
local x=Instance.new(r)

for z,A in next,p.DefaultProperties[r]or{}do
x[z]=A
end

for z,A in next,u or{}do
if z~="ThemeTag"then
x[z]=A
end
if p.Localization and p.Localization.Enabled and z=="Text"then
local B=string.match(A,"^"..p.Localization.Prefix.."(.+)")
if B then
local C=#p.LocalizationObjects+1
p.LocalizationObjects[C]={TranslationId=B,Object=x}

p.SetLangForObject(C)
end
end
end

for z,A in next,v or{}do
A.Parent=x
end

if u and u.ThemeTag then
p.AddThemeObject(x,u.ThemeTag)
end
if u and u.FontFace then
p.AddFontObject(x)
end
return x
end

function p.Tween(r,u,v,...)
return f:Create(r,TweenInfo.new(u,...),v)
end

function p.ClampTransparency(r,u)
local v=tonumber(r)
if v==nil then
return u
end

return math.clamp(v,0,1)
end

function p.ToUDimRadius(r,u)
if typeof(r)=="UDim"then
return r
end

if typeof(u)=="UDim"then
return u
end

return UDim.new(0,tonumber(r)or tonumber(u)or 0)
end

function p.ApplyCornerRadii(r,u,v)
if typeof(r)~="Instance"or not r:IsA"UICorner"then
return r
end

local x=p.ToUDimRadius(u,r.CornerRadius)
local z=v
or{
TopLeft=true,
TopRight=true,
BottomLeft=true,
BottomRight=true,
}
local function ResolveCorner(A)
if A==false then
return UDim.new(0,0)
end
if typeof(A)=="UDim"then
return A
end
if type(A)=="number"then
return UDim.new(0,math.max(A,0))
end
return x
end

r.CornerRadius=x

pcall(function()
r.TopLeftRadius=ResolveCorner(z.TopLeft)
r.TopRightRadius=ResolveCorner(z.TopRight)
r.BottomRightRadius=ResolveCorner(z.BottomRight)
r.BottomLeftRadius=ResolveCorner(z.BottomLeft)
end)

return r
end

function p.DefaultCornerMap()
return{
TopLeft=true,
TopRight=true,
BottomLeft=true,
BottomRight=true,
}
end

function p.GetLinkedCornerDirection(r,u,v)
if typeof(v)=="table"then
local x=tostring(v.Orientation or v.Direction or""):lower()
if x=="horizontal"or x=="row"or x=="x"then
return true
elseif x=="vertical"or x=="column"or x=="y"then
return false
end
end

local x=u or(r and r.__type)

if x=="Group"then
return true
end

if x=="HStack"then
if r and r.IsStacked==true then
return false
end

local z=r and r.ElementFrame
local A=z and z:FindFirstChildWhichIsA"UIListLayout"
if A then
return A.FillDirection==Enum.FillDirection.Horizontal
end

return true
end

return false
end

function p.GetLinkedCornerShape(r,u,v,x,z)
return p:GetElementPosition(
r,
u,
p.GetLinkedCornerDirection(v,x,z),
z
)
end








































































function p.NewRoundFrame(r,u,v,x,z,A)
return i:New(r,u,v,x,z,nil)
end

local r=p.New local u=
p.Tween

function p.SetDraggable(v)
p.CanDraggable=v
end

function p.Drag(v,x,z)
local A=m.GenerateGUID()

local B
local C=false
local F,G
local H

local J={
CanDraggable=true,
}

if not x or typeof(x)~="table"then
x={v}
end

local function update(L)
if not C or not J.CanDraggable then
return
end

local M=L.Position-F
p.Tween(v,0.02,{
Position=UDim2.new(
G.X.Scale,
G.X.Offset+M.X,
G.Y.Scale,
G.Y.Offset+M.Y
),
}):Play()
end

for L,M in pairs(x)do
M.InputBegan:Connect(function(N)
if not J.CanDraggable or C then
return
end

if
N.UserInputType==Enum.UserInputType.MouseButton1
or N.UserInputType==Enum.UserInputType.Touch
then
if m and m.CurrentInput and m.CurrentInput~=A then
return
end

m.CurrentInput=A

C=true
H=N
B=M
F=N.Position
G=v.Position

if z and typeof(z)=="function"then
z(true,B)
end
end
end)
end

e.InputChanged:Connect(function(L)
if not C then
return
end
if m.CurrentInput and m.CurrentInput~=A then
return
end

if H.UserInputType==Enum.UserInputType.MouseButton1 then
if L.UserInputType==Enum.UserInputType.MouseMovement then
update(L)
end
elseif H.UserInputType==Enum.UserInputType.Touch then
if L==H then
update(L)
end
end
end)

e.InputEnded:Connect(function(L)
if not C or m.CurrentInput~=A then
return
end

if
L==H
or(
H.UserInputType==Enum.UserInputType.MouseButton1
and L.UserInputType==Enum.UserInputType.MouseButton1
)
then
m.CurrentInput=nil
C=false
H=nil
B=nil

if z and typeof(z)=="function"then
z(false,nil)
end
end
end)

function J.Set(L,M)
J.CanDraggable=M
end

return J
end

j.Init(r,"Icon")

function p.SanitizeFilename(v)
local x=v:match"([^/]+)$"or v

x=x:gsub("%.[^%.]+$","")

x=x:gsub("[^%w%-_]","_")

if#x>50 then
x=x:sub(1,50)
end

return x
end

function p.Image(v,x,z,A,B,C,F,G)
local H=if typeof(A)=="table"then A.Folder else A
H=tostring(H or"Temp")
x=p.SanitizeFilename(tostring(x or"Image"))
B=tostring(B or"Image")

local J=type(v)=="string"
and v:match"^https?://"~=nil
and v:find("roblox.com",1,true)==nil
local L=if J or typeof(v)=="Instance"then nil else p.Icon(v)
local M=(L or F)and C and(G or"Icon")or nil

local N=r("Frame",{
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
},{
r("ImageLabel",{
Name="ImageLabel",
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ScaleType=Enum.ScaleType.Crop,
ThemeTag=M and{
ImageColor3=M,
}or nil,
},{
r("UICorner",{
CornerRadius=UDim.new(0,tonumber(z)or 0),
}),
}),
})

if typeof(v)=="Instance"then
N.ImageLabel:Destroy()
local O=v:Clone()
O.Name="ImageLabel"
if O:IsA"GuiObject"then
O.Size=UDim2.fromScale(1,1)
O.Position=UDim2.fromScale(0.5,0.5)
O.AnchorPoint=Vector2.new(0.5,0.5)
end
O.Parent=N
elseif L then
N.ImageLabel:Destroy()
local O=j.Image{
Icon=v,
Size=UDim2.fromScale(1,1),
Colors={
M or false,
"Button",
},
}.IconFrame
O.Name="ImageLabel"
O.Parent=N
elseif J then
local O="WindUI/"..H.."/assets/."..B.."-"..x..".png"
local P,Q=pcall(function()
task.spawn(function()
local P=p.Request and p.Request{
Url=v,
Method="GET",
}or nil
local Q=typeof(P)=="table"and P.Body or P

if Q and writefile then
writefile(O,Q)
end

local R,S=pcall(getcustomasset,O)
if R then
N.ImageLabel.Image=S
elseif not R then
warn(string.format("[ WindUI.Creator ] Failed to load '%s': %s",O,tostring(S)))
end
end)
end)

if not P then
warn(string.format("[ WindUI.Creator ] URL image is unavailable: %s",tostring(Q)))
N.Visible=false
end
elseif v==nil or v==""then
N.Visible=false
elseif type(v)=="number"then
N.ImageLabel.Image="rbxassetid://"..tostring(v)
elseif type(v)=="string"then
N.ImageLabel.Image=v
else
warn(string.format("[ WindUI.Creator ] Unsupported image value: %s",typeof(v)))
N.Visible=false
end

return N
end

function p.Color3ToHSB(v)
local x,z,A=v.R,v.G,v.B
local B=math.max(x,z,A)
local C=math.min(x,z,A)
local F=B-C

local G=0
if F~=0 then
if B==x then
G=(z-A)/F%6
elseif B==z then
G=(A-x)/F+2
else
G=(x-z)/F+4
end
G=G*60
else
G=0
end

local H=(B==0)and 0 or(F/B)
local J=B

return{
h=math.floor(G+0.5),
s=H,
b=J,
}
end

function p.GetPerceivedBrightness(v)
local x=v.R
local z=v.G
local A=v.B
return 0.299*x+0.587*z+0.114*A
end

function p.GetTextColorForHSB(v,x)
local z=p.Color3ToHSB(v)local
A, B, C=z.h, z.s, z.b
if p.GetPerceivedBrightness(v)>(x or 0.5)then
return Color3.fromHSV(A/360,0,0.05)
else
return Color3.fromHSV(A/360,0,0.98)
end
end

function p.GetAverageColor(v)
local x,z,A=0,0,0
local B=v.Color.Keypoints
for C,F in ipairs(B)do

x=x+F.Value.R
z=z+F.Value.G
A=A+F.Value.B
end
local C=#B
return Color3.new(x/C,z/C,A/C)
end

function p.GenerateUniqueID(v)
return h:GenerateGUID(false)
end

function p.OnThemeChange(v,x)
if typeof(x)~="function"then
return
end

local z=h:GenerateGUID(false)
p.ThemeChangeCallbacks[z]=x

return{
Disconnect=function()
p.ThemeChangeCallbacks[z]=nil
end,
}
end

function p.AddColor(v,x,z,A)
A=math.clamp(A or 1,0,1)
if typeof(z)=="string"then
z=Color3.fromHex(z)
end

return function(B)
local C
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
C=p.GetThemeProperty(x,B)
elseif typeof(x)=="string"then
C=Color3.fromHex(x)
else
C=x
end

if not C or typeof(C)~="Color3"then
return nil
end

return Color3.new(
math.clamp(C.R+z.R*A,0,1),
math.clamp(C.G+z.G*A,0,1),
math.clamp(C.B+z.B*A,0,1)
)
end
end

function p.GetElementPosition(v,x,z,A,B)
B=if typeof(B)=="table"then B else{}
if type(z)~="number"or z~=math.floor(z)then
return"Squircle",p.DefaultCornerMap(),{Position="Single",Count=1}
end

local C=x and x[z]
if C==nil then
return"Squircle",p.DefaultCornerMap(),{Position="Single",Count=1}
end

local F=if B.IncludeDefaultBreaks==false
then{}
else{
Divider=true,
Space=true,
Section=true,
}
if typeof(B.BreakTypes)=="table"then
for G,H in B.BreakTypes do
if type(G)=="number"then
F[tostring(H)]=true
else
F[tostring(G)]=H==true
end
end
end

local function GetFrame(G)
return G and(G.ElementFrame or(G.UIElements and G.UIElements.Main))
end

local function IsHidden(G)
if B.IgnoreHidden==false then
return false
end
local H=GetFrame(G)
return typeof(H)=="Instance"and H:IsA"GuiObject"and H.Visible==false
end

local function IsDelimiter(G)
return G==nil
or G.CornerBreak==true
or G.LinkCornerBreak==true
or F[tostring(G.__type)]==true
end

local function GetGroup(G)
if typeof(B.GroupBy)=="function"then
local H,J=pcall(B.GroupBy,G)
if H then
return J
end
elseif type(B.GroupBy)=="string"then
return G[B.GroupBy]
end

return G.CornerGroup or G.LinkCornerGroup or G.LinkedCornerGroup
end

if IsDelimiter(C)or IsHidden(C)then
return"Squircle",p.DefaultCornerMap(),{Position="Single",Count=1}
end

local G={}
for H,J in x or{}do
if type(H)=="number"and J~=nil then
table.insert(G,H)
end
end
table.sort(G)

local H={}
local J={}
local L
local M

local function Flush()
if#J>0 then
table.insert(H,J)
J={}
end
L=nil
M=nil
end

for N,O in G do
local P=x[O]
if IsHidden(P)then
if B.BridgeHidden~=true then
Flush()
else
M=O
end
elseif IsDelimiter(P)then
Flush()
else
local Q=P.CornerBreakBefore==true or P.LinkCornerBreakBefore==true
local R=M~=nil and O-M>1 and B.BridgeSparse~=true
local S=L~=nil and GetGroup(L)~=GetGroup(P)
local T=L
and(L.CornerBreakAfter==true or L.LinkCornerBreakAfter==true)

if#J>0 and(Q or R or S or T)then
Flush()
end

table.insert(J,O)
L=P
M=O

if P.LinkCorners==false or P.LinkCorner==false then
Flush()
end
end
end
Flush()

local N
local O
for P,Q in H do
for R,S in Q do
if S==z then
N=Q
O=R
break
end
end
if N then
break
end
end

if not N or not O then
return"Squircle",p.DefaultCornerMap(),{Position="Single",Count=1}
end

local P=#N
local Q=if B.Reverse==true then P-O+1 else O
local R=if B.InnerRadius~=nil
then p.ToUDimRadius(B.InnerRadius,UDim.new(0,0))
else false
local S="Squircle"
local T=p.DefaultCornerMap()
local U="Single"

if P>1 and Q==1 then
U="First"
if A then
S="Squircle-TL-BL"
T.TopRight=R
T.BottomRight=R
else
S="Squircle-TL-TR"
T.BottomLeft=R
T.BottomRight=R
end
elseif P>1 and Q==P then
U="Last"
if A then
S="Squircle-TR-BR"
T.TopLeft=R
T.BottomLeft=R
else
S="Squircle-BL-BR"
T.TopLeft=R
T.TopRight=R
end
elseif P>1 then
U="Middle"
S="Square"
if A then
T.TopLeft=R
T.TopRight=R
T.BottomLeft=R
T.BottomRight=R
else
T.TopLeft=R
T.TopRight=R
T.BottomLeft=R
T.BottomRight=R
end
end

local V={
Position=U,
Index=Q,
Count=P,
Horizontal=A==true,
SourceIndex=z,
Group=GetGroup(C),
}

if typeof(B.Resolver)=="function"then
local W,X,Y=pcall(B.Resolver,V,S,T,C)
if W then
S=X or S
T=Y or T
end
end

return S,T,V
end

return p end function a.e()

local b=game:GetService"TweenService"

local d={
Preset="Subtle",
Enabled=true,
Reduced=false,
}

d.Durations={
Fast=0.08,
Hover=0.1,
Press=0.12,
Select=0.14,
Focus=0.14,
DropdownOpen=0.16,
DropdownClose=0.14,
Notification=0.24,
NotificationClose=0.2,
WindowOpen=0.26,
WindowClose=0.2,
Resize=0.22,
Highlight=0.28,
Background=0.22,
Expand=0.2,
Switch=0.16,
Reveal=0.18,
}

d.PresetDurations={
Liquid={
Fast=0.1,
Hover=0.14,
Press=0.1,
Select=0.2,
Focus=0.18,
DropdownOpen=0.2,
DropdownClose=0.16,
WindowOpen=0.32,
WindowClose=0.22,
Resize=0.28,
Highlight=0.34,
Background=0.28,
Expand=0.24,
Switch=0.22,
Reveal=0.22,
},
Snappy={
Fast=0.06,
Hover=0.08,
Press=0.08,
Select=0.11,
Focus=0.1,
DropdownOpen=0.12,
DropdownClose=0.1,
WindowOpen=0.2,
WindowClose=0.16,
Resize=0.16,
Highlight=0.22,
Background=0.16,
Expand=0.16,
Switch=0.12,
Reveal=0.14,
},
}

d.PresetEasing={
Liquid={
Style=Enum.EasingStyle.Quint,
Direction=Enum.EasingDirection.Out,
},
Snappy={
Style=Enum.EasingStyle.Quart,
Direction=Enum.EasingDirection.Out,
},
}

d.PresetPressAmount={
Liquid=0.965,
Snappy=0.975,
}

local e=setmetatable({},{__mode="k"})

local f={}
function f.Play(g)end
function f.Cancel(g)end

local g={
Position=true,
Size=true,
CanvasPosition=true,
Rotation=true,
Scale=true,
}

local function IsPointerInput(h)
return h.UserInputType==Enum.UserInputType.MouseButton1 or h.UserInputType==Enum.UserInputType.Touch
end

local function ApplyProperties(h,i)
for j,m in next,i or{}do
h[j]=m
end
end

local function SplitReducedProperties(h)
local i={}
local j={}
local m=false
local p=false

for r,u in next,h or{}do
if g[r]then
i[r]=u
m=true
else
j[r]=u
p=true
end
end

return m and i or nil,p and j or nil
end

function d.GetDuration(h)
if typeof(h)=="string"then
local i=d.PresetDurations[d.Preset]
return(i and i[h])or d.Durations[h]or d.Durations.Fast
end

return math.max(tonumber(h)or d.Durations.Fast,0)
end

function d.IsEnabled(h)
return d.Enabled and d.Preset~="None"
end

function d.Configure(h,i)
if i==false then
d.Enabled=false
d.Preset="None"
return d:GetConfig()
end

if typeof(i)=="string"then
return d:SetPreset(i)
end

if typeof(i)=="table"then
if i.Preset~=nil then
d:SetPreset(i.Preset)
elseif i.Enabled~=false and d.Preset=="None"then
d:SetPreset"Subtle"
end
d.Enabled=i.Enabled~=false and d.Preset~="None"
d.Reduced=i.Reduced==true
else
d.Enabled=true
if d.Preset=="None"then
d.Preset="Subtle"
end
d.Reduced=false
end

return d:GetConfig()
end

function d.SetPreset(h,i)
i=tostring(i or"Subtle")

if i~="Subtle"and i~="Liquid"and i~="Snappy"and i~="None"then
i="Subtle"
end

d.Preset=i
d.Enabled=i~="None"

return d:GetConfig()
end

function d.SetReducedMotion(h,i)
d.Reduced=i==true
return d:GetConfig()
end

function d.GetConfig(h)
return{
Preset=d.Preset,
Enabled=d.Enabled,
Reduced=d.Reduced,
}
end

function d.ShouldAnimate(h)
if h and(h.Animation==false or h.Motion==false)then
return false
end

return d:IsEnabled()
end

function d.Cancel(h,i)
if not h then
return
end

local j=e[h]
if not j then
return
end

i=i or"Default"
local m=j[i]
if m then
m:Cancel()
j[i]=nil
end
end

function d.Tween(h,i,j,m,p,r)
if not h or typeof(h)~="Instance"then
return f
end

local u=d.GetDuration(i)
r=r or"Default"

local v
local x=j
if d.Reduced then
v,x=SplitReducedProperties(j)
u=math.min(u,d.Durations.Focus)
end

local z={}
local A

function z.Play(B)
d.Cancel(h,r)

if v then
ApplyProperties(h,v)
end

if not d:IsEnabled()or u<=0 or not x then
ApplyProperties(h,x or j)
return
end

local C=d.PresetEasing[d.Preset]
A=b:Create(
h,
TweenInfo.new(
u,
m or(C and C.Style)or Enum.EasingStyle.Quint,
p or(C and C.Direction)or Enum.EasingDirection.Out
),
x
)

e[h]=e[h]or{}
e[h][r]=A

A.Completed:Connect(function()
local F=e[h]
if F and F[r]==A then
F[r]=nil
end
end)

A:Play()
end

function z.Cancel(B)
if A then
A:Cancel()
end
d.Cancel(h,r)
end

return z
end

function d.Play(h,i,j,m,p,r)
local u=d.Tween(h,i,j,m,p,r)
u:Play()
return u
end

function d.GetScale(h)
if not h then
return nil
end

if h:IsA"UIScale"then
return h
end

local i=h:FindFirstChildOfClass"UIScale"
if not i then
i=Instance.new"UIScale"
i.Scale=1
i.Parent=h
end

return i
end

function d.Press(h,i,j)
local m=d.GetScale(h)
if not m then
return
end

if not d:IsEnabled()or d.Reduced then
if not i then
m.Scale=1
end
return
end

d.Play(
m,
"Press",
{Scale=i and(j or d.PresetPressAmount[d.Preset]or 0.97)or 1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Press"
)
end

function d.AttachPress(h,i,j)
if not h or not i then
return nil
end

j=j or{}
local m=j.Amount or 0.97
local p=j.Enabled

local r=d.GetScale(h)

local function CanPress()
if typeof(p)=="function"then
return p()
end
return p~=false
end

i.AddSignal(h.InputBegan,function(u)
if CanPress()and IsPointerInput(u)then
d.Press(r,true,m)
end
end)

i.AddSignal(h.InputEnded,function(u)
if IsPointerInput(u)then
d.Press(r,false,m)
end
end)

if h.MouseLeave then
i.AddSignal(h.MouseLeave,function()
d.Press(r,false,m)
end)
end

return r
end

return d end function a.f()

local b={}







function b.New(d,e,f)
local g={
Enabled=e.Enabled or false,
Translations=e.Translations or{},
Prefix=e.Prefix or"loc:",
DefaultLanguage=e.DefaultLanguage or"en"
}

f.Localization=g

return g
end



return b end function a.g()
local b=a.load'd'
local d=a.load'e'

local e=b.New
local f=b.Tween

local g=16
local h=56
local i=100
local j=404
local m=220
local p=22
local r=12
local u=10
local v=34
local x=46
local z=44
local A=28
local B=36
local C=44
local F=2
local G=42
local H=72
local J=2
local L=5
local M=24
local N=18
local O=2

local P={
Info={
Icon="info",
Color=Color3.fromHex"#60A5FA",
},
Notice={
Icon="bell",
Color=Color3.fromHex"#38BDF8",
},
Success={
Icon="circle-check",
Color=Color3.fromHex"#34D399",
},
Warning={
Icon="triangle-alert",
Color=Color3.fromHex"#FBBF24",
},
Error={
Icon="circle-x",
Color=Color3.fromHex"#FB7185",
},
Neutral={
Icon="message-circle",
Color=Color3.fromHex"#A1A1AA",
},
}

local Q={
default="Info",
info="Info",
notice="Notice",
message="Notice",
success="Success",
successful="Success",
ok="Success",
green="Success",
warn="Warning",
warning="Warning",
caution="Warning",
error="Error",
fail="Error",
failed="Error",
danger="Error",
neutral="Neutral",
}

local R={
default="Compact",
compact="Compact",
minimal="Compact",
pill="Compact",
capsule="Compact",
card="Card",
avatar="Card",
glass="Glass",
legacy="Glass",
}

local S={
Holder=nil,
NotificationIndex=0,
Notifications={},
}

local function ResolveColor(T,U)
if typeof(T)=="Color3"then
return T
end

if typeof(T)=="string"and string.sub(T,1,1)=="#"then
local V,W=pcall(Color3.fromHex,T)
if V then
return W
end
end

return U
end

local function NormalizeStyleName(T)
local U=tostring(T or"Info"):lower():gsub("%s+","")
return Q[U]or"Info"
end

local function NormalizeAppearance(T,U)
if T==nil and(U.Avatar~=nil or U.Timestamp~=nil or U.Time~=nil)then
return"Card"
end
local V=tostring(T or"Compact"):lower():gsub("%s+","")
return R[V]or"Compact"
end

local function ResolveDuration(T)
if T==false then
return false
end

local U=tonumber(T)
if U==nil then
return 5
end

return math.max(U,0)
end

local function NormalizeIcon(T)
if typeof(T)=="number"then
return"rbxassetid://"..tostring(T)
end
if typeof(T)=="string"then
return T
end
if typeof(T)=="table"or typeof(T)=="Instance"then
return T
end
return nil
end

local function PaintIcon(T,U,V)
if typeof(T)~="Instance"then
return
end

local W={}
if T:IsA"ImageLabel"or T:IsA"ImageButton"then
table.insert(W,T)
end

for X,Y in T:GetDescendants()do
if Y:IsA"ImageLabel"or Y:IsA"ImageButton"then
table.insert(W,Y)
end
end

for X,Y in W do
Y.ImageColor3=U
if V~=nil then
Y.ImageTransparency=V
end
end
end

local function CreateCorner(T)
return e("UICorner",{
CornerRadius=UDim.new(0,T),
})
end

local function GetActions(T)
local U={}
if typeof(T)~="table"then
return U
end

for V=1,math.min(#T,F)do
local W=T[V]
if typeof(W)=="table"then
table.insert(U,W)
end
end

return U
end

local function TrimNotifications(T,U)
local V={}
for W,X in S.Notifications do
if not X.Closed then
table.insert(V,X)
end
end

table.sort(V,function(W,X)
return W.Index<X.Index
end)

local W=math.max(#V-1,0)*u
for X,Y in V do
W=W+(Y.LayoutHeight or 64)
end

while#V>1 and(#V>T or W>U)do
local X=table.remove(V,1)
W=W-(X.LayoutHeight or 64)-u
X:Close"Overflow"
end
end

function S.Init(T)
local U={
Lower=false,
}

U.Frame=e("Frame",{
Name="NotificationHolder",
Position=UDim2.new(1,-g,0,h),
AnchorPoint=Vector2.new(1,0),
Size=UDim2.new(1,-(g*2),1,-(h+i)),
Parent=T,
BackgroundTransparency=1,
ClipsDescendants=true,
ZIndex=100,
},{
e("UISizeConstraint",{
MinSize=Vector2.new(m,0),
MaxSize=Vector2.new(j,10000),
}),
e("UIListLayout",{
HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Top,
Padding=UDim.new(0,u),
}),
})

function U.SetLower(V)
U.Lower=V==true
local W=if U.Lower then 12 else i
U.Frame.Size=UDim2.new(1,-(g*2),1,-(h+W))
end

S.Holder=U.Frame
return U
end

function S.New(T)
T=if typeof(T)=="table"then T else{}

local U=NormalizeStyleName(T.Style or T.Type or T.Variant)
local V=NormalizeAppearance(T.Appearance or T.Layout,T)
local W=P[U]or P.Info
local X=ResolveColor(T.AccentColor or T.Color,W.Color)
local Y
local _=if T.Avatar~=nil then T.Avatar else T.Icon
if _==false or _==""then
Y=nil
elseif _~=nil then
Y=NormalizeIcon(_)
else
Y=W.Icon
end
local aa=T.Decorated==true or T.Accented==true or V=="Glass"

local ab={
Title=tostring(T.Title or"Notification"),
Content=T.Content~=nil and tostring(T.Content)or nil,
Icon=Y,
IsAvatar=T.Avatar~=nil,
IconThemed=T.IconThemed,
IconColor=ResolveColor(
T.IconColor,
if aa
or T.AccentColor~=nil
or T.Color~=nil
then X
else Color3.fromHex"#A1A1AA"
),
Style=U,
Appearance=V,
Decorated=aa,
Timestamp=T.Timestamp~=nil and tostring(T.Timestamp)
or(T.Time~=nil and tostring(T.Time)or nil),
AccentColor=X,
ProgressColor=ResolveColor(T.ProgressColor,X),
Background=T.Background,
BackgroundImageTransparency=b.ClampTransparency(T.BackgroundImageTransparency,0.35),
Duration=ResolveDuration(T.Duration),
Buttons=GetActions(T.Buttons),
CanClose=T.CanClose~=false,
PauseOnHover=T.PauseOnHover~=false,
OnOpen=T.OnOpen,
OnClose=T.OnClose,
UIElements={},
Closed=false,
Paused=false,
}

S.NotificationIndex=S.NotificationIndex+1
ab.Index=S.NotificationIndex
S.Notifications[ab.Index]=ab

local ac=T.Holder or S.Holder
assert(ac,"Notification holder is not initialized")

local ad=ab.Appearance=="Card"
local ae=if ad then 14 else r
local af=math.max(tonumber(T.Radius)or(ad and 24 or p),8)
local ag=if ad then x else v
local ah=if ab.Timestamp then 82 else 0
local ai=typeof(ab.Duration)=="number"and ab.Duration>0
local aj=ab.Icon and(ag+10)or 0
local ak=(ab.CanClose and B or 0)+ah
local al
local am=0
local an=if ai then ab.Duration else 0
local ao
local ap=false
local aq=false
local ar=64
local as={}

local function Connect(at,au)
local av=at:Connect(au)
table.insert(as,av)
return av
end

local function AttachPress(at,au)
Connect(at.InputBegan,function(av)
if
av.UserInputType==Enum.UserInputType.MouseButton1
or av.UserInputType==Enum.UserInputType.Touch
then
d.Press(at,true,au)
end
end)
Connect(at.InputEnded,function(av)
if
av.UserInputType==Enum.UserInputType.MouseButton1
or av.UserInputType==Enum.UserInputType.Touch
then
d.Press(at,false,au)
end
end)
Connect(at.MouseLeave,function()
d.Press(at,false,au)
end)
end

local function AttachHover(at,au,av,aw)
Connect(at.MouseEnter,function()
d.Play(
au,
"Hover",
{BackgroundTransparency=av},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
end)
Connect(at.MouseLeave,function()
d.Play(
au,
"Hover",
{BackgroundTransparency=aw},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
end)
end

local function DisconnectSignals()
for at,au in as do
au:Disconnect()
end
table.clear(as)
end

local at=e("Frame",{
Name="NotificationContainer",
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
ClipsDescendants=true,
LayoutOrder=-ab.Index,
ZIndex=100,
Parent=ac,
})

local au=e("UIScale",{
Name="TransitionScale",
Scale=0.965,
})

local av=e("CanvasGroup",{
Name="NotificationTransition",
Active=true,
BackgroundTransparency=1,
GroupTransparency=1,
BorderSizePixel=0,
Size=UDim2.new(1,0,0,ar),
Position=UDim2.new(0,M,0,0),
ClipsDescendants=false,
ZIndex=101,
Parent=at,
},{
au,
})

local aw=e("Frame",{
Name="Shadow",
BackgroundColor3=Color3.new(0,0,0),
BackgroundTransparency=0.66,
BorderSizePixel=0,
Size=UDim2.new(1,-2,1,-O),
Position=UDim2.new(0,1,0,O),
ZIndex=101,
Parent=av,
},{
CreateCorner(af),
})

local ax=e("UIStroke",{
Color=Color3.new(1,1,1),
Transparency=0.8,
Thickness=1,
ThemeTag={
Color="NotificationBorder",
Transparency="NotificationBorderTransparency",
},
})

local ay=e("Frame",{
Name="Notification",
BackgroundColor3=Color3.fromRGB(9,10,13),
BackgroundTransparency=0.04,
BorderSizePixel=0,
Size=UDim2.new(1,0,1,-O),
ClipsDescendants=true,
ZIndex=102,
ThemeTag={
BackgroundColor3="Notification",
},
Parent=av,
},{
CreateCorner(af),
ax,
})
ay:SetAttribute("Appearance",ab.Appearance)

local az=e("Frame",{
Name="CapsuleSurface",
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
BackgroundTransparency=if ab.Appearance=="Glass"then 0.94 else 0.975,
Size=UDim2.fromScale(1,1),
ZIndex=103,
ThemeTag={
BackgroundColor3="Notification2",
BackgroundTransparency="Notification2Transparency",
},
Parent=ay,
},{
CreateCorner(af),
})

if typeof(ab.Background)=="string"and ab.Background~=""then
e("ImageLabel",{
Name="Background",
Image=ab.Background,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ScaleType=Enum.ScaleType.Crop,
ImageTransparency=ab.BackgroundImageTransparency,
ZIndex=104,
Parent=ay,
},{
CreateCorner(af),
})
end

local aA=e("Frame",{
Name="ToneWash",
BackgroundColor3=ab.AccentColor,
BackgroundTransparency=0.9,
BorderSizePixel=0,
Size=UDim2.fromScale(1,1),
Visible=ab.Decorated,
ZIndex=105,
Parent=ay,
},{
CreateCorner(af),
e("UIGradient",{
Rotation=18,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.42),
NumberSequenceKeypoint.new(0.38,0.86),
NumberSequenceKeypoint.new(1,1),
},
}),
})

local aB=e("Frame",{
Name="AccentLine",
BackgroundColor3=ab.AccentColor,
BackgroundTransparency=0.16,
BorderSizePixel=0,
Size=UDim2.new(0.55,0,0,2),
Position=UDim2.fromOffset(0,0),
Visible=ab.Decorated,
ZIndex=106,
Parent=ay,
},{
e("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.08),
NumberSequenceKeypoint.new(0.55,0.5),
NumberSequenceKeypoint.new(1,1),
},
}),
})

local aC=e("Frame",{
Name="TopHighlight",
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=0.92,
BorderSizePixel=0,
Size=UDim2.new(0.72,0,0,1),
Position=UDim2.new(0.14,0,0,0),
ZIndex=106,
Parent=ay,
},{
e("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.15),
NumberSequenceKeypoint.new(1,1),
},
}),
})

local aD=e("Frame",{
Name="Body",
BackgroundTransparency=1,
Size=UDim2.new(1,-(ae*2),0,0),
Position=UDim2.fromOffset(ae,ae),
ZIndex=107,
Parent=ay,
})

local aE=e("UIListLayout",{
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,10),
Parent=aD,
})

local aF=e("Frame",{
Name="Header",
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,math.max(ab.Icon and ag or 0,20)),
LayoutOrder=1,
ZIndex=107,
Parent=aD,
})

local aG
if ab.Timestamp then
aG=e("TextLabel",{
Name="Timestamp",
Text=ab.Timestamp,
TextSize=12,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
TextXAlignment=Enum.TextXAlignment.Right,
TextYAlignment=Enum.TextYAlignment.Top,
TextTruncate=Enum.TextTruncate.AtEnd,
BackgroundTransparency=1,
Size=UDim2.fromOffset(ah,18),
Position=UDim2.new(1,-(ab.CanClose and B or 0),0,1),
AnchorPoint=Vector2.new(1,0),
TextTransparency=0.22,
ZIndex=109,
ThemeTag={
TextColor3="NotificationContent",
},
Parent=aF,
})
end

local aH=e("Frame",{
Name="TextContainer",
BackgroundTransparency=1,
Size=UDim2.new(1,-(aj+ak),0,0),
Position=UDim2.fromOffset(aj,0),
ZIndex=108,
Parent=aF,
})

local aI=e("UIListLayout",{
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,3),
Parent=aH,
})

local aJ=e("TextLabel",{
Name="Title",
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Text=ab.Title,
TextWrapped=true,
TextTruncate=Enum.TextTruncate.AtEnd,
RichText=true,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
TextSize=if ad then 16 else 15,
LineHeight=1.05,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
LayoutOrder=1,
ZIndex=108,
ThemeTag={
TextColor3="NotificationTitle",
TextTransparency="NotificationTitleTransparency",
},
Parent=aH,
},{
e("UISizeConstraint",{
MinSize=Vector2.new(0,18),
MaxSize=Vector2.new(10000,G),
}),
})

local aK=e("TextLabel",{
Name="Content",
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Text=ab.Content or"",
TextWrapped=true,
TextTruncate=Enum.TextTruncate.AtEnd,
RichText=true,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
TextSize=13,
LineHeight=1.1,
FontFace=Font.new(b.Font,Enum.FontWeight.Regular),
LayoutOrder=2,
Visible=ab.Content~=nil,
ZIndex=108,
ThemeTag={
TextColor3="NotificationContent",
TextTransparency="NotificationContentTransparency",
},
Parent=aH,
},{
e("UISizeConstraint",{
MinSize=Vector2.new(0,16),
MaxSize=Vector2.new(10000,H),
}),
})

local aL
if ab.Icon then
local aM=not ab.IsAvatar
and(
type(ab.Icon)~="string"
or(ab.Icon:match"^rbxassetid://"==nil and ab.Icon:match"^https?://"==nil)
)
local aN=b.Image(
ab.Icon,
ab.Title..":"..tostring(ab.Icon),
ab.IsAvatar and ag/2 or 0,
T.Window and T.Window.Folder,
"Notification",
true,
ab.IconThemed
)
aN.Name="Icon"
aN.Size=if ab.IsAvatar
then UDim2.fromScale(1,1)
else UDim2.fromOffset(if ad then 24 else 20,if ad then 24 else 20)
aN.Position=UDim2.fromScale(0.5,0.5)
aN.AnchorPoint=Vector2.new(0.5,0.5)
aN.ZIndex=110
if aM and b.Icon(ab.Icon)and ab.IconThemed~=true then
PaintIcon(aN,ab.IconColor,0)
end

aL=e("Frame",{
Name="IconBubble",
BackgroundColor3=if ab.IsAvatar then Color3.new(1,1,1)else ab.IconColor,
BackgroundTransparency=if ab.IsAvatar
then 0.88
elseif ab.Decorated then 0.86
else 0.94,
BorderSizePixel=0,
Size=UDim2.fromOffset(ag,ag),
ClipsDescendants=true,
ZIndex=109,
Parent=aF,
},{
CreateCorner(ag/2),
e("UIStroke",{
Color=ab.IconColor,
Transparency=if ab.Decorated then 0.7 else 0.86,
Thickness=1,
}),
e("UIGradient",{
Rotation=35,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,ab.AccentColor:Lerp(Color3.new(1,1,1),0.16)),
ColorSequenceKeypoint.new(1,ab.AccentColor),
},
}),
aN,
})
end

local aM
local aN
if ab.CanClose then
local aO=b.Icon"x"
aN=e("Frame",{
Name="Surface",
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=0.96,
BorderSizePixel=0,
Size=UDim2.fromOffset(A,A),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
ZIndex=109,
ThemeTag={
BackgroundColor3="Notification2",
},
},{
CreateCorner(A/2),
e("ImageLabel",{
Name="Icon",
Image=aO and aO[1]or"",
ImageRectSize=aO and aO[2]and aO[2].ImageRectSize or Vector2.zero,
ImageRectOffset=aO and aO[2]and aO[2].ImageRectPosition
or Vector2.zero,
BackgroundTransparency=1,
Size=UDim2.fromOffset(14,14),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=0.52,
ZIndex=110,
ThemeTag={
ImageColor3="NotificationTitle",
},
}),
})

aM=e("TextButton",{
Name="CloseButton",
Text="",
AutoButtonColor=false,
BackgroundTransparency=1,
BorderSizePixel=0,
Size=UDim2.fromOffset(z,z),
Position=UDim2.new(1,4,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
ZIndex=109,
Parent=aF,
},{
aN,
})
AttachPress(aM,0.96)
AttachHover(aM,aN,0.88,0.96)
end

local aO
if#ab.Buttons>0 then
aO=e("Frame",{
Name="Actions",
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,C),
LayoutOrder=2,
ZIndex=107,
Parent=aD,
})

e("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Top,
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,6),
Parent=aO,
})

for aP,aQ in ab.Buttons do
local aR=aP==1
local aS
if#ab.Buttons==2 then
aS=UDim2.new(0.5,-3,0,C)
else
aS=UDim2.new(1,0,0,C)
end

local aT=if aR then 0.16 else 0.93
local aU=e("UIStroke",{
Color=if aR then ab.AccentColor else Color3.new(1,1,1),
Transparency=if aR then 0.55 else 0.78,
Thickness=1,
ThemeTag=if aR
then nil
else{
Color="NotificationBorder",
Transparency="NotificationBorderTransparency",
},
})

local aV=e("TextButton",{
Name="Action"..aP,
Text=tostring(aQ.Title or aQ.Text or"Action"),
TextSize=13,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
AutoButtonColor=false,
BackgroundColor3=if aR then ab.AccentColor else Color3.new(1,1,1),
BackgroundTransparency=aT,
BorderSizePixel=0,
Size=aS,
LayoutOrder=aP,
ZIndex=108,
ThemeTag=if aR
then{
TextColor3="White",
}
else{
BackgroundColor3="Notification2",
TextColor3="NotificationTitle",
},
Parent=aO,
},{
CreateCorner(10),
aU,
})
AttachPress(aV,0.97)
AttachHover(aV,aV,if aR then 0.06 else 0.87,aT)

Connect(aV.MouseButton1Click,function()
b.SafeCallback(aQ.Callback,ab,aQ)
if aQ.Close~=false and aQ.CloseOnClick~=false then
ab:Close"Action"
end
end)
end
end

local aP=ai and d:IsEnabled()and not d.Reduced
local aQ=e("Frame",{
Name="ProgressTrack",
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=0.9,
BorderSizePixel=0,
Size=UDim2.new(1,0,0,J),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
Visible=ai,
ZIndex=111,
ThemeTag={
BackgroundColor3="NotificationDuration",
BackgroundTransparency="NotificationDurationTransparency",
},
Parent=ay,
},{
CreateCorner(J),
})

local aR=e("Frame",{
Name="ProgressFill",
BackgroundColor3=ab.ProgressColor,
BackgroundTransparency=b.ClampTransparency(T.ProgressTransparency,0.02),
BorderSizePixel=0,
Size=UDim2.fromScale(1,1),
ZIndex=112,
Parent=aQ,
},{
CreateCorner(J),
e("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,ab.ProgressColor),
ColorSequenceKeypoint.new(1,ab.ProgressColor:Lerp(Color3.new(1,1,1),0.22)),
},
}),
})

local function UpdateContainerHeight(aS)
local aT=math.max(math.ceil(aE.AbsoluteContentSize.Y),aF.Size.Y.Offset)
ar=ae+aT+ae+O
ab.LayoutHeight=ar
av.Size=UDim2.new(1,0,0,ar)

if ap then
if aS==false then
at.Size=UDim2.new(1,0,0,ar)
else
d.Play(
at,
"Resize",
{Size=UDim2.new(1,0,0,ar)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Resize"
)
end
end

if aq then
local aU=math.max(ac.AbsoluteSize.Y,ar)
TrimNotifications(math.max(math.floor(tonumber(T.MaxVisible)or L),1),aU)
end
end

local function UpdateTextHeight()
local aS=math.max(math.ceil(aI.AbsoluteContentSize.Y),20)
aH.Size=UDim2.new(1,-(aj+ak),0,aS)
aF.Size=UDim2.new(1,0,0,math.max(aS,ab.Icon and ag or 0,20))
UpdateContainerHeight(ap)
end

Connect(aI:GetPropertyChangedSignal"AbsoluteContentSize",function()
UpdateTextHeight()
end)
Connect(aE:GetPropertyChangedSignal"AbsoluteContentSize",function()
UpdateContainerHeight(ap)
end)

local function StopProgressTween()
if al then
al:Cancel()
al=nil
end
end

local function CaptureRemainingTime()
if ao then
an=math.max(an-(os.clock()-ao),0)
ao=nil
end
ab.Remaining=an
end

local function SetProgressRatio(aS)
aR.Size=UDim2.new(math.clamp(aS,0,1),0,1,0)
end

local function StartTimer()
if not ai or not ap or ab.Closed or ab.Paused then
return
end

if an<=0 then
ab:Close"Timeout"
return
end

am=am+1
local aS=am
ao=os.clock()
ab.Remaining=an

StopProgressTween()
local aT=an/ab.Duration
SetProgressRatio(aT)
if aP then
al=f(
aR,
an,
{Size=UDim2.new(0,0,1,0)},
Enum.EasingStyle.Linear,
Enum.EasingDirection.InOut
)
al:Play()
end

task.delay(an,function()
if aS==am and not ab.Closed and not ab.Paused then
an=0
ab.Remaining=0
ab:Close"Timeout"
end
end)
end

function ab.Pause(aS)
if not ai or ab.Closed or ab.Paused then
return ab
end

ab.Paused=true
am=am+1
CaptureRemainingTime()
StopProgressTween()
SetProgressRatio(an/ab.Duration)
return ab
end

function ab.Resume(aS)
if not ai or ab.Closed or not ab.Paused then
return ab
end

ab.Paused=false
StartTimer()
return ab
end

function ab.GetRemainingDuration(aS)
if not ai then
return 0
end

local aT=an
if ao then
aT=math.max(aT-(os.clock()-ao),0)
end
return aT
end

function ab.Update(aS,aT)
if typeof(aT)~="table"or ab.Closed then
return ab
end

if aT.Title~=nil then
ab.Title=tostring(aT.Title)
aJ.Text=ab.Title
end

if aT.Content~=nil then
ab.Content=if aT.Content==false then nil else tostring(aT.Content)
aK.Text=ab.Content or""
aK.Visible=ab.Content~=nil
end

if aT.Duration~=nil then
local aU=ab.Paused
am=am+1
CaptureRemainingTime()
StopProgressTween()
ab.Duration=ResolveDuration(aT.Duration)
ai=typeof(ab.Duration)=="number"and ab.Duration>0
aP=ai and d:IsEnabled()and not d.Reduced
an=if ai then ab.Duration else 0
ab.Remaining=an
ab.Paused=aU
aQ.Visible=ai
SetProgressRatio(if ai then 1 else 0)
StartTimer()
end

UpdateTextHeight()
return ab
end

function ab.Close(aS,aT)
if ab.Closed then
return ab
end

ab.Closed=true
ab.CloseReason=tostring(aT or"Manual")
am=am+1
CaptureRemainingTime()
DisconnectSignals()
StopProgressTween()

d.Cancel(at,"Open")
d.Cancel(at,"Resize")
d.Cancel(av,"Open")
d.Cancel(au,"Open")
d.Play(
at,
"NotificationClose",
{Size=UDim2.new(1,0,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Close"
)
d.Play(av,"NotificationClose",{
Position=UDim2.new(0,N,0,0),
GroupTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Close")
d.Play(
au,
"NotificationClose",
{Scale=0.98},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Close"
)

b.SafeCallback(ab.OnClose,ab,ab.CloseReason)

local aU=if d:IsEnabled()and not d.Reduced
then d.GetDuration"NotificationClose"+0.02
else 0
task.delay(aU,function()
S.Notifications[ab.Index]=nil
if at.Parent then
at:Destroy()
end
end)

return ab
end

if aM then
Connect(aM.MouseButton1Click,function()
ab:Close"Dismissed"
end)
end

if ab.PauseOnHover then
Connect(av.MouseEnter,function()
ab:Pause()
end)
Connect(av.MouseLeave,function()
ab:Resume()
end)
end

ab.UIElements={
Container=at,
Main=ay,
Card=ay,
Transition=av,
TransitionScale=au,
Shadow=aw,
Stroke=ax,
Surface=az,
ToneWash=aA,
AccentLine=aB,
TopHighlight=aC,
Body=aD,
Header=aF,
TextContainer=aH,
Title=aJ,
Content=aK,
Timestamp=aG,
IconBubble=aL,
CloseButton=aM,
CloseSurface=aN,
Actions=aO,
ProgressTrack=aQ,
ProgressFill=aR,
}

UpdateTextHeight()
aq=true
TrimNotifications(
math.max(math.floor(tonumber(T.MaxVisible)or L),1),
math.max(ac.AbsoluteSize.Y,ar)
)

task.spawn(function()
task.wait()
if ab.Closed then
return
end

UpdateTextHeight()
ap=true
d.Play(
at,
"Notification",
{Size=UDim2.new(1,0,0,ar)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Open"
)
d.Play(av,"Notification",{
Position=UDim2.new(0,0,0,0),
GroupTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Open")
d.Play(au,"Notification",{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Open")

b.SafeCallback(ab.OnOpen,ab)
StartTimer()
end)

return ab
end

return S end function a.h()












local aa=4294967296;local ab=aa-1;local function c(ac,ad)local ae,af=0,1;while ac~=0 or ad~=0 do local ag,ah=ac%2,ad%2;local ai=(ag+ah)%2;ae=ae+ai*af;ac=math.floor(ac/2)ad=math.floor(ad/2)af=af*2 end;return ae%aa end;local function k(ac,ad,ae,...)local af;if ad then ac=ac%aa;ad=ad%aa;af=c(ac,ad)if ae then af=k(af,ae,...)end;return af elseif ac then return ac%aa else return 0 end end;local function n(ac,ad,ae,...)local af;if ad then ac=ac%aa;ad=ad%aa;af=(ac+ad-c(ac,ad))/2;if ae then af=n(af,ae,...)end;return af elseif ac then return ac%aa else return ab end end;local function o(ac)return ab-ac end;local function q(ac,ad)if ad<0 then return lshift(ac,-ad)end;return math.floor(ac%4294967296/2^ad)end;local function s(ac,ad)if ad>31 or ad<-31 then return 0 end;return q(ac%aa,ad)end;local function lshift(ac,ad)if ad<0 then return s(ac,-ad)end;return ac*2^ad%4294967296 end;local function t(ac,ad)ac=ac%aa;ad=ad%32;local ae=n(ac,2^ad-1)return s(ac,ad)+lshift(ae,32-ad)end;local ac={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(ad)return string.gsub(ad,".",function(ae)return string.format("%02x",string.byte(ae))end)end;local function y(ad,ae)local af=""for ag=1,ae do local ah=ad%256;af=string.char(ah)..af;ad=(ad-ah)/256 end;return af end;local function D(ad,ae)local af=0;for ag=ae,ae+3 do af=af*256+string.byte(ad,ag)end;return af end;local function E(ad,ae)local af=64-(ae+9)%64;ae=y(8*ae,8)ad=ad.."\128"..string.rep("\0",af)..ae;assert(#ad%64==0)return ad end;local function I(ad)ad[1]=0x6a09e667;ad[2]=0xbb67ae85;ad[3]=0x3c6ef372;ad[4]=0xa54ff53a;ad[5]=0x510e527f;ad[6]=0x9b05688c;ad[7]=0x1f83d9ab;ad[8]=0x5be0cd19;return ad end;local function K(ad,ae,af)local ag={}for ah=1,16 do ag[ah]=D(ad,ae+(ah-1)*4)end;for ah=17,64 do local ai=ag[ah-15]local aj=k(t(ai,7),t(ai,18),s(ai,3))ai=ag[ah-2]ag[ah]=(ag[ah-16]+aj+ag[ah-7]+k(t(ai,17),t(ai,19),s(ai,10)))%aa end;local ah,ai,aj,ak,al,am,an,ao=af[1],af[2],af[3],af[4],af[5],af[6],af[7],af[8]for ap=1,64 do local aq=k(t(ah,2),t(ah,13),t(ah,22))local ar=k(n(ah,ai),n(ah,aj),n(ai,aj))local as=(aq+ar)%aa;local at=k(t(al,6),t(al,11),t(al,25))local au=k(n(al,am),n(o(al),an))local av=(ao+at+au+ac[ap]+ag[ap])%aa;ao=an;an=am;am=al;al=(ak+av)%aa;ak=aj;aj=ai;ai=ah;ah=(av+as)%aa end;af[1]=(af[1]+ah)%aa;af[2]=(af[2]+ai)%aa;af[3]=(af[3]+aj)%aa;af[4]=(af[4]+ak)%aa;af[5]=(af[5]+al)%aa;af[6]=(af[6]+am)%aa;af[7]=(af[7]+an)%aa;af[8]=(af[8]+ao)%aa end;local function Z(ad)ad=E(ad,#ad)local ae=I{}for af=1,#ad,64 do K(ad,af,ae)end;return w(y(ae[1],4)..y(ae[2],4)..y(ae[3],4)..y(ae[4],4)..y(ae[5],4)..y(ae[6],4)..y(ae[7],4)..y(ae[8],4))end;local ad;local ae={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local af={["/"]="/"}for ag,ah in pairs(ae)do af[ah]=ag end;local ag=function(ag)return"\\"..(ae[ag]or string.format("u%04x",ag:byte()))end;local ah=function(ah)return"null"end;local ai=function(ai,aj)local ak={}aj=aj or{}if aj[ai]then error"circular reference"end;aj[ai]=true;if rawget(ai,1)~=nil or next(ai)==nil then local al=0;for am in pairs(ai)do if type(am)~="number"then error"invalid table: mixed or invalid key types"end;al=al+1 end;if al~=#ai then error"invalid table: sparse array"end;for am,an in ipairs(ai)do table.insert(ak,ad(an,aj))end;aj[ai]=nil;return"["..table.concat(ak,",").."]"else for al,am in pairs(ai)do if type(al)~="string"then error"invalid table: mixed or invalid key types"end;table.insert(ak,ad(al,aj)..":"..ad(am,aj))end;aj[ai]=nil;return"{"..table.concat(ak,",").."}"end end;local aj=function(aj)return'"'..aj:gsub('[%z\1-\31\\"]',ag)..'"'end;local ak=function(ak)if ak~=ak or ak<=-math.huge or ak>=math.huge then error("unexpected number value '"..tostring(ak).."'")end;return string.format("%.14g",ak)end;local al={["nil"]=ah,table=ai,string=aj,number=ak,boolean=tostring}ad=function(am,an)local ao=type(am)local ap=al[ao]if ap then return ap(am,an)end;error("unexpected type '"..ao.."'")end;local am=function(am)return ad(am)end;local an;local ao=function(...)local ao={}for ap=1,select("#",...)do ao[select(ap,...)]=true end;return ao end;local ap=ao(" ","\t","\r","\n")local aq=ao(" ","\t","\r","\n","]","}",",")local ar=ao("\\","/",'"',"b","f","n","r","t","u")local as=ao("true","false","null")local at={["true"]=true,["false"]=false,null=nil}local au=function(au,av,aw,ax)for ay=av,#au do if aw[au:sub(ay,ay)]~=ax then return ay end end;return#au+1 end;local av=function(av,aw,ax)local ay=1;local az=1;for aA=1,aw-1 do az=az+1;if av:sub(aA,aA)=="\n"then ay=ay+1;az=1 end end;error(string.format("%s at line %d col %d",ax,ay,az))end;local aw=function(aw)local ax=math.floor;if aw<=0x7f then return string.char(aw)elseif aw<=0x7ff then return string.char(ax(aw/64)+192,aw%64+128)elseif aw<=0xffff then return string.char(ax(aw/4096)+224,ax(aw%4096/64)+128,aw%64+128)elseif aw<=0x10ffff then return string.char(ax(aw/262144)+240,ax(aw%262144/4096)+128,ax(aw%4096/64)+128,aw%64+128)end;error(string.format("invalid unicode codepoint '%x'",aw))end;local ax=function(ax)local ay=tonumber(ax:sub(1,4),16)local az=tonumber(ax:sub(7,10),16)if az then return aw((ay-0xd800)*0x400+az-0xdc00+0x10000)else return aw(ay)end end;local ay=function(ay,az)local aA=""local aB=az+1;local aC=aB;while aB<=#ay do local aD=ay:byte(aB)if aD<32 then av(ay,aB,"control character in string")elseif aD==92 then aA=aA..ay:sub(aC,aB-1)aB=aB+1;local aE=ay:sub(aB,aB)if aE=="u"then local aF=ay:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",aB+1)or ay:match("^%x%x%x%x",aB+1)or av(ay,aB-1,"invalid unicode escape in string")aA=aA..ax(aF)aB=aB+#aF else if not ar[aE]then av(ay,aB-1,"invalid escape char '"..aE.."' in string")end;aA=aA..af[aE]end;aC=aB+1 elseif aD==34 then aA=aA..ay:sub(aC,aB-1)return aA,aB+1 end;aB=aB+1 end;av(ay,az,"expected closing quote for string")end;local az=function(az,aA)local aB=au(az,aA,aq)local aC=az:sub(aA,aB-1)local aD=tonumber(aC)if not aD then av(az,aA,"invalid number '"..aC.."'")end;return aD,aB end;local aA=function(aA,aB)local aC=au(aA,aB,aq)local aD=aA:sub(aB,aC-1)if not as[aD]then av(aA,aB,"invalid literal '"..aD.."'")end;return at[aD],aC end;local aB=function(aB,aC)local aD={}local aE=1;aC=aC+1;while 1 do local aF;aC=au(aB,aC,ap,true)if aB:sub(aC,aC)=="]"then aC=aC+1;break end;aF,aC=an(aB,aC)aD[aE]=aF;aE=aE+1;aC=au(aB,aC,ap,true)local aG=aB:sub(aC,aC)aC=aC+1;if aG=="]"then break end;if aG~=","then av(aB,aC,"expected ']' or ','")end end;return aD,aC end;local aC=function(aC,aD)local aE={}aD=aD+1;while 1 do local aF,aG;aD=au(aC,aD,ap,true)if aC:sub(aD,aD)=="}"then aD=aD+1;break end;if aC:sub(aD,aD)~='"'then av(aC,aD,"expected string for key")end;aF,aD=an(aC,aD)aD=au(aC,aD,ap,true)if aC:sub(aD,aD)~=":"then av(aC,aD,"expected ':' after key")end;aD=au(aC,aD+1,ap,true)aG,aD=an(aC,aD)aE[aF]=aG;aD=au(aC,aD,ap,true)local aH=aC:sub(aD,aD)aD=aD+1;if aH=="}"then break end;if aH~=","then av(aC,aD,"expected '}' or ','")end end;return aE,aD end;local aD={['"']=ay,["0"]=az,["1"]=az,["2"]=az,["3"]=az,["4"]=az,["5"]=az,["6"]=az,["7"]=az,["8"]=az,["9"]=az,["-"]=az,t=aA,f=aA,n=aA,["["]=aB,["{"]=aC}an=function(aE,aF)local aG=aE:sub(aF,aF)local aH=aD[aG]if aH then return aH(aE,aF)end;av(aE,aF,"unexpected character '"..aG.."'")end;local aE=function(aE)if type(aE)~="string"then error("expected argument of type string, got "..type(aE))end;local aF,aG=an(aE,au(aE,1,ap,true))aG=au(aE,aG,ap,true)if aG<=#aE then av(aE,aG,"trailing garbage")end;return aF end;
local aF,aG,aH=am,aE,Z;





local aI={}

local aJ=(cloneref or clonereference or function(aJ)return aJ end)


function aI.New(aK,aL)

local aM=aK;
local aN=aL;
local aO=true;


local aP=function(aP)end;


repeat task.wait(1)until game:IsLoaded();


local aQ=false;
local aR,aS,aT,aU,aV,b,d,e,f=setclipboard or toclipboard,request or http_request or syn_request,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function()return aJ(game:GetService"Players").LocalPlayer.UserId end
local g,h="",0;


local i="https://api.platoboost.app";
local j=aS{
Url=i.."/public/connectivity",
Method="GET"
};
if j.StatusCode~=200 and j.StatusCode~=429 then
i="https://api.platoboost.net";
end


function cacheLink()
if h+(600)<b()then
local m=aS{
Url=i.."/public/start",
Method="POST",
Body=aF{
service=aM,
identifier=aH(f())
},
Headers={
["Content-Type"]="application/json",
["User-Agent"]="Roblox/Exploit"
}
};

if m.StatusCode==200 then
local p=aG(m.Body);

if p.success==true then
g=p.data.url;
h=b();
return true,g
else
aP(p.message);
return false,p.message
end
elseif m.StatusCode==429 then
local p="you are being rate limited, please wait 20 seconds and try again.";
aP(p);
return false,p
end

local p="Failed to cache link.";
aP(p);
return false,p
else
return true,g
end
end

cacheLink();


local m=function()
local m=""
for p=1,16 do
m=m..aT(e(d()*(26))+97)
end
return m
end


for p=1,5 do
local r=m();
task.wait(0.2)
if m()==r then
local u="platoboost nonce error.";
aP(u);
error(u);
end
end


local p=function()
local p,r=cacheLink();

if p then
aR(r);
end
end


local r=function(r)
local u=m();
local v=i.."/public/redeem/"..aU(aM);

local x={
identifier=aH(f()),
key=r
}

if aO then
x.nonce=u;
end

local z=aS{
Url=v,
Method="POST",
Body=aF(x),
Headers={
["Content-Type"]="application/json"
}
};

if z.StatusCode==200 then
local A=aG(z.Body);

if A.success==true then
if A.data.valid==true then
if aO then
if A.data.hash==aH("true".."-"..u.."-"..aN)then
return true
else
aP"failed to verify integrity.";
return false
end
else
return true
end
else
aP"key is invalid.";
return false
end
else
if aV(A.message,1,27)=="unique constraint violation"then
aP"you already have an active key, please wait for it to expire before redeeming it.";
return false
else
aP(A.message);
return false
end
end
elseif z.StatusCode==429 then
aP"you are being rate limited, please wait 20 seconds and try again.";
return false
else
aP"server returned an invalid status code, please try again later.";
return false
end
end


local u=function(u)
if aQ==true then
return false,("A request is already being sent, please slow down.")
else
aQ=true;
end

local v=m();
local x=i.."/public/whitelist/"..aU(aM).."?identifier="..aH(f()).."&key="..u;

if aO then
x=x.."&nonce="..v;
end

local z=aS{
Url=x,
Method="GET",
};

aQ=false;

if z.StatusCode==200 then
local A=aG(z.Body);

if A.success==true then
if A.data.valid==true then
if aO then
if A.data.hash==aH("true".."-"..v.."-"..aN)then
return true,""
else
return false,("failed to verify integrity.")
end
else
return true
end
else
if aV(u,1,4)=="KEY_"then
return true,r(u)
else
return false,("Key is invalid.")
end
end
else
return false,(A.message)
end
elseif z.StatusCode==429 then
return false,("You are being rate limited, please wait 20 seconds and try again.")
else
return false,("Server returned an invalid status code, please try again later.")
end
end


local v=function(v)
local x=m();
local z=i.."/public/flag/"..aU(aM).."?name="..v;

if aO then
z=z.."&nonce="..x;
end

local A=aS{
Url=z,
Method="GET",
};

if A.StatusCode==200 then
local B=aG(A.Body);

if B.success==true then
if aO then
if B.data.hash==aH(aU(B.data.value).."-"..x.."-"..aN)then
return B.data.value
else
aP"failed to verify integrity.";
return nil
end
else
return B.data.value
end
else
aP(B.message);
return nil
end
else
return nil
end
end


return{
Verify=u,
GetFlag=v,
Copy=p,
}
end


return aI end function a.i()






local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ab=aa(game:GetService"HttpService")
local ad={}

function ad.New(ae)
local af=gethwid or function()
return aa(game:GetService"Players").LocalPlayer.UserId
end
local ag,ah=request or http_request or syn_request,setclipboard or toclipboard

function ValidateKey(ai)
local aj="https://api.pandauth.com/api/v1/keys/validate"

local ak={
ServiceID=ae,
HWID=tostring(af()),
Key=tostring(ai),
}

local al=ab:JSONEncode(ak)
local am,an=pcall(function()
return ag{
Url=aj,
Method="POST",
Headers={
["User-Agent"]="Roblox/Exploit",
["Content-Type"]="application/json",
},
Body=al,
}
end)

if am and an then
if an.Success then
local ao,ap=pcall(function()
return ab:JSONDecode(an.Body)
end)

if ao and ap then
if ap.Authenticated_Status and ap.Authenticated_Status=="Success"then
return true,"Authenticated"
else
local aq=ap.Note or"Unknown reason"
return false,"Authentication failed: "..aq
end
else
return false,"JSON decode error"
end
else
warn(
" HTTP request was not successful. Code: "
..tostring(an.StatusCode)
.." Message: "
..an.StatusMessage
)
return false,"HTTP request failed: "..an.StatusMessage
end
else
return false,"Request pcall error"
end
end

function GetKeyLink()
return"https://new.pandadevelopment.net/getkey/"..tostring(ae).."?hwid="..tostring(af())
end

function CopyLink()
return ah(GetKeyLink())
end

return{
Verify=ValidateKey,
Copy=CopyLink,
}
end

return ad end function a.j()







local aa={}

function aa.New(ab,ad)
local ae="https://sdkapi-public.luarmor.net/library.lua"

local af=loadstring(game.HttpGet and game:HttpGet(ae)or HttpService:GetAsync(ae))()
local ag=setclipboard or toclipboard

af.script_id=ab

function ValidateKey(ah)
local ai=af.check_key(ah)


if ai.code=="KEY_VALID"then
return true,"Whitelisted!"
elseif ai.code=="KEY_HWID_LOCKED"then
return false,"Key linked to a different HWID. Please reset it using our bot"
elseif ai.code=="KEY_INCORRECT"then
return false,"Key is wrong or deleted!"
else
return false,"Key check failed:"..ai.message.." Code: "..ai.code
end
end

function CopyLink()
ag(tostring(ad))
end

return{
Verify=ValidateKey,
Copy=CopyLink,
}
end

return aa end function a.k()









local aa={}

function aa.New(ab,ad,ae)
JunkieProtected.API_KEY=ad
JunkieProtected.PROVIDER=ae
JunkieProtected.SERVICE_ID=ab

local function ValidateKey(af)
if not af or af==""then
print"No key provided!"

return false,"No key provided. Please get a key."
end

local ag=JunkieProtected.IsKeylessMode()
if ag and ag.keyless_mode then
print"Keyless mode enabled. Starting script..."
return true,"Keyless mode enabled. Starting script..."
end

local ah=JunkieProtected.ValidateKey{Key=af}
if ah=="valid"then
print"Key is valid! Starting script..."
load()
if _G.JD_IsPremium then
print"Premium user detected!"
else
print"Standard user"
end

return true,"Key is valid!"
else
local ai=JunkieProtected.GetKeyLink()
print"Invalid key!"

return false,"Invalid key. Get one from:"..ai
end
end

local function copyLink()
local af=JunkieProtected.GetKeyLink()

if setclipboard then
setclipboard(af)
end
end
return{
Verify=ValidateKey,
Copy=copyLink
}
end

return aa end function a.l()



return{
platoboost={
Name="Platoboost",
Icon="rbxassetid://75920162824531",
Args={"ServiceId","Secret"},

New=a.load'h'.New
},
pandadevelopment={
Name="Panda Development",
Icon="panda",
Args={"ServiceId"},

New=a.load'i'.New
},
luarmor={
Name="Luarmor",
Icon="rbxassetid://130918283130165",
Args={"ScriptId","Discord"},

New=a.load'j'.New
},
junkiedevelopment={
Name="Junkie Development",
Icon="rbxassetid://106310347705078",
Args={"ServiceId","ApiKey","Provider"},

New=a.load'k'.New
},


}end function a.m()



return[[
{
    "name": "windui",
    "version": "1.6.65",
    "main": "./dist/main.lua",
    "repository": "https://github.com/article-hub-studio/WindUI-Skibidi",
    "discord": "https://discord.gg/ftgs-development-hub-1300692552005189632",
    "author": "Footagesus",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "bash build/build.sh dev $INPUT_FILE",
        "build": "bash build/build.sh build $INPUT_FILE",
        "live": "python3 -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "example-live-build": "INPUT_FILE=main_example.lua npm run live-build",
        "updater": "python3 updater/main.py",
        "docs:dev": "npm --prefix website run dev",
        "docs:build": "npm --prefix website run build",
        "docs:start": "npm --prefix website run start",
        "verify:notification": "stylua --syntax Luau --check src/components/Notification.lua tests/Notification.lua && node tests/notification-layout-safety.test.js",
        "verify:ui": "stylua --syntax Luau --check src/modules/Icons.lua src/modules/Creator.lua src/Init.lua src/components/Notification.lua src/components/window/Openbutton.lua src/themes/Fallbacks.lua tests/Notification.lua && node tests/notification-layout-safety.test.js && node tests/ui-library-advanced.test.js",
        "test:static": "node tests/acrylic-theme-safety.test.js && node tests/notification-layout-safety.test.js && node tests/ui-library-advanced.test.js"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}
]]end function a.n()

local aa={}

local ab=a.load'd'
local ad=ab.New
local ae=ab.Tween

function aa.New(af,ag,ah,ai,aj,ak,al,am)
ai=ai or"Primary"
local an=am or(not al and 10 or 999)
local ao
if ag and ag~=""then
ao=ad("ImageLabel",{
Image=ab.Icon(ag)[1],
ImageRectSize=ab.Icon(ag)[2].ImageRectSize,
ImageRectOffset=ab.Icon(ag)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ImageColor3=ai=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=ai=="White"and 0.4 or 0,
ThemeTag={
ImageColor3=ai~="White"and"Icon"or nil,
},
})
end

local ap=ad("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=aj,
BackgroundTransparency=1,
},{
ab.NewRoundFrame(an,"Squircle",{
ThemeTag={
ImageColor3=ai~="White"and"Button"or nil,
},
ImageColor3=ai=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=ai=="Primary"and 0 or ai=="White"and 0 or 0.9,
}),

ab.NewRoundFrame(an,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=ai=="Secondary"and 0.95 or 1,
}),

ab.NewRoundFrame(an,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",

ImageTransparency=1,
Visible=not al,
}),

ab.NewRoundFrame(an,"SquircleGlass",{
ThemeTag={
ImageColor3="White",
},
Size=UDim2.new(1,1,1,1),

ImageTransparency=0.9,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Outline",
},{













}),

ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=ai~="White"and"Text"or nil,
},
ImageColor3=ai=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1,
},{
ad("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
ad("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
ao,
ad("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=af or"Button",
ThemeTag={
TextColor3=(ai~="Primary"and ai~="White")and"Text",
},
TextColor3=ai=="Primary"and Color3.new(1,1,1)
or ai=="White"and Color3.new(0,0,0)
or nil,
AutomaticSize="XY",
TextSize=18,
}),
}),
})

ab.AddSignal(ap.MouseEnter,function()
ae(ap.Frame,0.047,{ImageTransparency=0.95}):Play()
end)
ab.AddSignal(ap.MouseLeave,function()
ae(ap.Frame,0.047,{ImageTransparency=1}):Play()
end)
ab.AddSignal(ap.MouseButton1Click,function()
if ak then
ak:Close()()
end
if ah then
ab.SafeCallback(ah)
end
end)

return ap
end

return aa end function a.o()

local aa={}

local ab=a.load'd'
local ad=a.load'e'
local ae=ab.New

function aa.New(af,ag,ah,ai,aj,ak,al,am,an)
ai=ai or"Input"
local ao=al or 10
local ap
if ag and ag~=""then
ap=ae("ImageLabel",{
Image=ab.Icon(ag)[1],
ImageRectSize=ab.Icon(ag)[2].ImageRectSize,
ImageRectOffset=ab.Icon(ag)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
})
end

local aq=ai=="Textarea"

local ar=ae("TextBox",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ap and-29 or 0,1,0),
PlaceholderText=af,
ClearTextOnFocus=am or false,
ClipsDescendants=true,
TextWrapped=aq,
MultiLine=aq,
TextXAlignment="Left",
TextYAlignment=ai~="Textarea"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local as=ab.NewRoundFrame(ao,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
})
local at=not an and ab.NewRoundFrame(ao-1,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.8,
})or nil
local au=ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ae("UIPadding",{
PaddingTop=UDim.new(0,ai~="Textarea"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,ai~="Textarea"and 0 or 12),
}),
ae("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=ai~="Textarea"and"Center"or"Top",
HorizontalAlignment="Left",
}),
ap,
ar,
})

local av=ae("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=ah,
BackgroundTransparency=1,
},{
ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
as,
at,
au,
}),
})










if ak then
ab.AddSignal(ar:GetPropertyChangedSignal"Text",function()
if aj then
ab.SafeCallback(aj,ar.Text)
end
end)
else
ab.AddSignal(ar.FocusLost,function()
if aj then
ab.SafeCallback(aj,ar.Text)
end
end)
end

ab.AddSignal(ar.Focused,function()
ad.Play(as,"Focus",{ImageTransparency=0.78},nil,nil,"Focus")
if at then
ad.Play(at,"Focus",{ImageTransparency=0.65},nil,nil,"Focus")
end
end)
ab.AddSignal(ar.FocusLost,function()
ad.Play(as,"Focus",{ImageTransparency=0.85},nil,nil,"Focus")
if at then
ad.Play(at,"Focus",{ImageTransparency=0.8},nil,nil,"Focus")
end
end)

return av
end

return aa end function a.p()

local aa=a.load'd'
local ab=aa.New
local ad=aa.Tween




local ae={
Holder=nil,

Parent=nil,
}

function ae.Create(af,ag,ah,ai,aj)
local ak={
UICorner=28,
UIPadding=12,

Window=ah,
WindUI=ai,

UIElements={},
}

if af then
ak.UIPadding=0
end
if af then
ak.UICorner=26
end

ag=ag or"Dialog"

if not af then
ak.UIElements.FullScreen=ab("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=ae.Parent
or(ah and ah.UIElements and ah.UIElements.Main and ah.UIElements.Main.Main),
},{
ab("UICorner",{
CornerRadius=UDim.new(0,ah.UICorner),
}),
})
end

ab("ImageLabel",{
Image="rbxassetid://8992230677",
ThemeTag={
ImageColor3="WindowShadow",

},
ImageTransparency=1,
Size=UDim2.new(1,100,1,100),
Position=UDim2.new(0,-50,0,-50),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

ak.UIElements.Main=ab("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3=ag.."Background",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,ak.UIPadding),
PaddingLeft=UDim.new(0,ak.UIPadding),
PaddingRight=UDim.new(0,ak.UIPadding),
PaddingBottom=UDim.new(0,ak.UIPadding),
}),
})

ak.UIElements.MainContainer=aa.NewRoundFrame(ak.UICorner,"Squircle",{
Visible=false,

ImageTransparency=af and 0.15 or 0,
Parent=aj or ak.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3=ag.."Background",
ImageTransparency=ag.."BackgroundTransparency",
},
ZIndex=9999,
},{






ak.UIElements.Main,




















})

function ak.Open(al)
if not af then
ak.UIElements.FullScreen.Visible=true
ak.UIElements.FullScreen.Active=true
end

task.spawn(function()
ak.UIElements.MainContainer.Visible=true

if not af then
ad(ak.UIElements.FullScreen,0.1,{BackgroundTransparency=0.65}):Play()
end
ad(ak.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()


task.spawn(function()
task.wait(0.05)
ak.UIElements.Main.Visible=true
end)
end)
end
function ak.Close(al)
if not af then
ad(ak.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
ak.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(0.1)
ak.UIElements.FullScreen.Visible=false
end)
end
ak.UIElements.Main.Visible=false

ad(ak.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()



task.spawn(function()
task.wait(0.1)
if not af then
ak.UIElements.FullScreen:Destroy()
else
ak.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return ak
end

return ae end function a.q()

local aa={}

local ab=a.load'd'
local ad=a.load'e'
local ae=ab.New
local af=game:GetService"Workspace"

local ag=a.load'n'.New
local ah=a.load'o'.New

local function GetViewportSize()
local ai=af.CurrentCamera
return ai and ai.ViewportSize or Vector2.new(1280,720)
end

function aa.new(ai,aj,ak,al)
local am=a.load'p'
local an=am.Create(true,"Popup",ai.Window,ai.WindUI,ai.WindUI.ScreenGui.KeySystem)

local ao={}

local ap

local aq=GetViewportSize()
local ar=aq.X<560
local as=ai.KeySystem.Thumbnail and ai.KeySystem.Thumbnail.Image and not ar
local at=(as and ai.KeySystem.Thumbnail.Width)or 200

local au=ai.KeySystem.Width or 430
if as then
au=430+(at/2)
end
au=math.floor(math.min(au,math.max(300,aq.X-24)))

an.UIElements.Main.AutomaticSize="Y"
an.UIElements.Main.Size=UDim2.new(0,au,0,0)
an.UIElements.MainContainer.ClipsDescendants=true

local av=ae("UIScale",{
Name="Scale",
Scale=0.96,
Parent=an.UIElements.MainContainer,
})

ab.NewRoundFrame(26,"SquircleGlass",{
Name="GlassLayer",
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.84,
ZIndex=9998,
Parent=an.UIElements.MainContainer,
ThemeTag={
ImageColor3="Primary",
},
})

ab.NewRoundFrame(26,"SquircleOutline",{
Name="Outline",
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.62,
ZIndex=9998,
Parent=an.UIElements.MainContainer,
ThemeTag={
ImageColor3="Outline",
},
})

local aw

if ai.Icon then
aw=
ab.Image(ai.Icon,ai.Title..":"..ai.Icon,0,"Temp","KeySystem",ai.IconThemed)
aw.Size=UDim2.new(0,24,0,24)
aw.LayoutOrder=-1
end

local ax=ae("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=ai.KeySystem.Title or ai.Title,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20,
})

local ay=ae("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Text=ai.KeySystem.Subtitle or ai.KeySystem.Description or"Secure access gate",
TextXAlignment="Left",
TextTransparency=0.34,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=13,
})

local az=ae("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ae("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aw,
ax,
})

local aA=ae("TextLabel",{
BackgroundTransparency=1,
Text="Waiting",
TextSize=12,
TextTransparency=0.08,
AutomaticSize="XY",
FontFace=Font.new(ab.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
})

local aB=ab.NewRoundFrame(999,"Squircle",{
Size=UDim2.new(0,0,0,28),
AutomaticSize="X",
ImageTransparency=0.84,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
ae("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
ae("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,6),
}),
ab.NewRoundFrame(999,"Squircle",{
Name="Dot",
Size=UDim2.fromOffset(7,7),
ImageTransparency=0,
ThemeTag={
ImageColor3="Primary",
},
}),
aA,
})

local aC=ae("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{
ae("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
az,
aB,
})

az.Size=UDim2.new(1,-112,0,0)

local aD=ab.NewRoundFrame(18,"Squircle",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.86,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
ae("UIGradient",{
Rotation=18,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.06),
NumberSequenceKeypoint.new(1,0.34),
},
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,14),
PaddingLeft=UDim.new(0,14),
PaddingRight=UDim.new(0,14),
PaddingBottom=UDim.new(0,14),
}),
ae("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
}),
aC,
ay,
})

local aE=ah(ai.KeySystem.Placeholder or"Enter Key","key",nil,"Input",function(aE)
ap=aE
end)

local aF
if ai.KeySystem.Note and ai.KeySystem.Note~=""then
aF=ae("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ai.KeySystem.Note,
TextSize=18,
TextTransparency=0.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local aG=ae("UIGradient",{
Name="FillGradient",
Rotation=0,
Offset=Vector2.new(-0.2,0),
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.08),
NumberSequenceKeypoint.new(0.45,0),
NumberSequenceKeypoint.new(1,0.2),
},
})
local aH=ab.NewRoundFrame(999,"Squircle",{
Name="Fill",
Size=UDim2.new(0.18,0,1,0),
ClipsDescendants=true,
ImageTransparency=0.02,
ZIndex=3,
ThemeTag={
ImageColor3="Primary",
},
},{
aG,
ab.NewRoundFrame(999,"SquircleGlass",{
Name="LiquidSheen",
Size=UDim2.new(0.42,0,1,0),
Position=UDim2.new(0.18,0,0,0),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=0.7,
ZIndex=4,
},{
ae("UIGradient",{
Rotation=0,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.48,0.22),
NumberSequenceKeypoint.new(1,1),
},
}),
}),
})
local aI=ae("TextLabel",{
Size=UDim2.new(1,0,0,16),
BackgroundTransparency=1,
Text="Access check ready",
TextSize=12,
TextTransparency=0.34,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})
local aJ=ab.NewRoundFrame(999,"Squircle",{
Name="ProgressTrack",
Size=UDim2.new(1,0,0,10),
ClipsDescendants=true,
ImageTransparency=0.84,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
ab.NewRoundFrame(999,"SquircleGlass",{
Name="TrackGlass",
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=0.92,
ZIndex=2,
}),
aH,
ab.NewRoundFrame(999,"SquircleOutline",{
Name="TrackOutline",
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.72,
ZIndex=5,
ThemeTag={
ImageColor3="Outline",
},
}),
})
local aK=ae("Frame",{
Size=UDim2.new(1,0,0,30),
BackgroundTransparency=1,
},{
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,6),
}),
aI,
aJ,
})

local function SetState(aL,aM,aN)
aA.Text=tostring(aL or aA.Text)
aI.Text=tostring(aL or aI.Text)
if aN then
aB.Dot.ImageColor3=Color3.fromRGB(255,94,94)
aH.ImageColor3=Color3.fromRGB(255,94,94)
else
ab.SetThemeTag(aB.Dot,{
ImageColor3="Primary",
},0.12)
ab.SetThemeTag(aH,{
ImageColor3="Primary",
},0.12)
end
if aM~=nil then
aG.Offset=Vector2.new(-0.2,0)
ad.Play(aH,"Switch",{
Size=UDim2.new(math.clamp(tonumber(aM)or 0,0,1),0,1,0),
},nil,nil,"KeySystemProgress")
ad.Play(aG,"Background",{
Offset=Vector2.new(0.45,0),
},Enum.EasingStyle.Sine,Enum.EasingDirection.Out,"KeySystemProgressSheen")
end
end

local aL=ae("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ae("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
ae("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
}),
}),
})

local aM
if as then
local aN
if ai.KeySystem.Thumbnail.Title then
aN=ae("TextLabel",{
Text=ai.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
aM=ae("ImageLabel",{
Image=ai.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,at,1,-12),
Position=UDim2.new(0,6,0,6),
Parent=an.UIElements.Main,
ScaleType="Crop",
},{
aN,
ae("UICorner",{
CornerRadius=UDim.new(0,20),
}),
})
end

ae("Frame",{

Size=UDim2.new(1,aM and-at or 0,1,0),
Position=UDim2.new(0,aM and at or 0,0,0),
BackgroundTransparency=1,
Parent=an.UIElements.Main,
},{
ae("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ae("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
aD,
aF,
aE,
aK,
aL,
ae("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
}),
}),
})





local aN=ag("Exit","log-out",function()
an:Close()()
end,"Tertiary",aL.Frame)

if aM then
aN.Parent=aM
aN.Size=UDim2.new(0,0,0,42)
aN.Position=UDim2.new(0,10,1,-10)
aN.AnchorPoint=Vector2.new(0,1)
end

local function NotifyKeySystem(aO,aP,aQ)
if ai.WindUI and ai.WindUI.Notify then
ai.WindUI:Notify{
Title="Key System",
Content=aO,
Icon=aP or"key",
Style=aQ,
}
end
end

local function CopyRawLink(aO)
aO=aO and tostring(aO)or""
if aO==""then
return false,"No key link configured."
end

local aP=setclipboard or toclipboard
if not aP then
return false,"Clipboard is not available on this executor."
end

aP(aO)
return true
end

local function PickServiceLink(aO)
return aO.Discord
or aO.URL
or aO.Url
or aO.url
or aO.Link
or aO.link
end

local function CopyServiceLink(aO)
local aP=PickServiceLink(aO.Config)
local aQ,aR

if aP then
aQ,aR=CopyRawLink(aP)
elseif aO.Instance and type(aO.Instance.Copy)=="function"then
aQ,aR=pcall(aO.Instance.Copy)
else
aQ,aR=false,aO.Error or"Service link is not ready."
end

if aQ then
SetState("Key link copied",0.36)
NotifyKeySystem("Key link copied to clipboard.","key","Success")
else
SetState("Copy unavailable",0.08,true)
NotifyKeySystem(tostring(aR or"Unable to copy key link."),"triangle-alert","Warning")
end
end

if ai.KeySystem.URL and not ai.KeySystem.API then
ag("Get key","key",function()
local aO,aP=CopyRawLink(ai.KeySystem.URL)
if aO then
SetState("Key link copied",0.36)
NotifyKeySystem("Key link copied to clipboard.","key","Success")
else
SetState("Copy unavailable",0.08,true)
NotifyKeySystem(tostring(aP),"triangle-alert","Warning")
end
end,"Secondary",aL.Frame)
end

if ai.KeySystem.API then
local aO={}
for aP,aQ in next,ai.KeySystem.API do
local aR=ai.WindUI.Services[aQ.Type]
if aR then
local aS={}
for aT,aU in next,aR.Args do
table.insert(aS,aQ[aU])
end

local aT,aU=pcall(function()
return aR.New(table.unpack(aS))
end)

local aV={
Config=aQ,
Definition=aR,
Instance=nil,
Error=nil,
}

if aT and aU then
aU.Type=aQ.Type
aV.Instance=aU
table.insert(ao,aU)
else
aV.Error=aU
end

table.insert(aO,aV)
end
end

local aP=math.min(240,math.max(190,au-42))
local aQ=false

if#aO==1 then
ag("Get key","key",function()
CopyServiceLink(aO[1])
end,"Secondary",aL.Frame)
elseif#aO>1 then
local aR=ag("Get key","key",nil,"Secondary",aL.Frame)

local aS=ab.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,1,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.9,
})

ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=aR.Frame,
},{
aS,
ae("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
}),
})

local aT=ab.Image("chevron-down","chevron-down",0,"Temp","KeySystem",true)

aT.Size=UDim2.new(1,0,1,0)

ae("Frame",{
Size=UDim2.new(0,21,0,21),
Parent=aR.Frame,
BackgroundTransparency=1,
},{
aT,
})

local aU=ab.NewRoundFrame(15,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ZIndex=99999,
ThemeTag={
ImageColor3="Background",
},
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,5),
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
}),
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
}),
})

local aV=ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,aP,0,0),
ClipsDescendants=true,
AnchorPoint=Vector2.new(1,0),
Parent=aR,
Position=UDim2.new(1,0,1,10),
ZIndex=99999,
},{
aU,
})

ae("TextLabel",{
Text="Select Service",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=15,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
Parent=aU,
ZIndex=100000,
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,8),
}),
})

for b,d in next,aO do
local e=d.Config
local f=d.Definition
local g=e.Icon or f.Icon or"key-round"
local h=ab.Image(g,g,0,"Temp","KeySystem",true)
h.Size=UDim2.new(0,20,0,20)
h.ZIndex=100000

local i=ab.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,0,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=1,
Parent=aU,
AutomaticSize="Y",
ZIndex=100000,
},{
ae("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
}),
h,
ae("UIPadding",{
PaddingTop=UDim.new(0,9),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,9),
}),
ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,-28,0,0),
AutomaticSize="Y",
ZIndex=100000,
},{
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
HorizontalAlignment="Center",
}),
ae("TextLabel",{
Text=e.Title or f.Name,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.05,
TextSize=18,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
ZIndex=100001,
}),
ae("TextLabel",{
Text=e.Desc or"",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
Visible=e.Desc and true or false,
TextXAlignment="Left",
ZIndex=100001,
}),
}),
},true)

ab.AddSignal(i.MouseEnter,function()
ad.Play(i,"Hover",{ImageTransparency=0.94},nil,nil,"ServiceHover")
end)
ab.AddSignal(i.InputEnded,function()
ad.Play(i,"Hover",{ImageTransparency=1},nil,nil,"ServiceHover")
end)
ad.AttachPress(i,ab,{
Amount=0.985,
})
ab.AddSignal(i.MouseButton1Click,function()
CopyServiceLink(d)
end)
end

ab.AddSignal(aR.MouseButton1Click,function()
if not aQ then
ad.Play(
aV,
"Expand",
{Size=UDim2.new(0,aP,0,aU.AbsoluteSize.Y+1)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"KeyService"
)
ad.Play(aT,"Expand",{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"KeyServiceChevron")
else
ad.Play(
aV,
"Expand",
{Size=UDim2.new(0,aP,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"KeyService"
)
ad.Play(aT,"Expand",{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"KeyServiceChevron")
end
aQ=not aQ
end)
end
end

local function handleSuccess(aO,aP)
SetState("Access granted",1)
an:Close()()
if aP and writefile then
pcall(function()
writefile((ai.Folder or"Temp").."/"..aj..".key",tostring(aO))
end)
end
task.wait(0.35)
ak(true)
end

local aO=false
local aP=ag("Submit","arrow-right",function()
if aO then
return
end
aO=true
SetState("Checking key",0.72)

local aP=tostring(ap or"empty")
local function Reject(aQ)
aO=false
SetState("Invalid key",0.08,true)
ai.WindUI:Notify{
Title="Key System",
Content=aQ or"Invalid key.",
Icon="triangle-alert",
Style="Error",
}
end

if ai.KeySystem.KeyValidator then
local aQ,aR,aS=pcall(ai.KeySystem.KeyValidator,aP)
if not aQ then
Reject(tostring(aR))
return
end

if aR then
handleSuccess(aP,ai.KeySystem.SaveKey)
else
Reject(aS or"Invalid key.")
end
elseif not ai.KeySystem.API then
local aQ=type(ai.KeySystem.Key)=="table"and table.find(ai.KeySystem.Key,aP)
or ai.KeySystem.Key==aP

if aQ then
handleSuccess(aP,ai.KeySystem.SaveKey)
else
Reject"Invalid key."
end
else
local aQ,aR
for aS,aT in next,ao do
local aU,aV,b=pcall(aT.Verify,aP)
if not aU then
local d=aV
aV=false
b=tostring(d)
end
if aV then
aQ,aR=true,b
break
end
aR=b
end

if aQ then
handleSuccess(aP,ai.KeySystem.SaveKey~=false)
else
Reject(aR or"Invalid key.")
end
end
end,"Primary",aL)

aP.AnchorPoint=Vector2.new(1,0.5)
aP.Position=UDim2.new(1,0,0.5,0)










SetState("Waiting for key",0.18)
an:Open()
ad.Play(av,"DropdownOpen",{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"KeySystemScale")
end

return aa end function a.r()

local aa={}

local ab=a.load'd'
local ad=a.load'e'
local ae=ab.New
local af=game:GetService"Workspace"

local function AsConfig(ag)
if ag==true then
return{}
end
return typeof(ag)=="table"and ag or{}
end

local function ClampProgress(ag)
return math.clamp(tonumber(ag)or 0,0,1)
end

local function CreateIcon(ag,ah,ai,aj)
local ak=ab.Image(ag or"sparkles",ag or"sparkles",0,aj or"Temp","LoadingScreen",true,true)
ak.Size=UDim2.fromOffset(ai or 22,ai or 22)
ak.Parent=ah
return ak
end

local function GetViewportSize()
local ag=af.CurrentCamera
return ag and ag.ViewportSize or Vector2.new(1280,720)
end

function aa.new(ag,ah)
ah=AsConfig(ah)

local ai=ah.Steps or{"Theme","Motion","Interface"}
local aj=GetViewportSize()
local ak=math.floor(math.min(ah.Width or 360,math.max(286,aj.X-28)))
local al={
Closed=false,
Progress=ClampProgress(ah.Progress or 0.08),
UIElements={},
}

local am=ae("Frame",{
Name=ah.Name or"WindUILoadingScreen",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Active=true,
ZIndex=ah.ZIndex or 11000,
Parent=ah.Parent or ag.ScreenGui,
})

local an=ae("Frame",{
Name="Scrim",
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(0,0,0),
BackgroundTransparency=1,
ZIndex=am.ZIndex,
Parent=am,
})

local ao=ae("CanvasGroup",{
Name="Content",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
GroupTransparency=1,
ZIndex=am.ZIndex+1,
Parent=am,
})

local ap=ab.NewRoundFrame(ah.Corner or 28,"Squircle",{
Name="Card",
Size=UDim2.fromOffset(ak,230),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=1,
ZIndex=am.ZIndex+2,
Parent=ao,
ThemeTag={
ImageColor3="Background",
},
},{
ae("UIScale",{
Name="Scale",
Scale=0.96,
}),
ab.NewRoundFrame(ah.Corner or 28,"SquircleGlass",{
Name="Glass",
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.82,
ZIndex=am.ZIndex+3,
ThemeTag={
ImageColor3="Primary",
},
}),
ab.NewRoundFrame(ah.Corner or 28,"SquircleOutline",{
Name="Outline",
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.64,
ZIndex=am.ZIndex+4,
ThemeTag={
ImageColor3="Outline",
},
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,18),
PaddingLeft=UDim.new(0,18),
PaddingRight=UDim.new(0,18),
PaddingBottom=UDim.new(0,18),
}),
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,14),
SortOrder="LayoutOrder",
}),
})

local aq=ab.NewRoundFrame(24,"Squircle",{
Name="Accent",
Size=UDim2.new(1,0,0,72),
ImageTransparency=0.82,
LayoutOrder=1,
ZIndex=am.ZIndex+5,
Parent=ap,
ThemeTag={
ImageColor3="Primary",
},
},{
ae("UIGradient",{
Name="AccentGradient",
Rotation=18,
Offset=Vector2.new(-0.25,0),
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.1),
NumberSequenceKeypoint.new(0.5,0.24),
NumberSequenceKeypoint.new(1,0.5),
},
}),
ae("UIPadding",{
PaddingLeft=UDim.new(0,14),
PaddingRight=UDim.new(0,14),
}),
ae("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,12),
}),
})

local ar=ab.NewRoundFrame(999,"Squircle",{
Size=UDim2.fromOffset(42,42),
ImageTransparency=0.72,
ZIndex=am.ZIndex+6,
Parent=aq,
ThemeTag={
ImageColor3="ElementBackground",
},
})
local as=CreateIcon(ah.Icon or"sparkles",ar,21,ah.Folder)
as.AnchorPoint=Vector2.new(0.5,0.5)
as.Position=UDim2.new(0.5,0,0.5,0)

local at=ae("Frame",{
Size=UDim2.new(1,-54,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=aq,
ZIndex=am.ZIndex+6,
},{
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,3),
}),
})

ae("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ah.Title or"WindUI",
TextSize=18,
TextXAlignment="Left",
TextWrapped=true,
FontFace=Font.new(ab.Font,Enum.FontWeight.Bold),
Parent=at,
ThemeTag={
TextColor3="Text",
},
})

ae("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ah.Desc or"Preparing interface",
TextSize=13,
TextTransparency=0.34,
TextXAlignment="Left",
TextWrapped=true,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Parent=at,
ThemeTag={
TextColor3="Text",
},
})

local au=ae("TextLabel",{
Name="Status",
Size=UDim2.new(1,0,0,18),
BackgroundTransparency=1,
Text=ah.Status or ai[1]or"Loading",
TextSize=13,
TextTransparency=0.18,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
LayoutOrder=2,
Parent=ap,
ThemeTag={
TextColor3="Text",
},
})

local av=ab.NewRoundFrame(999,"Squircle",{
Name="ProgressTrack",
Size=UDim2.new(1,0,0,10),
ImageTransparency=0.82,
LayoutOrder=3,
ZIndex=am.ZIndex+5,
Parent=ap,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
ab.NewRoundFrame(999,"Squircle",{
Name="Fill",
Size=UDim2.new(al.Progress,0,1,0),
ImageTransparency=0.06,
ZIndex=am.ZIndex+6,
ThemeTag={
ImageColor3="Primary",
},
},{
ae("UIGradient",{
Name="FillGradient",
Rotation=0,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.05),
NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(1,0.18),
},
}),
}),
})

local aw=ae("Frame",{
Name="Steps",
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
LayoutOrder=4,
Parent=ap,
},{
ae("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
}),
})

local ax={}
for ay,az in next,ai do
local aA=ab.NewRoundFrame(12,"Squircle",{
Size=UDim2.new(1/#ai,-6,1,0),
ImageTransparency=ay==1 and 0.84 or 0.94,
Parent=aw,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
ae("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}),
ae("TextLabel",{
Name="Title",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Text=tostring(az),
TextSize=11,
TextTransparency=ay==1 and 0.08 or 0.4,
TextTruncate="AtEnd",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
}),
})
table.insert(ax,aA)
end

function al.SetStatus(ay,az)
au.Text=tostring(az or"")
return al
end

function al.SetProgress(ay,az)
al.Progress=ClampProgress(az)
ad.Play(av.Fill,"Switch",{
Size=UDim2.new(al.Progress,0,1,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"LoadingProgress")
return al
end

function al.Step(ay,az,aA)
local aB=math.max(#ax,1)
local aC=math.clamp(tonumber(az)or 1,1,aB)
if aA then
al:SetStatus(aA)
else
al:SetStatus(ai[aC]or au.Text)
end
al:SetProgress(aC/aB)

for aD,aE in next,ax do
local aF=aD<=aC
ad.Play(aE,"Switch",{ImageTransparency=aF and 0.84 or 0.94},nil,nil,"Step")
if aE.Title then
ad.Play(aE.Title,"Switch",{TextTransparency=aF and 0.08 or 0.4},nil,nil,"StepText")
end
end
return al
end

function al.Close(ay,az)
if al.Closed then
return al
end
al.Closed=true
task.delay(tonumber(az)or 0,function()
ad.Play(ao,"DropdownClose",{GroupTransparency=1},nil,nil,"LoadingContent")
ad.Play(an,"DropdownClose",{BackgroundTransparency=1},nil,nil,"LoadingScrim")
ad.Play(ap,"DropdownClose",{ImageTransparency=1},nil,nil,"LoadingCard")
ad.Play(ap.Scale,"DropdownClose",{Scale=0.96},nil,nil,"LoadingScale")
task.wait(ad.GetDuration"DropdownClose"+0.03)
if am then
am:Destroy()
end
end)
return al
end

function al.Open(ay)
al.Closed=false
am.Visible=true
an.BackgroundTransparency=1
ao.GroupTransparency=1
ap.ImageTransparency=1
ap.Scale.Scale=0.96
ad.Play(an,"DropdownOpen",{
BackgroundTransparency=ah.ScrimTransparency or 0.2,
},nil,nil,"LoadingScrim")
ad.Play(ao,"DropdownOpen",{GroupTransparency=0},nil,nil,"LoadingContent")
ad.Play(ap,"DropdownOpen",{ImageTransparency=ah.CardTransparency or 0.16},nil,nil,"LoadingCard")
ad.Play(ap.Scale,"DropdownOpen",{Scale=1},nil,nil,"LoadingScale")
return al
end

al.UIElements.Root=am
al.UIElements.Scrim=an
al.UIElements.Content=ao
al.UIElements.Card=ap
al.UIElements.Status=au
al.UIElements.ProgressFill=av.Fill

al:Open()

if ad:IsEnabled()and not ad.Reduced then
task.spawn(function()
local ay=1
while not al.Closed and aq and aq.Parent do
local az=aq:FindFirstChild"AccentGradient"
local aA=av.Fill and av.Fill:FindFirstChild"FillGradient"
if az then
ad.Play(az,"Background",{Offset=Vector2.new(ay*0.28,0)},Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,"LoadingSheen")
end
if aA then
ad.Play(aA,"Background",{Offset=Vector2.new(ay*0.38,0)},Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,"LoadingFillSheen")
end
ay*=-1
task.wait(ad.GetDuration"Background"+0.18)
end
end)
end

if ah.Duration or ah.AutoClose then
task.delay(tonumber(ah.Duration)or 1.2,function()
al:SetProgress(1)
al:Close(ah.CloseDelay or 0.15)
end)
end

return al
end

return aa end function a.s()




local aa=(cloneref or clonereference or function(aa)return aa end)


local function map(ab,ad,ae,af,ag)
return(ab-ad)*(ag-af)/(ae-ad)+af
end

local function viewportPointToWorld(ab,ad)
local ae=aa(game:GetService"Workspace").CurrentCamera:ScreenPointToRay(ab.X,ab.Y)
return ae.Origin+ae.Direction*ad
end

local function getOffset()
local ab=aa(game:GetService"Workspace").CurrentCamera.ViewportSize.Y
return map(ab,0,2560,8,56)
end

return{viewportPointToWorld,getOffset}end function a.t()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=a.load'd'
local ad=ab.New


local ae,af=unpack(a.load's')
local ag=Instance.new("Folder",aa(game:GetService"Workspace").CurrentCamera)


local function createAcrylic()
local ah=ad("Part",{
Name="Body",
Color=Color3.new(0,0,0),
Material=Enum.Material.Glass,
Size=Vector3.new(1,1,0),
Anchored=true,
CanCollide=false,
Locked=true,
CastShadow=false,
Transparency=0.98,
},{
ad("SpecialMesh",{
MeshType=Enum.MeshType.Brick,
Offset=Vector3.new(0,0,-1E-6),
}),
})

return ah
end


local function createAcrylicBlur(ah)
local ai={}

ah=ah or 0.001
local aj={
topLeft=Vector2.new(),
topRight=Vector2.new(),
bottomRight=Vector2.new(),
}
local ak=createAcrylic()
ak.Parent=ag

local function updatePositions(al,am)
aj.topLeft=am
aj.topRight=am+Vector2.new(al.X,0)
aj.bottomRight=am+al
end

local function render()
local al=aa(game:GetService"Workspace").CurrentCamera
if al then
al=al.CFrame
end
local am=al
if not am then
am=CFrame.new()
end

local an=am
local ao=aj.topLeft
local ap=aj.topRight
local aq=aj.bottomRight

local ar=ae(ao,ah)
local as=ae(ap,ah)
local at=ae(aq,ah)

local au=(as-ar).Magnitude
local av=(as-at).Magnitude

ak.CFrame=
CFrame.fromMatrix((ar+at)/2,an.XVector,an.YVector,an.ZVector)
ak.Mesh.Scale=Vector3.new(au,av,0)
end

local function onChange(al)
local am=af()
local an=al.AbsoluteSize-Vector2.new(am,am)
local ao=al.AbsolutePosition+Vector2.new(am/2,am/2)

updatePositions(an,ao)
task.spawn(render)
end

local function renderOnChange()
local al=aa(game:GetService"Workspace").CurrentCamera
if not al then
return
end

table.insert(ai,al:GetPropertyChangedSignal"CFrame":Connect(render))
table.insert(ai,al:GetPropertyChangedSignal"ViewportSize":Connect(render))
table.insert(ai,al:GetPropertyChangedSignal"FieldOfView":Connect(render))
task.spawn(render)
end

ak.Destroying:Connect(function()
for al,am in ai do
pcall(function()
am:Disconnect()
end)
end
end)

renderOnChange()

return onChange,ak
end

return function(ah)
local ai={}
local aj,ak=createAcrylicBlur(ah)

local al=ad("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

ab.AddSignal(al:GetPropertyChangedSignal"AbsolutePosition",function()
aj(al)
end)

ab.AddSignal(al:GetPropertyChangedSignal"AbsoluteSize",function()
aj(al)
end)

ai.AddParent=function(am)
ab.AddSignal(am:GetPropertyChangedSignal"Visible",function()

end)
end

ai.SetVisibility=function(am)
ak.Transparency=am and 0.98 or 1
end

ai.Frame=al
ai.Model=ak

return ai
end end function a.u()


local aa=a.load'd'
local ab=a.load't'

local ad=aa.New

return function(ae)
local af={}

af.Frame=ad("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
},{












ad("UICorner",{
CornerRadius=UDim.new(0,8),
}),

ad("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Name="Background",
ThemeTag={
BackgroundColor3="AcrylicMain",
},
},{
ad("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ad("Frame",{
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{










}),

ad("ImageLabel",{
Image="rbxassetid://9968344105",
ImageTransparency=0.98,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
},{
ad("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ad("ImageLabel",{
Image="rbxassetid://9968344227",
ImageTransparency=0.9,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
ImageTransparency="AcrylicNoise",
},
},{
ad("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ad("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ZIndex=2,
},{










}),
})


local ag

task.wait()
if ae.UseAcrylic then
ag=ab()

ag.Frame.Parent=af.Frame
af.Model=ag.Model
af.AddParent=ag.AddParent
af.SetVisibility=ag.SetVisibility
end

return af,ag
end end function a.v()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab={
AcrylicBlur=a.load't',

AcrylicPaint=a.load'u',
}

function ab.init()
local ad=Instance.new"DepthOfFieldEffect"
ad.FarIntensity=0
ad.InFocusRadius=0.1
ad.NearIntensity=1

local ae={}

function ab.Enable()
for af,ag in pairs(ae)do
ag.Enabled=false
end
ad.Parent=aa(game:GetService"Lighting")
end

function ab.Disable()
for af,ag in pairs(ae)do
ag.Enabled=ag.enabled
end
ad.Parent=nil
end

local function registerDefaults()
local function register(af)
if af:IsA"DepthOfFieldEffect"then
ae[af]={enabled=af.Enabled}
end
end

for af,ag in pairs(aa(game:GetService"Lighting"):GetChildren())do
register(ag)
end

if aa(game:GetService"Workspace").CurrentCamera then
for af,ag in pairs(aa(game:GetService"Workspace").CurrentCamera:GetChildren())do
register(ag)
end
end
end

registerDefaults()
ab.Enable()
end

return ab end function a.w()

local aa={}

local ab=a.load'd'
local ad=ab.New local ae=
ab.Tween


function aa.new(af,ag)
local ah={
Title=af.Title or"Dialog",
Content=af.Content,
Icon=af.Icon,
IconThemed=af.IconThemed,
Thumbnail=af.Thumbnail,
Buttons=af.Buttons,

IconSize=22,
}

local ai=a.load'p'
local aj=ai.Create(true,"Popup",af.WindUI.Window,af.WindUI,ag)

local ak=200

local al=430
if ah.Thumbnail and ah.Thumbnail.Image then
al=430+(ak/2)
end

aj.UIElements.Main.AutomaticSize="Y"
aj.UIElements.Main.Size=UDim2.new(0,al,0,0)



local am

if ah.Icon then
am=ab.Image(
ah.Icon,
ah.Title..":"..ah.Icon,
0,
af.WindUI.Window,
"Popup",
true,
af.IconThemed,
"PopupIcon"
)
am.Size=UDim2.new(0,ah.IconSize,0,ah.IconSize)
am.LayoutOrder=-1
end


local an=ad("TextLabel",{
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ah.Title,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="PopupTitle",
},
TextSize=20,
TextWrapped=true,
Size=UDim2.new(1,am and-ah.IconSize-14 or 0,0,0)
})

local ao=ad("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ad("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
am,an
})

local ap=ad("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





ao,
})

local aq
if ah.Content and ah.Content~=""then
aq=ad("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ah.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="PopupContent",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ar=ad("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ad("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local as
if ah.Thumbnail and ah.Thumbnail.Image then
local at
if ah.Thumbnail.Title then
at=ad("TextLabel",{
Text=ah.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
as=ad("ImageLabel",{
Image=ah.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ak,1,0),
Parent=aj.UIElements.Main,
ScaleType="Crop"
},{
at,
ad("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ad("Frame",{

Size=UDim2.new(1,as and-ak or 0,1,0),
Position=UDim2.new(0,as and ak or 0,0,0),
BackgroundTransparency=1,
Parent=aj.UIElements.Main
},{
ad("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ad("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
ap,
aq,
ar,
ad("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local at=a.load'n'.New

for au,av in next,ah.Buttons do
at(av.Title,av.Icon,av.Callback,av.Variant,ar,aj)
end

aj:Open()


return ah
end

return aa end function a.x()
return function(aa,ab)
return{
Dark={
Name="Dark",

Accent=Color3.fromHex"#18181b",
Dialog=Color3.fromHex"#1a1a1a",
Outline=Color3.fromHex"#FFFFFF",
Text=Color3.fromHex"#FFFFFF",
Placeholder=Color3.fromHex"#a1a1a1",
Background=Color3.fromHex"#101010",
Button=Color3.fromHex"#52525b",
Icon=Color3.fromHex"#a1a1aa",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

SliderIcon=Color3.fromHex"#908F95",
Primary=Color3.fromHex"#0091FF",


LabelBackground=Color3.fromHex"#000000",
LabelBackgroundTransparency=0.83,

ElementBackground=Color3.fromHex"#2A2A2C",
ElementBackgroundTransparency=0,
},

Light={
Name="Light",

Accent=Color3.fromHex"#efefef",
Dialog=Color3.fromHex"#f4f4f5",
Outline=Color3.fromHex"#ffffff",
Text=Color3.fromHex"#000000",
Placeholder=Color3.fromHex"#555555",
Background=Color3.fromHex"#FFFFFF",
Button=Color3.fromHex"#18181b",
Icon=Color3.fromHex"#52525b",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

DropdownTabBackground=Color3.fromHex"#bebebe",
DropdownBackground=Color3.fromHex"#ffffff",

TabBackground=Color3.fromHex"#ffffff",
TabBackgroundHover=Color3.fromHex"#f3f3f3",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#efefef",
TabBackgroundActiveTransparency=0,

PanelBackground=Color3.fromHex"#efefef",
PanelBackgroundTransparency=0,

LabelBackground=Color3.fromHex"#efefef",
LabelBackgroundTransparency=0,

ElementBackground=Color3.fromHex"#ffffff",
ElementBackgroundTransparency=0,
},

Rose={
Name="Rose",

Accent=Color3.fromHex"#be185d",
Dialog=Color3.fromHex"#4c0519",

Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#d67aa6",
Background=Color3.fromHex"#1f0308",
Button=Color3.fromHex"#e95f74",
Icon=Color3.fromHex"#fb7185",

ElementBackground=Color3.fromHex"#381E23",
ElementBackgroundTransparency=0,
},

Plant={
Name="Plant",

Accent=Color3.fromHex"#166534",
Dialog=Color3.fromHex"#052e16",

Text=Color3.fromHex"#f0fdf4",
Placeholder=Color3.fromHex"#4fbf7a",
Background=Color3.fromHex"#0a1b0f",
Button=Color3.fromHex"#16a34a",
Icon=Color3.fromHex"#4ade80",

ElementBackground=Color3.fromHex"#28342A",
ElementBackgroundTransparency=0,
},

Red={
Name="Red",

Accent=Color3.fromHex"#991b1b",
Dialog=Color3.fromHex"#450a0a",

Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#d95353",
Background=Color3.fromHex"#1c0606",
Button=Color3.fromHex"#dc2626",
Icon=Color3.fromHex"#ef4444",

ElementBackground=Color3.fromHex"#322221",
ElementBackgroundTransparency=0,
},

Indigo={
Name="Indigo",

Accent=Color3.fromHex"#3730a3",
Dialog=Color3.fromHex"#1e1b4b",

Text=Color3.fromHex"#f1f5f9",
Placeholder=Color3.fromHex"#7078d9",
Background=Color3.fromHex"#0f0a2e",
Button=Color3.fromHex"#4f46e5",
Icon=Color3.fromHex"#6366f1",

ElementBackground=Color3.fromHex"#282543",
ElementBackgroundTransparency=0,
},

Sky={
Name="Sky",

Accent=Color3.fromHex"#00d4ff",
Dialog=Color3.fromHex"#0a4d66",

Text=Color3.fromHex"#e6f7ff",
Placeholder=Color3.fromHex"#66b3cc",
Background=Color3.fromHex"#051a26",
Button=Color3.fromHex"#00a8cc",
Icon=Color3.fromHex"#2db8d9",

Toggle=Color3.fromHex"#00d9d9",
Slider=Color3.fromHex"#00d4ff",
Checkbox=Color3.fromHex"#00d4ff",

PanelBackground=Color3.fromHex"#0d3a47",
PanelBackgroundTransparency=0.8,

ElementBackground=Color3.fromHex"#172E3B",
ElementBackgroundTransparency=0,
},

Violet={
Name="Violet",

Accent=Color3.fromHex"#6d28d9",
Dialog=Color3.fromHex"#3c1361",

Text=Color3.fromHex"#faf5ff",
Placeholder=Color3.fromHex"#8f7ee0",
Background=Color3.fromHex"#1e0a3e",
Button=Color3.fromHex"#7c3aed",
Icon=Color3.fromHex"#8b5cf6",

ElementBackground=Color3.fromHex"#342650",
ElementBackgroundTransparency=0,
},

Amber={
Name="Amber",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#b45309",Transparency=0},
["100"]={Color=Color3.fromHex"#d97706",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#451a03",Transparency=0},
["100"]={Color=Color3.fromHex"#6b2e05",Transparency=0},
},{Rotation=90}),






Text=aa:Gradient({
["0"]={Color=Color3.fromHex"#fffbeb",Transparency=0},
["100"]={Color=Color3.fromHex"#fff7ed",Transparency=0},
},{Rotation=45}),

Placeholder=aa:Gradient({
["0"]={Color=Color3.fromHex"#d1a326",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#1c1003",Transparency=0},
["100"]={Color=Color3.fromHex"#3f210d",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Icon=Color3.fromHex"#f59e0b",

Toggle=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Slider=Color3.fromHex"#d97706",

Checkbox=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

ElementBackground=Color3.fromHex"#3A2E22",
ElementBackgroundTransparency=0,
},

Emerald={
Name="Emerald",

Accent=Color3.fromHex"#047857",
Dialog=Color3.fromHex"#022c22",

Text=Color3.fromHex"#ecfdf5",
Placeholder=Color3.fromHex"#3fbf8f",
Background=Color3.fromHex"#011411",
Button=Color3.fromHex"#059669",
Icon=Color3.fromHex"#10b981",

ElementBackground=Color3.fromHex"#202E2A",
ElementBackgroundTransparency=0,
},

Midnight={
Name="Midnight",

Accent=Color3.fromHex"#1e3a8a",
Dialog=Color3.fromHex"#0c1e42",

Text=Color3.fromHex"#dbeafe",
Placeholder=Color3.fromHex"#2f74d1",
Background=Color3.fromHex"#0a0f1e",
Button=Color3.fromHex"#2563eb",
Primary=Color3.fromHex"#2563eb",
Icon=Color3.fromHex"#5591f4",

ElementBackground=Color3.fromHex"#242836",
ElementBackgroundTransparency=0,
},

Crimson={
Name="Crimson",

Accent=Color3.fromHex"#b91c1c",
Dialog=Color3.fromHex"#450a0a",

Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#6f757b",
Background=Color3.fromHex"#0c0404",
Button=Color3.fromHex"#991b1b",
Icon=Color3.fromHex"#dc2626",

ElementBackground=Color3.fromHex"#251F1F",
ElementBackgroundTransparency=0,
},

MonokaiPro={
Name="Monokai Pro",

Accent=Color3.fromHex"#fc9867",
Dialog=Color3.fromHex"#1e1e1e",

Text=Color3.fromHex"#fcfcfa",
Placeholder=Color3.fromHex"#afafaf",
Background=Color3.fromHex"#191622",
Button=Color3.fromHex"#ab9df2",
Icon=Color3.fromHex"#a9dc76",

ElementBackground=Color3.fromHex"#323039",
ElementBackgroundTransparency=0,

Metadata={
PullRequest=23,
},
},

CottonCandy={
Name="Cotton Candy",

Accent=Color3.fromHex"#ec4899",
Dialog=Color3.fromHex"#2d1b3d",

Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#8a5fd3",
Background=Color3.fromHex"#1a0b2e",
Button=Color3.fromHex"#d946ef",
Slider=Color3.fromHex"#d946ef",
Icon=Color3.fromHex"#06b6d4",

ElementBackground=Color3.fromHex"#312643",
ElementBackgroundTransparency=0,
},

Mellowsi={
Name="Mellowsi",

Accent=Color3.fromHex"#342A1E",
Dialog=Color3.fromHex"#291C13",

Text=Color3.fromHex"#F5EBDD",
Placeholder=Color3.fromHex"#9C8A73",
Background=Color3.fromHex"#1C1002",
Button=Color3.fromHex"#342A1E",
Icon=Color3.fromHex"#C9B79C",

Toggle=Color3.fromHex"#a9873f",
Slider=Color3.fromHex"#C9A24D",
Checkbox=Color3.fromHex"#C9A24D",

ElementBackground=Color3.fromHex"#33291E",
ElementBackgroundTransparency=0,

Metadata={
PullRequest=52,
},
},

Rainbow={
Name="Rainbow",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#00ff41",Transparency=0},
["33"]={Color=Color3.fromHex"#00ffff",Transparency=0},
["66"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["100"]={Color=Color3.fromHex"#8000ff",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#8000ff",Transparency=0},
["50"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["75"]={Color=Color3.fromHex"#00ff80",Transparency=0},
["100"]={Color=Color3.fromHex"#ff8000",Transparency=0},
},{Rotation=135}),


Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#00ff80",

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0040",Transparency=0},
["20"]={Color=Color3.fromHex"#ff4000",Transparency=0},
["40"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["60"]={Color=Color3.fromHex"#00ff40",Transparency=0},
["80"]={Color=Color3.fromHex"#0040ff",Transparency=0},
["100"]={Color=Color3.fromHex"#4000ff",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#ff8000",Transparency=0},
["50"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["75"]={Color=Color3.fromHex"#80ff00",Transparency=0},
["100"]={Color=Color3.fromHex"#00ffff",Transparency=0},
},{Rotation=60}),

Icon=Color3.fromHex"#ffffff",
},
}
end end function a.y()

local aa={}

local ab=a.load'd'
local ad=ab.New local ae=
ab.Tween

function aa.New(af,ag,ah,ai,aj,ak)
local al=aj or 10
local am
if ag and ag~=""then
am=ad("ImageLabel",{
Image=ab.Icon(ag)[1],
ImageRectSize=ab.Icon(ag)[2].ImageRectSize,
ImageRectOffset=ab.Icon(ag)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
})
end

local an=ad("TextLabel",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,am and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3=ai and"Placeholder"or"Text",
},
Text=af,
})

local ao=ad("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=ah,
BackgroundTransparency=1,
Text="",
},{
ad("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(al,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
}),
not ak and ab.NewRoundFrame(al,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
ImageTransparency=0.9,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})or nil,
ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ad("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
ad("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
am,
an,
}),
}),
})

return ao
end

return aa end function a.z()

local aa={}

local ab=cloneref or clonereference or function(ab)
return ab
end
local ad=ab(game:GetService"UserInputService")

local ae=a.load'd'
local af=ae.New

function aa.New(ag,ah,ai,aj,ak)
local al=af("Frame",{
Size=UDim2.new(0,aj,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=ah,
ZIndex=999,
Active=true,
})

local am=ae.NewRoundFrame(aj/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=al,
})

local an=af("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=am,
})

local ao=ae:GenerateUniqueID()
local ap=false
local aq,ar

local function UpdateVisuals()
local as=ag.AbsoluteCanvasSize.Y
local at=ag.AbsoluteWindowSize.Y

if as<=at then
am.Visible=false
return
end

am.Visible=true

local au=math.clamp(at/as,0.05,1)
am.Size=UDim2.new(1,0,au,0)

local av=as-at
local aw=1-au

if av>0 then
local ax=ag.CanvasPosition.Y/av
am.Position=UDim2.new(0,0,math.clamp(ax*aw,0,aw),0)
else
am.Position=UDim2.new(0,0,0,0)
end
end

local function StopDrag()
if ak.CurrentInput==ao then
ak.CurrentInput=nil
end
ap=false
ag.ScrollingEnabled=true
if aq then
aq:Disconnect()
end
if ar then
ar:Disconnect()
end
end

ae.AddSignal(an.InputBegan,function(as)
if
as.UserInputType~=Enum.UserInputType.MouseButton1
and as.UserInputType~=Enum.UserInputType.Touch
then
return
end
if ap then
return
end
if ak.CurrentInput and ak.CurrentInput~=ao then
return
end

ak.CurrentInput=ao

ap=true
ag.ScrollingEnabled=false

local at=as.Position.Y
local au=ag.CanvasPosition.Y

aq=ad.InputChanged:Connect(function(av)
if
av.UserInputType==Enum.UserInputType.MouseMovement
or av.UserInputType==Enum.UserInputType.Touch
then
local aw=av.Position.Y-at

local ax=ag.AbsoluteCanvasSize.Y
local ay=ag.AbsoluteWindowSize.Y
local az=math.max(ax-ay,0)

local aA=al.AbsoluteSize.Y
local aB=am.AbsoluteSize.Y
local aC=math.max(aA-aB,1)

local aD=aw*(az/aC)

ag.CanvasPosition=
Vector2.new(ag.CanvasPosition.X,math.clamp(au+aD,0,az))
end
end)

ar=ad.InputEnded:Connect(function(av)
if av.UserInputType==as.UserInputType then
if ak.CurrentInput and ak.CurrentInput~=ao then
return
end

ak.CurrentInput=nil

StopDrag()
end
end)
end)

ae.AddSignal(ag:GetPropertyChangedSignal"AbsoluteWindowSize",UpdateVisuals)
ae.AddSignal(ag:GetPropertyChangedSignal"AbsoluteCanvasSize",UpdateVisuals)
ae.AddSignal(ag:GetPropertyChangedSignal"CanvasPosition",UpdateVisuals)

UpdateVisuals()

return al
end

return aa end function a.A()

local aa={}

local ab=a.load'd'
local ad=ab.New
local ae=ab.Tween

function aa.New(af,ag,ah)
local ai={
Title=ag.Title or"Tag",
Icon=ag.Icon,
Color=ag.Color or Color3.fromHex"#315dff",
Radius=ag.Radius or 999,
Border=ag.Border or false,

TagFrame=nil,
Height=26,
Padding=10,
TextSize=14,
IconSize=16,
}

local aj
if ai.Icon then
aj=ab.Image(ai.Icon,ai.Icon,0,ag.Window,"Tag",false)

aj.Size=UDim2.new(0,ai.IconSize,0,ai.IconSize)
aj.ImageLabel.ImageColor3=typeof(ai.Color)=="Color3"
and ab.GetTextColorForHSB(ai.Color)
or typeof(ai.Color)=="string"
and(ab.GetTextColorForHSB(ab.GetThemeProperty(ai.Color,ab.Theme)))
end

local ak=ad("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ai.TextSize,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ai.Title,
TextColor3=typeof(ai.Color)=="Color3"and ab.GetTextColorForHSB(ai.Color)or typeof(
ai.Color
)=="string"and(ab.GetTextColorForHSB(ab.GetThemeProperty(ai.Color,ab.Theme))),
})

local al

if typeof(ai.Color)=="table"then
al=ad"UIGradient"
for am,an in next,ai.Color do
al[am]=an
end

ak.TextColor3=ab.GetTextColorForHSB(ab.GetAverageColor(al))
if aj then
aj.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ab.GetAverageColor(al))
end
end

local am=ab.NewRoundFrame(ai.Radius,"Squircle",{
AutomaticSize="X",
Size=UDim2.new(0,0,0,ai.Height),
Parent=ah,
ImageColor3=typeof(ai.Color)=="Color3"and ai.Color
or typeof(ai.Color)=="table"and Color3.new(1,1,1)
or nil,
ThemeTag=typeof(ai.Color)=="string"and{
ImageColor3=ai.Color,
},
},{
al,
ab.NewRoundFrame(ai.Radius+1,"SquircleGlass",{
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=0.75,
}),
ad("Frame",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Name="Content",
BackgroundTransparency=1,
},{
aj,
ak,
ad("UIPadding",{
PaddingLeft=UDim.new(0,ai.Padding),
PaddingRight=UDim.new(0,ai.Padding),
}),
ad("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,ai.Padding/1.5),
}),
}),
})

function ai.SetTitle(an,ao)
ai.Title=ao
ak.Text=ao

return ai
end

function ai.SetColor(an,ao)
ai.Color=ao
if typeof(ao)=="table"then
local ap=ab.GetAverageColor(ao)
ae(ak,0.06,{TextColor3=ab.GetTextColorForHSB(ap)}):Play()
local aq=am:FindFirstChildOfClass"UIGradient"or ad("UIGradient",{Parent=am})
for ar,as in next,ao do
aq[ar]=as
end
ae(am,0.06,{ImageColor3=Color3.new(1,1,1)}):Play()
else
if al then
al:Destroy()
end
ae(ak,0.06,{TextColor3=ab.GetTextColorForHSB(ao)}):Play()
if aj then
ae(aj.ImageLabel,0.06,{ImageColor3=ab.GetTextColorForHSB(ao)}):Play()
end
ae(am,0.06,{ImageColor3=ao}):Play()
end

return ai
end

function ai.SetIcon(an,ao)
ai.Icon=ao

if ao then
aj=ab.Image(ao,ao,0,ag.Window,"Tag",false)

aj.Size=UDim2.new(0,ai.IconSize,0,ai.IconSize)
aj.Parent=am

if typeof(ai.Color)=="Color3"then
aj.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ai.Color)
elseif typeof(ai.Color)=="table"then
aj.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ab.GetAverageColor(al))
end
else
if aj then
aj:Destroy()
aj=nil
end
end
return ai
end

function ai.Destroy(an)
am:Destroy()
return ai
end

ab:OnThemeChange(function(an,ao)
ak.TextColor3=ab.GetTextColorForHSB(ab.GetThemeProperty(ai.Color,ab.Theme))
aj.ImageLabel.ImageColor3=
ab.GetTextColorForHSB(ab.GetThemeProperty(ai.Color,ab.Theme))
end)

return ai
end

return aa end function a.B()

local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=aa(game:GetService"RunService")
local ad=aa(game:GetService"HttpService")

local ae

local af
af={
Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Default:ToHex(),
transparency=ag.Transparency or nil,
}
end,
Load=function(ag,ah)
if ag and ag.Update then
ag:Update(Color3.fromHex(ah.value),ah.transparency or nil)
end
end
},
Dropdown={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Select then
ag:Select(ah.value)
end
end
},
Input={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value)
end
end
},
Keybind={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value)
end
end
},
RadioGroup={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Get and ag:Get()or ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Select then
ag:Select(ah.value,false)
end
end
},
CheckboxGroup={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Get and ag:Get()or ag.Values,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value or{},false)
end
end
},
SegmentedControl={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Get and ag:Get()or ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Select then
ag:Select(ah.value,false)
end
end
},
TextArea={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Get and ag:Get()or ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value or"",false)
end
end
},
Slider={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value.Default,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(tonumber(ah.value))
end
end
},
Stepper={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Get and ag:Get()or ag.Value.Default,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(tonumber(ah.value),false)
end
end
},
TabBox={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Get and ag:Get()or ag.SelectedValue,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value)
end
end
},
ChipList={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Get and ag:Get()or ag.Values,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value,false)
end
end
},
Toggle={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value)
end
end
},
}
}

function af.Init(ag,ah)
if not ah.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
return false
end
if ab:IsStudio()or not writefile then
warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
return false
end

ae=ah
af.Folder=ae.Folder
af.Path="WindUI/"..tostring(af.Folder).."/config/"

if not isfolder(af.Path)then
makefolder(af.Path)
end

local ai=af:AllConfigs()

for aj,ak in next,ai do
local al=af.Path..tostring(ak)..".json"
if isfile and readfile and isfile(al)then
local am,an=pcall(function()
return readfile(al)
end)
if am then
af.Configs[ak]=an
end
end
end

return af
end

function af.SetPath(ag,ah)
if not ah then
warn"[ WindUI.ConfigManager ] Custom path is not specified."
return false
end

af.Path=ah
if not ah:match"/$"then
af.Path=ah.."/"
end

if not isfolder(af.Path)then
makefolder(af.Path)
end

return true
end

function af.CreateConfig(ag,ah,ai)
local aj={
Path=af.Path..ah..".json",
Elements={},
CustomData={},
AutoLoad=ai or false,
Version=1.2,
}

if not ah then
return false,"No config file is selected"
end

function aj.SetAsCurrent(ak)
ae:SetCurrentConfig(aj)
end

function aj.Register(ak,al,am)
aj.Elements[al]=am
end

function aj.Set(ak,al,am)
aj.CustomData[al]=am
end

function aj.Get(ak,al)
return aj.CustomData[al]
end

function aj.SetAutoLoad(ak,al)
aj.AutoLoad=al
end

function aj.Save(ak)
if ae.PendingFlags then
for al,am in next,ae.PendingFlags do
aj:Register(al,am)
end
end

local al={
__version=aj.Version,
__elements={},
__autoload=aj.AutoLoad,
__custom=aj.CustomData
}

for am,an in next,aj.Elements do
if af.Parser[an.__type]then
al.__elements[tostring(am)]=af.Parser[an.__type].Save(an)
end
end

local am=ad:JSONEncode(al)
if writefile then
local an,ao=pcall(function()
writefile(aj.Path,am)
end)
if not an then
return false,"Failed to save config: "..tostring(ao)
end
else
return false,"writefile function is not available"
end

return al
end

function aj.Load(ak)
if isfile and not isfile(aj.Path)then
return false,"Config file does not exist"
end

local al,am=pcall(function()
local al=readfile or function()
warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
return nil
end
return ad:JSONDecode(al(aj.Path))
end)

if not al then
return false,"Failed to parse config file"
end

if not am.__version then
local an={
__version=aj.Version,
__elements=am,
__custom={}
}
am=an
end

if ae.PendingFlags then
for an,ao in next,ae.PendingFlags do
aj:Register(an,ao)
end
end

ae.PendingConfigData=am.__elements or{}

for an,ao in next,(am.__elements or{})do
if typeof(ao)=="table"and aj.Elements[an]and af.Parser[ao.__type]then
task.spawn(function()
local ap,aq=pcall(function()
af.Parser[ao.__type].Load(aj.Elements[an],ao)
end)
if not ap then
warn("[ WindUI.ConfigManager ] Failed to load element '"..tostring(an).."': "..tostring(aq))
end
end)
end
end

aj.CustomData=am.__custom or{}

return aj.CustomData
end

function aj.Delete(ak)
if not delfile then
return false,"delfile function is not available"
end

if not isfile(aj.Path)then
return false,"Config file does not exist"
end

local al,am=pcall(function()
delfile(aj.Path)
end)

if not al then
return false,"Failed to delete config file: "..tostring(am)
end

af.Configs[ah]=nil

if ae.CurrentConfig==aj then
ae.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function aj.GetData(ak)
return{
elements=aj.Elements,
custom=aj.CustomData,
autoload=aj.AutoLoad
}
end


if isfile(aj.Path)then
local ak,al=pcall(function()
return ad:JSONDecode(readfile(aj.Path))
end)

if ak and al and al.__autoload then
aj.AutoLoad=true

task.spawn(function()
task.wait(0.5)
local am,an=pcall(function()
return aj:Load()
end)
if am then
if ae.Debug then print("[ WindUI.ConfigManager ] AutoLoaded config: "..ah)end
else
warn("[ WindUI.ConfigManager ] Failed to AutoLoad config: "..ah.." - "..tostring(an))
end
end)
end
end


aj:SetAsCurrent()
af.Configs[ah]=aj
return aj
end

function af.Config(ag,ah,ai)
return af:CreateConfig(ah,ai)
end

function af.GetAutoLoadConfigs(ag)
local ah={}

for ai,aj in pairs(af.Configs)do
if aj.AutoLoad then
table.insert(ah,ai)
end
end

return ah
end

function af.DeleteConfig(ag,ah)
if not delfile then
return false,"delfile function is not available"
end

local ai=af.Path..ah..".json"

if not isfile(ai)then
return false,"Config file does not exist"
end

local aj,ak=pcall(function()
delfile(ai)
end)

if not aj then
return false,"Failed to delete config file: "..tostring(ak)
end

af.Configs[ah]=nil

if ae.CurrentConfig and ae.CurrentConfig.Path==ai then
ae.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function af.AllConfigs(ag)
if not listfiles then return{}end

local ah={}
if not isfolder(af.Path)then
makefolder(af.Path)
return ah
end

for ai,aj in next,listfiles(af.Path)do
local ak=aj:match"([^\\/]+)%.json$"
if ak then
table.insert(ah,ak)
end
end

return ah
end

function af.GetConfig(ag,ah)
return af.Configs[ah]
end

return af end function a.C()

local aa={}

local ab=a.load'd'
local ad=ab.New
local ae=ab.Tween

local af=(cloneref or clonereference or function(af)
return af
end)

local ag=af(game:GetService"TextService")

local ah={
TopCenter={
Position=UDim2.new(0.5,0,0,8),
AnchorPoint=Vector2.new(0.5,0),
},
TopLeft={
Position=UDim2.new(0,14,0,8),
AnchorPoint=Vector2.new(0,0),
},
TopRight={
Position=UDim2.new(1,-14,0,8),
AnchorPoint=Vector2.new(1,0),
},
BottomCenter={
Position=UDim2.new(0.5,0,1,-14),
AnchorPoint=Vector2.new(0.5,1),
},
BottomLeft={
Position=UDim2.new(0,14,1,-14),
AnchorPoint=Vector2.new(0,1),
},
BottomRight={
Position=UDim2.new(1,-14,1,-14),
AnchorPoint=Vector2.new(1,1),
},
}

local ai={
closed="Collapsed",
circle="Collapsed",
icon="Collapsed",
mini="Collapsed",
collapsed="Collapsed",
compact="Compact",
default="Compact",
pill="Compact",
open="Expanded",
expanded="Expanded",
dynamic="Expanded",
}

local function Pick(aj,ak)
if aj~=nil then
return aj
end
return ak
end

local function NormalizeState(aj)
return ai[tostring(aj or"Compact"):lower()]or"Compact"
end

local function NormalizeColorSequence(aj,ak)
if typeof(aj)=="ColorSequence"then
return aj
end
if typeof(aj)=="Color3"then
return ColorSequence.new(aj)
end
return ak
end

local function GetInnerCornerRadius(aj,ak)
if typeof(aj)~="UDim"then
return UDim.new(1,0)
end
if aj.Scale~=0 then
return UDim.new(aj.Scale,math.max(aj.Offset,0))
end
return UDim.new(0,math.max(aj.Offset-ak,0))
end

local function MeasureText(aj,ak,al)
local am=
ag:GetTextSize(tostring(aj or""),ak,Enum.Font.GothamMedium,Vector2.new(al,1000))
return math.ceil(am.X),math.ceil(am.Y)
end

function aa.New(aj)
local ak=ColorSequence.new(Color3.fromHex"#40C9FF",Color3.fromHex"#E81CFF")
local al={
Title=aj.Title or"Open",
Content=nil,
Icon=aj.Icon,
Enabled=true,
Visible=false,
OnlyMobile=true,
Draggable=true,
Position="TopCenter",
State="Compact",
Height=44,
ExpandedHeight=68,
ExpandedWidth=220,
MaxWidth=380,
IconSize=22,
Padding=12,
Gap=9,
Scale=1,
CornerRadius=UDim.new(1,0),
StrokeThickness=1,
StrokeTransparency=0.7,
Color=ak,
BackgroundColor=Color3.fromRGB(7,8,11),
BackgroundTransparency=0.08,
TextColor=nil,
TextTransparency=nil,
AutoCollapse=nil,
OnStateChange=nil,
}

local am={
Button=nil,
Container=nil,
IconSize=al.IconSize,
Scale=al.Scale,
State=al.State,
Config=al,
UIElements={},
}

local an=0
local ao={}
local ap
local aq

local ar=ad("Frame",{
Name="OpenButtonContainer",
Size=UDim2.fromOffset(al.Height,al.Height),
Position=ah.TopCenter.Position,
AnchorPoint=ah.TopCenter.AnchorPoint,
Parent=aj.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
ZIndex=98,
})

local as=ad("UIScale",{
Name="Scale",
Scale=al.Scale,
Parent=ar,
})

local at=ad("Frame",{
Name="Shadow",
Size=UDim2.new(1,4,1,4),
Position=UDim2.fromOffset(-2,3),
BackgroundColor3=Color3.new(0,0,0),
BackgroundTransparency=0.58,
BorderSizePixel=0,
ZIndex=98,
Parent=ar,
},{
ad("UICorner",{
CornerRadius=al.CornerRadius,
}),
})

local au=ad("UIGradient",{
Name="UIGradient",
Color=al.Color,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.12),
NumberSequenceKeypoint.new(0.5,0.52),
NumberSequenceKeypoint.new(1,0.18),
},
})

local av=ad("UIStroke",{
Name="UIStroke",
Thickness=al.StrokeThickness,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.new(1,1,1),
Transparency=al.StrokeTransparency,
},{
au,
})

local aw=ad("Frame",{
Name="OpenButton",
Size=UDim2.fromScale(1,1),
BackgroundColor3=al.BackgroundColor,
BackgroundTransparency=al.BackgroundTransparency,
BorderSizePixel=0,
ClipsDescendants=true,
Active=true,
ZIndex=99,
Parent=ar,
},{
ad("UICorner",{
CornerRadius=al.CornerRadius,
}),
av,
ad("Frame",{
Name="Surface",
Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=0.965,
BorderSizePixel=0,
ZIndex=99,
},{
ad("UICorner",{
CornerRadius=al.CornerRadius,
}),
ad("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.48),
NumberSequenceKeypoint.new(0.45,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
}),
})

local ax=ad("Frame",{
Name="Drag",
Size=UDim2.fromOffset(36,36),
Position=UDim2.fromOffset(4,4),
BackgroundTransparency=1,
ZIndex=102,
Parent=aw,
})

local ay=ab.Image("move","OpenButtonDrag",0,aj.Folder,"OpenButton",true,true)
ay.Name="Icon"
ay.Size=UDim2.fromOffset(17,17)
ay.Position=UDim2.fromScale(0.5,0.5)
ay.AnchorPoint=Vector2.new(0.5,0.5)
ay.Parent=ax
local az=ay:FindFirstChildWhichIsA"ImageLabel"
if az then
az.ImageTransparency=0.42
end

local aA=ad("Frame",{
Name="Divider",
Size=UDim2.new(0,1,1,-18),
Position=UDim2.new(0,44,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=0.88,
BorderSizePixel=0,
ZIndex=102,
Parent=aw,
})

local aB=ad("TextButton",{
Name="TextButton",
Text="",
AutoButtonColor=false,
Size=UDim2.new(1,-45,1,0),
Position=UDim2.fromOffset(45,0),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=1,
BorderSizePixel=0,
ClipsDescendants=true,
ZIndex=101,
Parent=aw,
},{
ad("UICorner",{
CornerRadius=GetInnerCornerRadius(al.CornerRadius,4),
}),
})

local aC=ad("Frame",{
Name="HoverSurface",
Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=1,
BorderSizePixel=0,
ZIndex=101,
Parent=aB,
},{
ad("UICorner",{
CornerRadius=GetInnerCornerRadius(al.CornerRadius,4),
}),
})

local aD=ad("CanvasGroup",{
Name="TextStack",
Size=UDim2.new(1,-58,1,0),
Position=UDim2.fromOffset(46,0),
BackgroundTransparency=1,
GroupTransparency=0,
ZIndex=103,
Parent=aB,
})

local aE=ad("TextLabel",{
Name="Title",
Text=al.Title,
TextSize=15,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Center,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ZIndex=103,
ThemeTag={
TextColor3="Text",
},
Parent=aD,
})

local aF=ad("TextLabel",{
Name="Content",
Text="",
TextSize=12,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,0,0,18),
Position=UDim2.fromOffset(0,35),
BackgroundTransparency=1,
TextTransparency=0.38,
Visible=false,
ZIndex=103,
ThemeTag={
TextColor3="Text",
},
Parent=aD,
})

local aG=ab.Image("chevron-up","OpenButtonExpand",0,aj.Folder,"OpenButton",true,true)
aG.Name="TrailingIcon"
aG.Size=UDim2.fromOffset(15,15)
aG.Position=UDim2.new(1,-17,0.5,0)
aG.AnchorPoint=Vector2.new(0.5,0.5)
aG.Visible=false
aG.ZIndex=103
aG.Parent=aB
local aH=aG:FindFirstChildWhichIsA"ImageLabel"
if aH then
aH.ImageTransparency=0.48
end

local function StopTween(aI)
local aJ=ao[aI]
if aJ then
aJ:Cancel()
ao[aI]=nil
end
end

local function Animate(aI,aJ,aK)
StopTween(aI)
if aJ<=0 then
for aL,aM in aK do
aI[aL]=aM
end
return nil
end

local aL=ae(aI,aJ,aK,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
ao[aI]=aL
aL:Play()
return aL
end

local function ApplyPosition(aI)
if typeof(aI)=="UDim2"then
ar.Position=aI
ar.AnchorPoint=Vector2.new(0.5,0.5)
return
end

local aJ=ah[tostring(aI or"TopCenter")]or ah.TopCenter
ar.Position=aJ.Position
ar.AnchorPoint=aJ.AnchorPoint
end

local function GetDragWidth(aI,aJ)
if not al.Draggable or aI=="Collapsed"then
return 0
end
return aJ
end

local function GetTargetSize(aI)
local aJ=if aI=="Expanded"then al.ExpandedHeight else al.Height
if aI=="Collapsed"then
return Vector2.new(al.Height,al.Height)
end

local aK=math.max(al.MaxWidth-120,80)
local aL=MeasureText(al.Title,15,aK)
local aM=if aI=="Expanded"and al.Content
then MeasureText(al.Content,12,aK)
else 0
local aN=math.max(aL,aM)
local aO=GetDragWidth(aI,aJ)
local aP=if ap then al.IconSize+al.Gap else 0
local aQ=if aI=="Expanded"then 24 else 0
local aR=aO+(al.Padding*2)+aP+aN+aQ
if aI=="Expanded"then
aR=math.max(aR,al.ExpandedWidth)
end

return Vector2.new(math.clamp(aR,aJ,al.MaxWidth),aJ)
end

local function ApplyState(aI,aJ)
aI=NormalizeState(aI)
local aK=if aJ==false then 0 else 0.28
local aL=GetTargetSize(aI)
local aM=GetDragWidth(aI,aL.Y)
local aN=al.Padding
local aO=ap~=nil
local aP=if aO then al.IconSize+al.Gap else 0
local aQ=if aI=="Expanded"then 24 else 0

am.State=aI
al.State=aI
ax.Visible=aM>0
aA.Visible=aM>0
aE.Visible=aI~="Collapsed"
aF.Visible=aI=="Expanded"and al.Content~=nil and al.Content~=""
aG.Visible=aI=="Expanded"

Animate(ar,aK,{Size=UDim2.fromOffset(aL.X,aL.Y)})
Animate(aB,aK,{
Size=UDim2.new(1,-aM,1,0),
Position=UDim2.fromOffset(aM,0),
})

ax.Size=UDim2.fromOffset(math.max(aL.Y-8,0),math.max(aL.Y-8,0))
ax.Position=UDim2.fromOffset(4,4)
aA.Position=UDim2.new(0,aM,0.5,0)

if ap then
local aR=if aI=="Collapsed"then aL.X/2 else aN+al.IconSize/2
Animate(ap,aK,{
Position=UDim2.fromOffset(aR,aL.Y/2),
Size=UDim2.fromOffset(al.IconSize,al.IconSize),
})
end

local aR=aN+aP
aD.Position=UDim2.fromOffset(aR,0)
aD.Size=UDim2.new(1,-(aR+aN+aQ),1,0)
aE.Size=if aF.Visible then UDim2.new(1,0,0,22)else UDim2.fromScale(1,1)
aE.Position=if aF.Visible then UDim2.fromOffset(0,13)else UDim2.fromOffset(0,0)
aF.Text=tostring(al.Content or"")

ab.SafeCallback(al.OnStateChange,aI,am)
end

function am.SetIcon(aI,aJ,aK)
if ap then
ap:Destroy()
ap=nil
end

al.Icon=aJ
if aJ~=nil and aJ~=false and aJ~=""then
ap=ab.Image(
aJ,
al.Title..":OpenButton",
0,
aj.Folder,
"OpenButton",
true,
aj.IconThemed
)
ap.Name="Icon"
ap.AnchorPoint=Vector2.new(0.5,0.5)
ap.ZIndex=103
ap.Parent=aB
end

if not aK then
ApplyState(am.State,false)
end
return am
end

function am.SetTitle(aI,aJ)
al.Title=tostring(aJ or"")
aE.Text=al.Title
ab:ChangeTranslationKey(aE,al.Title)
ApplyState(am.State,true)
return am
end

function am.SetContent(aI,aJ)
al.Content=if aJ==nil or aJ==false then nil else tostring(aJ)
aF.Text=al.Content or""
ApplyState(am.State,true)
return am
end

function am.SetState(aI,aJ,aK,aL)
an=an+1
if typeof(aK)=="table"then
if aK.Title~=nil then
al.Title=tostring(aK.Title)
aE.Text=al.Title
end
if aK.Content~=nil or aK.Description~=nil then
local aM=if aK.Content~=nil then aK.Content else aK.Description
al.Content=if aM==false then nil else tostring(aM or"")
end
if aK.Icon~=nil then
am:SetIcon(aK.Icon,true)
end
end

ApplyState(aJ,aL)
return am
end

function am.GetState(aI)
return am.State
end

function am.Expand(aI,aJ,aK)
am:SetState("Expanded",aJ)
local aL=an
local aM=tonumber(aK)or tonumber(al.AutoCollapse)
if aM and aM>0 then
task.delay(aM,function()
if aL==an and ar.Parent then
am:SetState"Compact"
end
end)
end
return am
end

function am.Collapse(aI,aJ)
return am:SetState("Collapsed",aJ)
end

function am.Compact(aI,aJ)
return am:SetState("Compact",aJ)
end

function am.ToggleExpanded(aI,aJ)
if am.State=="Expanded"then
return am:Compact(aJ)
end
return am:Expand(aJ)
end

function am.Push(aI,aJ,aK)
local aL=am.State
am:SetState("Expanded",aJ)
local aM=an
local aN=math.max(tonumber(aK)or 3,0)
task.delay(aN,function()
if aM==an and ar.Parent then
am:SetState(aL)
end
end)
return am
end

am.Notify=am.Push

function am.Visible(aI,aJ)
ar.Visible=aJ==true
return am
end

function am.SetScale(aI,aJ)
al.Scale=math.max(tonumber(aJ)or 1,0.1)
am.Scale=al.Scale
StopTween(as)
as.Scale=al.Scale
return am
end

function am.Pulse(aI)
local aJ=al.Scale
Animate(as,0.08,{Scale=aJ*0.94})
task.delay(0.08,function()
if as.Parent then
Animate(as,0.16,{Scale=aJ})
end
end)
return am
end

function am.Edit(aI,aJ)
aJ=if typeof(aJ)=="table"then aJ else{}
al.Title=tostring(Pick(aJ.Title,al.Title))
local aK=Pick(aJ.Content,Pick(aJ.Description,al.Content))
al.Content=if aK==false or aK==nil then nil else tostring(aK)
al.Enabled=Pick(aJ.Enabled,al.Enabled)
al.OnlyMobile=Pick(aJ.OnlyMobile,al.OnlyMobile)
al.Draggable=Pick(aJ.Draggable,al.Draggable)
al.Position=Pick(aJ.Position,Pick(aJ.Preset,al.Position))
al.Height=math.max(tonumber(Pick(aJ.Height,al.Height))or 44,34)
al.ExpandedHeight=
math.max(tonumber(Pick(aJ.ExpandedHeight,al.ExpandedHeight))or 68,al.Height)
al.ExpandedWidth=math.max(tonumber(Pick(aJ.ExpandedWidth,al.ExpandedWidth))or 220,120)
al.MaxWidth=math.max(tonumber(Pick(aJ.MaxWidth,al.MaxWidth))or 380,al.ExpandedWidth)
al.IconSize=math.max(tonumber(Pick(aJ.IconSize,al.IconSize))or 22,12)
al.Padding=math.max(tonumber(Pick(aJ.Padding,al.Padding))or 12,4)
al.Gap=math.max(tonumber(Pick(aJ.Gap,al.Gap))or 9,0)
al.CornerRadius=Pick(aJ.CornerRadius,al.CornerRadius)
al.StrokeThickness=math.max(tonumber(Pick(aJ.StrokeThickness,al.StrokeThickness))or 1,0)
al.StrokeTransparency=
ab.ClampTransparency(Pick(aJ.StrokeTransparency,al.StrokeTransparency),0.7)
al.Scale=math.max(tonumber(Pick(aJ.Scale,al.Scale))or 1,0.1)
al.Color=NormalizeColorSequence(aJ.Color,al.Color)
al.BackgroundColor=Pick(aJ.BackgroundColor,al.BackgroundColor)
al.BackgroundTransparency=ab.ClampTransparency(
Pick(aJ.BackgroundTransparency,Pick(aJ.Transparency,al.BackgroundTransparency)),
0.08
)
al.TextColor=Pick(aJ.TextColor,al.TextColor)
al.TextTransparency=ab.ClampTransparency(
Pick(aJ.TextTransparency,al.TextTransparency),
al.TextTransparency
)
al.AutoCollapse=Pick(aJ.AutoCollapse,al.AutoCollapse)
al.OnStateChange=Pick(aJ.OnStateChange,al.OnStateChange)

local aL=aJ.State or aJ.Mode
if aJ.OnlyIcon==true or aJ.Style=="Circle"then
aL=aL or"Collapsed"
elseif aJ.OnlyIcon==false and aL==nil then
aL="Compact"
end

aj.IsOpenButtonEnabled=al.Enabled~=false
if al.OnlyMobile==false then
aj.IsPC=false
end
if aq then
aq:Set(al.Draggable)
end

ApplyPosition(al.Position)
am:SetScale(al.Scale)
aw.BackgroundColor3=al.BackgroundColor
aw.BackgroundTransparency=al.BackgroundTransparency
aw.UICorner.CornerRadius=al.CornerRadius
aB.UICorner.CornerRadius=GetInnerCornerRadius(al.CornerRadius,4)
aC.UICorner.CornerRadius=GetInnerCornerRadius(al.CornerRadius,4)
at.UICorner.CornerRadius=al.CornerRadius
av.Thickness=al.StrokeThickness
av.Transparency=al.StrokeTransparency
au.Color=al.Color
aE.Text=al.Title
aF.Text=tostring(al.Content or"")
if al.TextColor then
aE.TextColor3=al.TextColor
aF.TextColor3=al.TextColor
end
if al.TextTransparency~=nil then
aE.TextTransparency=al.TextTransparency
end

if aJ.Icon~=nil then
am:SetIcon(aJ.Icon,true)
elseif not ap and al.Icon then
am:SetIcon(al.Icon,true)
end

ApplyState(aL or am.State,aJ.Animate~=false)
if aJ.Visible~=nil then
am:Visible(aJ.Visible)
end
return am
end

function am.Destroy(aI)
an=an+1
local aJ={}
for aK in ao do
table.insert(aJ,aK)
end
for aK,aL in aJ do
StopTween(aL)
end
ar:Destroy()
end

ab.AddSignal(aB.MouseEnter,function()
Animate(aC,0.12,{BackgroundTransparency=0.94})
end)
ab.AddSignal(aB.MouseLeave,function()
Animate(aC,0.16,{BackgroundTransparency=1})
end)
ab.AddSignal(aB.InputBegan,function(aI)
if
aI.UserInputType==Enum.UserInputType.MouseButton1
or aI.UserInputType==Enum.UserInputType.Touch
then
am:Pulse()
end
end)

aq=ab.Drag(ar)
am.Button=aw
am.Container=ar
am.UIElements={
Container=ar,
Button=aw,
MainAction=aB,
Drag=ax,
Divider=aA,
Title=aE,
Content=aF,
TextStack=aD,
HoverSurface=aC,
TrailingIcon=aG,
Stroke=av,
Shadow=at,
Scale=as,
}

if al.Icon then
am:SetIcon(al.Icon)
else
ApplyState(al.State,false)
end

return am
end

return aa end function a.D()

local aa={}

local ab=a.load'd'
local ad=a.load'e'
local ae=ab.New

local af={
TopLeft={UDim2.new(0,14,0,14),Vector2.new(0,0)},
TopRight={UDim2.new(1,-14,0,14),Vector2.new(1,0)},
BottomLeft={UDim2.new(0,14,1,-14),Vector2.new(0,1)},
BottomRight={UDim2.new(1,-14,1,-14),Vector2.new(1,1)},
TopCenter={UDim2.new(0.5,0,0,14),Vector2.new(0.5,0)},
BottomCenter={UDim2.new(0.5,0,1,-14),Vector2.new(0.5,1)},
}

local function NormalizeConfig(ag)
if ag==false then
return{Visible=false}
end
if typeof(ag)=="string"then
return{Title=ag}
end
if typeof(ag)~="table"then
return{}
end
return ag or{}
end

function aa.New(ag,ah)
local ai={}
local aj
local ak

local al=ae("TextLabel",{
BackgroundTransparency=1,
Text=ag.Title or"WindUI",
TextSize=13,
TextXAlignment="Left",
AutomaticSize="XY",
FontFace=Font.new(ab.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
})

local am=ae("TextLabel",{
BackgroundTransparency=1,
Text="v"..tostring(ah and ah.Version or""),
TextSize=11,
TextTransparency=0.42,
TextXAlignment="Left",
AutomaticSize="XY",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})

local an=ae("Frame",{
Size=UDim2.new(0,0,0,0),
Position=af.BottomRight[1],
AnchorPoint=af.BottomRight[2],
BackgroundTransparency=1,
Parent=ag.Parent,
Active=true,
Visible=false,
ZIndex=120,
})

local ao=ab.NewRoundFrame(14,"Squircle",{
Name="Watermark",
Size=UDim2.new(0,0,0,36),
AutomaticSize="XY",
ImageTransparency=0.18,
Parent=an,
ZIndex=120,
ThemeTag={
ImageColor3="Background",
},
},{
ae("UIStroke",{
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0.82,
Thickness=1,
}),
ae("UIGradient",{
Rotation=24,
Color=ColorSequence.new(Color3.new(1,1,1),Color3.fromRGB(210,235,255)),
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.96),
NumberSequenceKeypoint.new(0.48,0.76),
NumberSequenceKeypoint.new(1,0.96),
},
}),
ae("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ae("Frame",{
Name="Text",
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,1),
}),
al,
am,
}),
ae("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingTop=UDim.new(0,7),
PaddingBottom=UDim.new(0,7),
}),
})

ab.AddSignal(ao:GetPropertyChangedSignal"AbsoluteSize",function()
an.Size=UDim2.fromOffset(ao.AbsoluteSize.X,ao.AbsoluteSize.Y)
end)

ak=ab.Drag(an)

local function SetIcon(ap)
if aj then
aj:Destroy()
aj=nil
end
if not ap or ap==""then
return
end

aj=ab.Image(ap,ap,0,ag.Folder,"Watermark",true,true,"Icon")
aj.Size=UDim2.new(0,16,0,16)
aj.LayoutOrder=-1
aj.Parent=ao
end

function ai.Visible(ap,aq)
an.Visible=aq~=false
end

function ai.Edit(ap,aq)
aq=NormalizeConfig(aq)

if aq.Visible==false or aq.Enabled==false then
ai:Visible(false)
return ai
end

if aq.Title~=nil then
al.Text=tostring(aq.Title)
ab:ChangeTranslationKey(al,al.Text)
end
if aq.Desc~=nil or aq.Subtitle~=nil then
am.Text=tostring(aq.Desc or aq.Subtitle or"")
am.Visible=am.Text~=""
ab:ChangeTranslationKey(am,am.Text)
end
if aq.Icon~=nil then
SetIcon(aq.Icon)
end
if aq.Position and af[aq.Position]then
an.Position=af[aq.Position][1]
an.AnchorPoint=af[aq.Position][2]
elseif typeof(aq.Position)=="UDim2"then
an.Position=aq.Position
end
if typeof(aq.AnchorPoint)=="Vector2"then
an.AnchorPoint=aq.AnchorPoint
end
if aq.Transparency~=nil then
ao.ImageTransparency=ab.ClampTransparency(aq.Transparency,ao.ImageTransparency)
end
if aq.Scale then
local ar=ao:FindFirstChildOfClass"UIScale"or ae("UIScale",{Parent=ao})
ar.Scale=tonumber(aq.Scale)or 1
end
if ak then
ak:Set(aq.Draggable~=false)
end

ai:Visible(true)
ad.Play(ao,"Reveal",{ImageTransparency=ao.ImageTransparency},nil,nil,"Watermark")
return ai
end

function ai.SetTitle(ap,aq)
al.Text=tostring(aq or"")
end

function ai.SetDesc(ap,aq)
am.Text=tostring(aq or"")
am.Visible=am.Text~=""
end

function ai.Destroy(ap)
an:Destroy()
end

ai.Container=an
ai.Main=ao

return ai
end

return aa end function a.E()

local aa=game:GetService"UserInputService"
local ab=game:GetService"Workspace"

local ad=a.load'd'
local ae=a.load'e'
local af=ad.New

local ag={}

local function GetImageTarget(ah)
if typeof(ah)~="Instance"then
return nil
end

if ah:IsA"ImageLabel"or ah:IsA"ImageButton"then
return ah
end

return ah:FindFirstChildWhichIsA"ImageLabel"or ah:FindFirstChildWhichIsA"ImageButton"
end

local function ContainsPoint(ah,ai)
if typeof(ah)~="Instance"or not ah.Visible then
return false
end

local aj=ah.AbsolutePosition
local ak=ah.AbsoluteSize

return ai.X>=aj.X
and ai.X<=aj.X+ak.X
and ai.Y>=aj.Y
and ai.Y<=aj.Y+ak.Y
end

local function Trim(ah)
ah=tostring(ah or"")
ah=string.gsub(ah,"^%s+","")
ah=string.gsub(ah,"%s+$","")
return ah
end

local function GetThemeList(ah)
local ai={}

for aj,ak in next,ah:GetThemes()or{}do
table.insert(ai,{
Key=aj,
Name=ak.Name or aj,
})
end

table.sort(ai,function(aj,ak)
return aj.Name<ak.Name
end)

return ai
end

function ag.New(ah,ai,aj)
local ak=typeof(ah.Settings)=="table"and ah.Settings or{}
local al=ak.DefaultConfig or"default"
local am=ak.Width or 360
local an=ak.Height or 410
local ao=ak.PageHeight or(an-142)
local ap={
Open=false,
Button=nil,
Token=0,
SelectedTab="config",
UIElements={},
ThemeButtons={},
TabButtons={},
Pages={},
}

local function GetViewportSize()
local aq=ab.CurrentCamera
return aq and aq.ViewportSize or Vector2.new(1280,720)
end

local function Notify(aq,ar,as,at)
if ai.Notify then
ai:Notify{
Title=aq,
Content=ar,
Icon=as,
Style=at,
}
end
end

local function CreateIcon(aq,ar,as)
local at=ad.Image(aq,aq,0,ah.Folder,"SettingsMenu",true,true,"Icon")
at.Size=UDim2.new(0,as or 16,0,as or 16)
at.Parent=ar
return at
end

local function CreateText(aq,ar,as,at,au)
return af("TextLabel",{
BackgroundTransparency=1,
Text=ar or"",
TextSize=as or 14,
TextTransparency=au or 0,
TextWrapped=true,
TextXAlignment="Left",
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Parent=aq,
FontFace=Font.new(ad.Font,at or Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})
end

local function CreatePanel(aq)
return ad.NewRoundFrame(ah.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ImageTransparency=0.9,
Parent=aq,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
af("UIGradient",{
Rotation=35,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.05),
NumberSequenceKeypoint.new(1,0.2),
},
}),
af("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
af("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Vertical",
HorizontalAlignment="Left",
}),
})
end

local function CreateActionButton(aq,ar,as,at,au)
local av=ad.NewRoundFrame(14,"Squircle",{
Size=UDim2.new(1,0,0,34),
ImageTransparency=at=="Primary"and 0 or 0.9,
ThemeTag={
ImageColor3=at=="Primary"and"Primary"or"ElementBackground",
},
Parent=aq,
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
af("UIListLayout",{
Padding=UDim.new(0,7),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
as and CreateIcon(as,nil,15)or nil,
af("TextLabel",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
BackgroundTransparency=1,
Text=ar,
TextSize=13,
FontFace=Font.new(ad.Font,Enum.FontWeight.SemiBold),
TextColor3=at=="Primary"and Color3.new(1,1,1)or nil,
ThemeTag={
TextColor3=at~="Primary"and"Text"or nil,
},
}),
},true)

ae.AttachPress(av,ad,{
Amount=0.97,
})

ad.AddSignal(av.MouseButton1Click,function()
ad.SafeCallback(au)
end)

return av
end

local aq=ad.NewRoundFrame(ah.ElementConfig.UICorner,"Squircle",{
Name="SettingsDropdown",
Size=UDim2.new(0,am,0,an),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.fromOffset(0,0),
ImageTransparency=1,
Visible=false,
Active=false,
ZIndex=10000,
Parent=ai.ScreenGui,
ThemeTag={
ImageColor3="Background",
},
},{
af("UIScale",{
Name="Scale",
Scale=0.98,
}),
ad.NewRoundFrame(ah.ElementConfig.UICorner,"SquircleGlass",{
Name="GlassLayer",
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.72,
ZIndex=10000,
ThemeTag={
ImageColor3="Primary",
},
}),
ad.NewRoundFrame(ah.ElementConfig.UICorner,"SquircleOutline",{
Name="Outline",
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.72,
ZIndex=10001,
ThemeTag={
ImageColor3="Outline",
},
}),
})

local ar=af("Frame",{
Name="SettingsScrim",
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(0,0,0),
BackgroundTransparency=1,
Visible=false,
Active=false,
ZIndex=9998,
Parent=ai.ScreenGui,
})

local as=af("CanvasGroup",{
Name="Content",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
GroupTransparency=1,
ZIndex=10002,
Parent=aq,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
}),
af("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

ap.UIElements.Root=aq
ap.UIElements.Scale=aq.Scale
ap.UIElements.Scrim=ar
ap.UIElements.Content=as
ap.UIElements.GlassLayer=aq.GlassLayer
ap.UIElements.Outline=aq.Outline

local at
local au

local function UpdateRootPosition()
local av=GetViewportSize()
local aw=12
local ax=math.floor(math.min(am,math.max(280,av.X-(aw*2))))
local ay=math.floor(math.min(an,math.max(300,av.Y-(aw*2))))
local az=Vector2.new(1,0)
local aA=av.X-aw
local aB=aw+ah.Topbar.Height

aq.Size=UDim2.fromOffset(ax,ay)
if at then
at.Size=UDim2.new(1,0,0,math.max(154,ay-142))
end
if au then
au.Size=UDim2.new(1,0,0,math.max(116,ay-238))
end

if ap.Button and ap.Button.AbsoluteSize.X>0 then
local aC=ap.Button.AbsolutePosition
local aD=ap.Button.AbsoluteSize
aA=aC.X+aD.X
aB=aC.Y+aD.Y+10
end

if aA-ax<aw then
aA=math.min(av.X-aw,aw+ax)
end
if aB+ay>av.Y-aw then
aB=math.max(aw,av.Y-ay-aw)
end

aq.AnchorPoint=az
aq.Position=UDim2.fromOffset(aA,aB)
ar.Size=UDim2.fromOffset(av.X,av.Y)
end

local av=af("Frame",{
Name="Header",
LayoutOrder=1,
Size=UDim2.new(1,0,0,40),
BackgroundTransparency=1,
Parent=as,
},{
af("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
})

local aw=CreateIcon("settings",nil,17)
ad.NewRoundFrame(999,"Squircle",{
Size=UDim2.new(0,36,0,36),
ImageTransparency=0.86,
ThemeTag={
ImageColor3="Primary",
},
Parent=av,
},{
aw,
ad.NewRoundFrame(999,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.8,
ThemeTag={
ImageColor3="Primary",
},
}),
})
aw.Position=UDim2.new(0.5,0,0.5,0)
aw.AnchorPoint=Vector2.new(0.5,0.5)
aw.ZIndex=10002

local ax=af("Frame",{
Size=UDim2.new(1,-46,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=av,
},{
af("UIListLayout",{
Padding=UDim.new(0,2),
FillDirection="Vertical",
}),
})
CreateText(ax,"Settings",16,Enum.FontWeight.Bold,0)
CreateText(ax,"Config, theme and runtime controls",12,Enum.FontWeight.Medium,0.42)

local ay=ad.NewRoundFrame(16,"Squircle",{
Name="SettingsTabs",
LayoutOrder=2,
Size=UDim2.new(1,0,0,38),
ImageTransparency=0.9,
Parent=as,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
af("UIPadding",{
PaddingTop=UDim.new(0,4),
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
PaddingBottom=UDim.new(0,4),
}),
af("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
}),
})

at=af("Frame",{
Name="Pages",
LayoutOrder=3,
Size=UDim2.new(1,0,0,ao),
BackgroundTransparency=1,
ClipsDescendants=true,
Parent=as,
})

local function CreateTabButton(az,aA,aB,aC)
local aD=CreateIcon(aB,nil,14)
local aE=af("TextLabel",{
Name="Title",
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
BackgroundTransparency=1,
Text=aA,
TextSize=12,
TextTruncate="AtEnd",
FontFace=Font.new(ad.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
})

local aF=ad.NewRoundFrame(12,"Squircle",{
Name=az,
LayoutOrder=aC,
Size=UDim2.new(0.3333333333333333,-3,1,0),
ImageTransparency=1,
Parent=ay,
ThemeTag={
ImageColor3="Primary",
},
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}),
af("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
aD,
aE,
},true)

local aG=GetImageTarget(aD)
ap.TabButtons[az]={
Button=aF,
Label=aE,
Icon=aG,
}

ae.AttachPress(aF,ad,{
Amount=0.98,
})

ad.AddSignal(aF.MouseButton1Click,function()
ap:SelectTab(az)
end)

return aF
end

local function CreatePage(az)
local aA=af("CanvasGroup",{
Name=az,
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
GroupTransparency=1,
Visible=false,
Active=false,
Parent=at,
},{
af("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

ap.Pages[az]=aA
return aA
end

local az=CreatePage"config"
local aA=CreatePage"theme"
local aB=CreatePage"about"

CreateTabButton("config","Config","save",1)
CreateTabButton("theme","Theme","palette",2)
CreateTabButton("about","Info","badge-info",3)

local aC=CreatePanel(az)
CreateText(aC,"Config Profile",13,Enum.FontWeight.Bold,0.05)

local aD=ad.NewRoundFrame(12,"Squircle",{
Size=UDim2.new(1,0,0,36),
ImageTransparency=0.9,
ThemeTag={
ImageColor3="ElementBackground",
},
Parent=aC,
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
})

local aE=af("TextBox",{
Name="ConfigName",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ClearTextOnFocus=false,
Text=al,
PlaceholderText="default",
TextSize=13,
TextXAlignment="Left",
FontFace=Font.new(ad.Font,Enum.FontWeight.Medium),
Parent=aD,
ThemeTag={
TextColor3="Text",
PlaceholderColor3="Placeholder",
},
})

local aF=CreateText(aC,"No saved configs",12,Enum.FontWeight.Medium,0.45)

local aG=af("Frame",{
Name="HStack",
Size=UDim2.new(1,0,0,34),
BackgroundTransparency=1,
Parent=aC,
},{
af("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Center",
VerticalAlignment="Center",
}),
})

local aH=CreatePanel(az)
CreateText(aH,"Runtime",13,Enum.FontWeight.Bold,0.05)
local aI=CreateText(aH,"Theme: "..tostring(ai:GetCurrentTheme()),12,Enum.FontWeight.Medium,0.28)
CreateText(aH,"Settings use glass morph layers and tabbed pages.",12,Enum.FontWeight.Medium,0.45)

local function GetConfigName()
local aJ=Trim(aE.Text)
return aJ~=""and aJ or al
end

local function RefreshConfigMeta()
local aJ=ah.ConfigManager
if not aJ or typeof(aJ)~="table"then
aF.Text="Config is unavailable in this environment"
return
end

local aK,aL=pcall(function()
return aJ:AllConfigs()
end)
local aM=aK and#aL or 0
aF.Text=aM==1 and"1 saved config"or tostring(aM).." saved configs"
end

local aJ=CreateActionButton(aG,"Save","save","Primary",function()
local aJ=ah.ConfigManager
if not aJ or typeof(aJ)~="table"then
Notify("Config unavailable","Config save needs file access.","triangle-alert","Warning")
return
end

local aK=GetConfigName()
local aL,aM,aN=pcall(function()
local aL=aJ:Config(aK)
aL:Set("theme",ai:GetCurrentTheme())
return aL:Save()
end)

if aL and aM then
RefreshConfigMeta()
Notify("Config saved","Saved '"..aK.."'.","check","Success")
else
Notify("Config save failed",tostring(aN or aM),"triangle-alert","Error")
end
end)
aJ.Size=UDim2.new(0.5,-4,1,0)

local aK=CreateActionButton(aG,"Load","download","Secondary",function()
local aK=ah.ConfigManager
if not aK or typeof(aK)~="table"then
Notify("Config unavailable","Config load needs file access.","triangle-alert","Warning")
return
end

local aL=GetConfigName()
local aM,aN,aO=pcall(function()
local aM=aK:Config(aL)
local aN=aM:Load()
if aN and aN.theme then
ai:SetTheme(aN.theme)
end
return aN
end)

if aM and aN then
aI.Text="Theme: "..tostring(ai:GetCurrentTheme())
Notify("Config loaded","Loaded '"..aL.."'.","refresh-cw","Success")
else
Notify("Config load failed",tostring(aO or aN),"triangle-alert","Error")
end
end)
aK.Size=UDim2.new(0.5,-4,1,0)

local aL=CreatePanel(aA)
CreateText(aL,"Theme Picker",13,Enum.FontWeight.Bold,0.05)
CreateText(aL,"Tap a theme to apply it instantly.",12,Enum.FontWeight.Medium,0.45)

au=af("ScrollingFrame",{
Name="ThemeList",
Size=UDim2.new(1,0,0,ak.ThemeListHeight or 214),
BackgroundTransparency=1,
ScrollBarThickness=0,
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
Parent=aL,
},{
af("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
HorizontalAlignment="Left",
}),
})

local function UpdateThemeButtons()
local aM=ai:GetCurrentTheme()
aI.Text="Theme: "..tostring(aM)
for aN,aO in next,ap.ThemeButtons do
local aP=aN==aM
ae.Play(aO.Button,"Switch",{ImageTransparency=aP and 0.82 or 0.94},nil,nil,"Theme")
ae.Play(aO.Label,"Switch",{TextTransparency=aP and 0 or 0.24},nil,nil,"Theme")
if aO.Check then
ae.Play(aO.Check,"Switch",{ImageTransparency=aP and 0 or 1},nil,nil,"Theme")
end
end
end

for aM,aN in next,GetThemeList(ai)do
local aO=CreateIcon("check",nil,14)
local aP=ad.NewRoundFrame(12,"Squircle",{
Size=UDim2.new(1,0,0,32),
ImageTransparency=0.94,
ThemeTag={
ImageColor3="Primary",
},
Parent=au,
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
af("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
}),
af("TextLabel",{
Name="Title",
Size=UDim2.new(1,-22,1,0),
BackgroundTransparency=1,
Text=aN.Name,
TextSize=13,
TextXAlignment="Left",
TextTruncate="AtEnd",
FontFace=Font.new(ad.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
}),
aO,
},true)

local aQ=GetImageTarget(aO)
if aQ then
aQ.ImageTransparency=1
end

ap.ThemeButtons[aN.Key]={
Button=aP,
Label=aP.Title,
Check=aQ,
}

ae.AttachPress(aP,ad,{
Amount=0.985,
})

ad.AddSignal(aP.MouseButton1Click,function()
ai:SetTheme(aN.Key)
UpdateThemeButtons()
end)
end

local aM=CreatePanel(aB)
CreateText(aM,"WindUI Settings",13,Enum.FontWeight.Bold,0.05)
CreateText(aM,"Use Config for save/load and Theme for quick visual switching.",12,Enum.FontWeight.Medium,0.36)

local aN=af("Frame",{
Name="VStack",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=aM,
},{
af("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Vertical",
HorizontalAlignment="Left",
}),
})

local function CreateInfoRow(aO,aP)
return ad.NewRoundFrame(12,"Squircle",{
Size=UDim2.new(1,0,0,34),
ImageTransparency=0.94,
ThemeTag={
ImageColor3="ElementBackground",
},
Parent=aN,
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
af("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
af("TextLabel",{
Size=UDim2.new(0.44,0,1,0),
BackgroundTransparency=1,
Text=aO,
TextSize=12,
TextXAlignment="Left",
TextTransparency=0.38,
FontFace=Font.new(ad.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
}),
af("TextLabel",{
Size=UDim2.new(0.56,0,1,0),
BackgroundTransparency=1,
Text=aP,
TextSize=12,
TextXAlignment="Right",
TextTruncate="AtEnd",
FontFace=Font.new(ad.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
}),
})
end

CreateInfoRow("Folder",tostring(ah.Folder or"WindUI"))
CreateInfoRow("Topbar",tostring(ah.Topbar.ButtonsType or"Default"))
CreateInfoRow("Motion",tostring(ae:GetConfig().Preset))

function ap.SetButton(aO,aP)
ap.Button=aP
end

function ap.SelectTab(aO,aP)
if not ap.Pages[aP]then
return
end

ap.SelectedTab=aP
for aQ,aR in next,ap.TabButtons do
local aS=aQ==aP
ae.Play(aR.Button,"Switch",{ImageTransparency=aS and 0.82 or 1},nil,nil,"SettingsTab")
ae.Play(aR.Label,"Switch",{TextTransparency=aS and 0 or 0.3},nil,nil,"SettingsTab")
if aR.Icon then
ae.Play(aR.Icon,"Switch",{ImageTransparency=aS and 0 or 0.35},nil,nil,"SettingsTab")
end
end

for aQ,aR in next,ap.Pages do
local aS=aQ==aP
aR.Active=aS
if aS then
aR.Visible=true
aR.GroupTransparency=1
ae.Play(aR,"Reveal",{GroupTransparency=0},nil,nil,"SettingsPage")
else
aR.Visible=false
aR.GroupTransparency=1
end
end
end

function ap.OpenMenu(aO)
if ap.Open then
return
end

ap.Open=true
ap.Token=ap.Token+1
RefreshConfigMeta()
UpdateThemeButtons()
ap:SelectTab(ap.SelectedTab)
UpdateRootPosition()
aq.Visible=true
aq.Active=true
ap.UIElements.Scrim.Visible=true
aq.ImageTransparency=1
ap.UIElements.Scrim.BackgroundTransparency=1
ap.UIElements.Content.GroupTransparency=1
ap.UIElements.GlassLayer.ImageTransparency=1
ap.UIElements.Outline.ImageTransparency=1
ap.UIElements.Scale.Scale=0.98
ae.Play(aq,"DropdownOpen",{ImageTransparency=0.18},nil,nil,"Settings")
ae.Play(ap.UIElements.Scrim,"DropdownOpen",{BackgroundTransparency=ak.ScrimTransparency or 0.72},nil,nil,"SettingsScrim")
ae.Play(ap.UIElements.Content,"DropdownOpen",{GroupTransparency=0},nil,nil,"SettingsContent")
ae.Play(ap.UIElements.GlassLayer,"DropdownOpen",{ImageTransparency=0.78},nil,nil,"SettingsGlass")
ae.Play(ap.UIElements.Outline,"DropdownOpen",{ImageTransparency=0.72},nil,nil,"SettingsOutline")
ae.Play(ap.UIElements.Scale,"DropdownOpen",{Scale=1},nil,nil,"SettingsScale")
end

function ap.CloseMenu(aO)
if not ap.Open then
return
end

ap.Open=false
ap.Token=ap.Token+1
local aP=ap.Token
aq.Active=false
ae.Play(aq,"DropdownClose",{ImageTransparency=1},nil,nil,"Settings")
ae.Play(ap.UIElements.Scrim,"DropdownClose",{BackgroundTransparency=1},nil,nil,"SettingsScrim")
ae.Play(ap.UIElements.Content,"DropdownClose",{GroupTransparency=1},nil,nil,"SettingsContent")
ae.Play(ap.UIElements.GlassLayer,"DropdownClose",{ImageTransparency=1},nil,nil,"SettingsGlass")
ae.Play(ap.UIElements.Outline,"DropdownClose",{ImageTransparency=1},nil,nil,"SettingsOutline")
ae.Play(ap.UIElements.Scale,"DropdownClose",{Scale=0.98},nil,nil,"SettingsScale")
task.delay(ae.GetDuration"DropdownClose",function()
if aP==ap.Token then
aq.Visible=false
ap.UIElements.Scrim.Visible=false
end
end)
end

function ap.Toggle(aO)
if ap.Open then
ap:CloseMenu()
else
ap:OpenMenu()
end
end

ad.AddSignal(aa.InputBegan,function(aO)
if not ap.Open then
return
end
if aO.UserInputType~=Enum.UserInputType.MouseButton1 and aO.UserInputType~=Enum.UserInputType.Touch then
return
end

if ContainsPoint(aq,aO.Position)or ContainsPoint(ap.Button,aO.Position)then
return
end

ap:CloseMenu()
end)

RefreshConfigMeta()
UpdateThemeButtons()
ap:SelectTab"config"

return ap
end

return ag end function a.F()

local aa=game:GetService"UserInputService"
local ab=game:GetService"Workspace"

local ad=a.load'd'
local ae=a.load'e'
local af=ad.New

local ag={}

local function ContainsPoint(ah,ai)
if typeof(ah)~="Instance"or not ah.Visible then
return false
end

local aj=ah.AbsolutePosition
local ak=ah.AbsoluteSize

return ai.X>=aj.X
and ai.X<=aj.X+ak.X
and ai.Y>=aj.Y
and ai.Y<=aj.Y+ak.Y
end

local function NormalizeKey(ah)
if typeof(ah)=="EnumItem"then
return ah.Name,ah
end
if typeof(ah)=="string"and Enum.KeyCode[ah]then
return ah,Enum.KeyCode[ah]
end
return"None",nil
end

function ag.New(ah,ai,aj)
local ak=typeof(ah.KeyBindMenu)=="table"and ah.KeyBindMenu or{}
local al=(aa.TouchEnabled and not aa.KeyboardEnabled)or ah.IsPC==false
local am=ak.Compact==true or(ak.Compact~=false and al)
local an=ak.Width or(am and 330 or 326)
local ao=ak.Height or(am and 300 or 354)
local ap=am and 10 or 14
local aq=am and 6 or 10
local ar=ak.QuickKeys or{"RightShift","F","LeftControl"}
local as={
Open=false,
Button=nil,
Token=0,
Capturing=false,
UserMoved=false,
StoredPosition=nil,
TargetPosition=nil,
UIElements={},
}

local function Notify(at,au,av,aw)
if ai.Notify then
ai:Notify{
Title=at,
Content=au,
Icon=av,
Style=aw,
}
end
end

local function GetViewportSize()
local at=ab.CurrentCamera
return at and at.ViewportSize or Vector2.new(1280,720)
end

local function GetScrimTransparency()
if ak.Scrim==false or ak.ShowScrim==false then
return 1
end
if ak.ScrimTransparency~=nil then
return ak.ScrimTransparency
end
return am and 1 or 0.78
end

local function CreateIcon(at,au,av)
local aw=ad.Image(at,at,0,ah.Folder,"KeyBindMenu",true,true,"Icon")
aw.Size=UDim2.new(0,av or 16,0,av or 16)
aw.Parent=au
return aw
end

local function CreateText(at,au,av,aw,ax)
return af("TextLabel",{
BackgroundTransparency=1,
Text=au or"",
TextSize=av or 14,
TextTransparency=ax or 0,
TextXAlignment="Left",
TextWrapped=true,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Parent=at,
FontFace=Font.new(ad.Font,aw or Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})
end

local at=ad.NewRoundFrame(ah.ElementConfig.UICorner,"Squircle",{
Name="KeyBindMenu",
Size=UDim2.new(0,an,0,ao),
AnchorPoint=am and Vector2.new(0.5,1)or Vector2.new(1,0),
Position=UDim2.fromOffset(0,0),
ImageTransparency=1,
Visible=false,
Active=false,
ClipsDescendants=true,
ZIndex=10020,
Parent=ai.ScreenGui,
ThemeTag={
ImageColor3="Background",
},
},{
af("UIScale",{
Name="Scale",
Scale=0.98,
}),
ad.NewRoundFrame(ah.ElementConfig.UICorner,"SquircleGlass",{
Name="GlassLayer",
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ZIndex=10020,
ThemeTag={
ImageColor3="Primary",
},
}),
ad.NewRoundFrame(ah.ElementConfig.UICorner,"SquircleOutline",{
Name="Outline",
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ZIndex=10021,
ThemeTag={
ImageColor3="Outline",
},
}),
})

local au=af("Frame",{
Name="KeyBindScrim",
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(0,0,0),
BackgroundTransparency=1,
Visible=false,
Active=false,
ZIndex=10018,
Parent=ai.ScreenGui,
})

local av=af("CanvasGroup",{
Name="Content",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
GroupTransparency=1,
ZIndex=10022,
Parent=at,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,ap),
PaddingLeft=UDim.new(0,ap),
PaddingRight=UDim.new(0,ap),
PaddingBottom=UDim.new(0,ap),
}),
af("UIListLayout",{
Padding=UDim.new(0,aq),
FillDirection="Vertical",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

as.UIElements.Root=at
as.UIElements.Scale=at.Scale
as.UIElements.Scrim=au
as.UIElements.Content=av
as.UIElements.GlassLayer=at.GlassLayer
as.UIElements.Outline=at.Outline

local function IsImageBackground(aw)
if typeof(aw)~="string"then
return false
end
if string.sub(aw,1,1)=="#"then
return false
end
if string.match(aw,"^video:")then
return false
end
return aw~=""
end

local function GetBackgroundKind(aw)
if aw==nil or aw==false then
return nil,nil,{}
end

if typeof(aw)=="table"then
local ax=aw.Type or aw.Kind or aw.Mode
if aw.Video or ax=="Video"or ax=="video"then
return"Video",aw.Video or aw.Url or aw.URL or aw.Source or aw.Asset or aw.Path,aw
end
if aw.Image or aw.Url or aw.URL or aw.Asset or aw.Path or ax=="Image"or ax=="image"then
return"Image",aw.Image or aw.Url or aw.URL or aw.Asset or aw.Path or aw.Source,aw
end
if aw.Gradient then
return"Gradient",aw.Gradient,aw
end
if ax=="Gradient"or ax=="gradient"or aw.Rotation~=nil or aw.Offset~=nil then
return"Gradient",aw,aw
end
if typeof(aw.Color)=="ColorSequence"or typeof(aw.Transparency)=="NumberSequence"then
return"Gradient",aw,aw
end
return nil,nil,aw
end

if typeof(aw)=="string"then
local ax=string.match(aw,"^video:(.+)")
local ay=aw:match"^([^?#]+)"or aw
if ax or string.match(ay:lower(),"%.webm$")then
return"Video",ax or aw,{}
end
if IsImageBackground(aw)then
return"Image",aw,{}
end
end

return nil,nil,{}
end

local function FindWindowBackgroundVideo()
local aw=ah.UIElements and ah.UIElements.Main
local ax=aw and aw:FindFirstChild"Background"
local ay=ax and ax:FindFirstChild"BackgroundVideo"
if ay and ay:IsA"VideoFrame"then
return ay.Video
end
return nil
end

local function ApplyGradientProperty(aw,ax,ay)
if ax=="Transparency"and typeof(ay)=="number"then
return
end
pcall(function()
aw[ax]=ay
end)
end

local function ApplyBackgroundMedia()
if ak.UseWindowBackground==false then
return
end

local aw,ax=GetBackgroundKind(ak.Background)
local ay,az=GetBackgroundKind(ah.Background)
local aA=ak.BackgroundGradient
or(aw=="Gradient"and ax)
or ah.BackgroundGradient
or(ay=="Gradient"and az)
local aB=ak.BackgroundImage
or(aw=="Image"and ax)
or(ay=="Image"and az)
local aC=(aw=="Video"and ax)
or(ay=="Video"and(FindWindowBackgroundVideo()or az))

if aB then
as.UIElements.BackgroundImage=af("ImageLabel",{
Name="BackgroundImage",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=tostring(aB),
ImageTransparency=ak.BackgroundImageTransparency or ah.BackgroundImageTransparency or 0.46,
ScaleType=ak.BackgroundScaleType or ah.BackgroundScaleType or"Crop",
ZIndex=10019,
Parent=at,
},{
af("UICorner",{
CornerRadius=UDim.new(0,ah.ElementConfig.UICorner),
}),
})
end

if aC then
as.UIElements.BackgroundVideo=af("VideoFrame",{
Name="BackgroundVideo",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Video=tostring(aC),
Looped=true,
Volume=0,
ZIndex=10019,
Parent=at,
},{
af("UICorner",{
CornerRadius=UDim.new(0,ah.ElementConfig.UICorner),
}),
})
as.UIElements.BackgroundVideo:Play()
end

if aA then
local aD=af"UIGradient"
for aE,aF in next,aA do
ApplyGradientProperty(aD,aE,aF)
end

as.UIElements.BackgroundGradient=ad.NewRoundFrame(ah.ElementConfig.UICorner,"Squircle",{
Name="BackgroundGradient",
Size=UDim2.new(1,0,1,0),
ImageTransparency=ak.BackgroundGradientTransparency
or ak.BackgroundOverlayTransparency
or ah.BackgroundOverlayTransparency
or 0.55,
ZIndex=10019,
Parent=at,
},{
aD,
})
end
end

ApplyBackgroundMedia()

local aw=af("Frame",{
Name="DragHandle",
Size=UDim2.new(1,0,0,8),
BackgroundTransparency=1,
LayoutOrder=0,
Visible=am,
Parent=av,
},{
af("Frame",{
Size=UDim2.new(0,42,0,4),
Position=UDim2.new(0.5,0,0,1),
AnchorPoint=Vector2.new(0.5,0),
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=0.72,
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
})

local ax=af("Frame",{
Name="Header",
Size=UDim2.new(1,0,0,am and 34 or 42),
BackgroundTransparency=1,
Active=true,
LayoutOrder=1,
Parent=av,
},{
af("UIListLayout",{
Padding=UDim.new(0,am and 8 or 10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
})

local ay=CreateIcon("keyboard",nil,am and 15 or 18)
ad.NewRoundFrame(999,"Squircle",{
Size=UDim2.new(0,am and 32 or 38,0,am and 32 or 38),
ImageTransparency=0.86,
Parent=ax,
ThemeTag={
ImageColor3="Primary",
},
},{
ay,
})
ay.Position=UDim2.new(0.5,0,0.5,0)
ay.AnchorPoint=Vector2.new(0.5,0.5)

local az=af("Frame",{
Size=UDim2.new(1,am and-78 or-48,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ax,
},{
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,2),
}),
})
CreateText(az,ak.Title or(am and"Keybind"or"KeyBind Menu"),am and 14 or 16,Enum.FontWeight.Bold,0)
local aA=CreateText(
az,
ak.Desc or(am and"Mobile quick toggle controls."or"Set the window toggle shortcut."),
am and 11 or 12,
Enum.FontWeight.Medium,
0.42
)
if ak.HideDesc~=nil then
aA.Visible=not ak.HideDesc
else
aA.Visible=not am
end

local aB=CreateIcon("x",nil,13)
local aC=ad.NewRoundFrame(999,"Squircle",{
Size=am and UDim2.new(0,28,0,28)or UDim2.new(0,0,0,0),
ImageTransparency=0.9,
Visible=am,
Parent=ax,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
aB,
},true)
aB.Position=UDim2.new(0.5,0,0.5,0)
aB.AnchorPoint=Vector2.new(0.5,0.5)

ad.AddSignal(aC.MouseButton1Click,function()
as:CloseMenu()
end)

local aD=ad.NewRoundFrame(16,"Squircle",{
Size=UDim2.new(1,0,0,am and 48 or 58),
ImageTransparency=am and 0.8 or 0.88,
LayoutOrder=2,
Parent=av,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
af("UIStroke",{
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=am and 0.8 or 0.88,
Thickness=1,
}),
af("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
af("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
})

local aE=NormalizeKey(ah.ToggleKey or ak.DefaultKey or ak.Value)
af("TextLabel",{
Size=UDim2.new(0.4,0,1,0),
BackgroundTransparency=1,
Text="Current",
TextSize=am and 11 or 12,
TextXAlignment="Left",
TextTransparency=0.44,
FontFace=Font.new(ad.Font,Enum.FontWeight.Medium),
Parent=aD,
ThemeTag={
TextColor3="Text",
},
})

local aF=af("TextLabel",{
Size=UDim2.new(0.6,0,1,0),
BackgroundTransparency=1,
Text=aE,
TextSize=am and 16 or 18,
TextXAlignment="Right",
FontFace=Font.new(ad.Font,Enum.FontWeight.Bold),
Parent=aD,
ThemeTag={
TextColor3="Text",
},
})

local aG=ad.NewRoundFrame(16,"Squircle",{
Name="ElementBindings",
Size=UDim2.new(1,0,0,am and 84 or 94),
ImageTransparency=am and 0.86 or 0.9,
LayoutOrder=3,
Parent=av,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
af("UIStroke",{
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=am and 0.82 or 0.9,
Thickness=1,
}),
af("UIPadding",{
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,8),
}),
af("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection="Vertical",
SortOrder="LayoutOrder",
}),
})

local aH=af("TextLabel",{
Name="Header",
Size=UDim2.new(1,0,0,14),
BackgroundTransparency=1,
Text="Element keybinds",
TextSize=am and 11 or 12,
TextXAlignment="Left",
TextTransparency=0.3,
LayoutOrder=1,
Parent=aG,
FontFace=Font.new(ad.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
})

local aI=af("ScrollingFrame",{
Name="List",
Size=UDim2.new(1,0,1,-19),
BackgroundTransparency=1,
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ScrollBarThickness=0,
LayoutOrder=2,
Parent=aG,
},{
af("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection="Vertical",
SortOrder="LayoutOrder",
}),
})

local aJ=af("TextLabel",{
Name="Empty",
Size=UDim2.new(1,0,0,28),
BackgroundTransparency=1,
Text="No element keybinds",
TextSize=am and 11 or 12,
TextTransparency=0.48,
FontFace=Font.new(ad.Font,Enum.FontWeight.Medium),
Parent=aI,
ThemeTag={
TextColor3="Text",
},
})

local aK=af("Frame",{
Size=UDim2.new(1,0,0,am and 38 or 38),
BackgroundTransparency=1,
LayoutOrder=4,
Parent=av,
},{
af("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Center",
}),
})

local function CreateButton(aL,aM,aN,aO,aP)
local aQ=ad.NewRoundFrame(14,"Squircle",{
Size=UDim2.new(0.5,-4,1,0),
ImageTransparency=aO=="Primary"and(am and 0.08 or 0.18)or(am and 0.84 or 0.9),
Parent=aL,
ThemeTag={
ImageColor3=aO=="Primary"and"Primary"or"ElementBackground",
},
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,am and 8 or 10),
PaddingRight=UDim.new(0,am and 8 or 10),
}),
af("UIListLayout",{
Padding=UDim.new(0,am and 5 or 7),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
aN and CreateIcon(aN,nil,am and 13 or 15)or nil,
af("TextLabel",{
Name="Title",
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
BackgroundTransparency=1,
Text=aM,
TextSize=am and 12 or 13,
FontFace=Font.new(ad.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
}),
},true)

ae.AttachPress(aQ,ad,{
Amount=0.97,
})

ad.AddSignal(aQ.MouseButton1Click,function()
ad.SafeCallback(aP)
end)

return aQ
end

local aL

local function ApplyKey(aM,aN)
local aO,aP=NormalizeKey(aM)
ah:SetToggleKey(aP)
aF.Text=aO
if not aN then
Notify("Keybind updated",aP and("Toggle key: "..aO)or"Toggle key cleared.","keyboard","Success")
end
end

local function StopCapture()
as.Capturing=false
if aL then
aL:Disconnect()
aL=nil
end
end

function as.Capture(aM)
if as.Capturing then
return
end

as.Capturing=true
aF.Text="Press key..."

aL=aa.InputBegan:Connect(function(aN)
if aN.UserInputType~=Enum.UserInputType.Keyboard then
return
end
if aN.KeyCode==Enum.KeyCode.Unknown then
return
end
if aN.KeyCode==Enum.KeyCode.Escape then
StopCapture()
local aO=NormalizeKey(ah.ToggleKey)
aF.Text=aO
return
end

ApplyKey(aN.KeyCode)
StopCapture()
end)
end

local aM=CreateButton(aK,am and"Bind"or"Set Key","scan-line","Primary",function()
as:Capture()
end)
local aN=CreateButton(aK,"Clear","x","Secondary",function()
StopCapture()
ApplyKey(nil)
end)

local aO=af("Frame",{
Name="QuickKeys",
Size=UDim2.new(1,0,0,am and 34 or 32),
BackgroundTransparency=1,
LayoutOrder=5,
Parent=av,
},{
af("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Center",
}),
})

local function ShortKeyName(aP)
local aQ=tostring(aP)
if not am then
return aQ
end

aQ=aQ:gsub("Right","R")
aQ=aQ:gsub("Left","L")
aQ=aQ:gsub("Control","Ctrl")
return aQ
end

for aP,aQ in next,ar do local
aR, aS=NormalizeKey(aQ)
if aS then
CreateButton(aO,ShortKeyName(aQ),nil,"Secondary",function()
StopCapture()
ApplyKey(aS)
end).Size=UDim2.new(1/#ar,-4,1,0)
end
end

local aP={}
local aQ={}

local function ClearElementRows()
for aR,aS in next,aQ do
if aS then
aS:Disconnect()
end
end
for aR,aS in next,aP do
if aS and aS.Destroy then
aS:Destroy()
end
end
for aR in next,aQ do
aQ[aR]=nil
end
for aR in next,aP do
aP[aR]=nil
end
end

local function NormalizeElementKey(aR)
local aS,aT=NormalizeKey(aR)
if aT then
return ShortKeyName(aS),aT
end
if typeof(aR)=="string"and aR~=""then
return ShortKeyName(aR),nil
end
return nil,nil
end

local function GetElementKeybind(aR)
if typeof(aR)~="table"then
return nil,nil
end

local aS=aR.Keybind
or aR.KeyBind
or aR.Shortcut
or aR.Bind
or aR.Hotkey
or(aR.__type=="Keybind"and aR.Value)
return NormalizeElementKey(aS)
end

local function GetElementIcon(aR)
if aR.__type=="Toggle"then
return"toggle-right"
elseif aR.__type=="Button"then
return"mouse-pointer-click"
end
return"keyboard"
end

local function ActivateElement(aR,aS)
if typeof(aR)~="table"then
return
end
if aR.Locked then
return
end
if aR.__type=="Toggle"and aR.Toggle then
aR:Toggle()
return
end
if aR.__type=="Button"and aR.Press then
aR:Press()
return
end
if aR.Callback then
ad.SafeCallback(aR.Callback,aS)
end
end

local function CreateElementRow(aR,aS,aT)
local aU=ad.NewRoundFrame(12,"Squircle",{
Name="ElementBind",
Size=UDim2.new(1,0,0,am and 28 or 32),
ImageTransparency=am and 0.9 or 0.92,
LayoutOrder=aT,
Parent=aI,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}),
af("UIListLayout",{
Padding=UDim.new(0,7),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
CreateIcon(GetElementIcon(aR),nil,am and 13 or 14),
af("TextLabel",{
Name="Title",
Size=UDim2.new(1,-84,1,0),
BackgroundTransparency=1,
Text=aR.Title or aR.__type or"Element",
TextSize=am and 11 or 12,
TextXAlignment="Left",
TextTruncate="AtEnd",
FontFace=Font.new(ad.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
}),
af("TextLabel",{
Name="Key",
Size=UDim2.new(0,56,0,am and 20 or 22),
BackgroundTransparency=1,
Text=aS,
TextSize=am and 11 or 12,
TextXAlignment="Right",
TextTransparency=0.14,
FontFace=Font.new(ad.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
}),
},true)

ae.AttachPress(aU,ad,{
Amount=0.98,
})

local aV=aU.MouseButton1Click:Connect(function()
ActivateElement(aR,aS)
end)

table.insert(aQ,aV)
table.insert(aP,aU)
end

local function RenderElementBindings()
ClearElementRows()

local aR=0
for aS,aT in next,ah.AllElements or{}do
local aU=GetElementKeybind(aT)
if aU then
aR+=1
CreateElementRow(aT,aU,aR)
end
end

aJ.Visible=aR==0
aH.Text=aR>0 and("Element keybinds ("..aR..")")or"Element keybinds"
end

if ah.ToggleKey==nil and ak.DefaultKey and ak.ApplyDefault~=false then local
aR, aS=NormalizeKey(ak.DefaultKey)
if aS then
ApplyKey(aS,true)
end
end

local function UpdateRootPosition()
local aR=GetViewportSize()
local aS=12

if am then
an=math.min(ak.Width or 330,math.max(240,aR.X-(aS*2)))
ao=ak.Height or 300
at.Size=UDim2.fromOffset(an,ao)
at.AnchorPoint=Vector2.new(0.5,1)
as.TargetPosition=UDim2.fromOffset(aR.X/2,aR.Y-aS)
at.Position=as.TargetPosition
au.Size=UDim2.fromOffset(aR.X,aR.Y)

if as.UserMoved and as.StoredPosition then
at.Position=as.StoredPosition
as.TargetPosition=as.StoredPosition
end

return
end

local aT=aR.X-aS
local aU=aS+ah.Topbar.Height

if as.Button and as.Button.AbsoluteSize.X>0 then
local aV=as.Button.AbsolutePosition
local b=as.Button.AbsoluteSize
aT=aV.X+b.X
aU=aV.Y+b.Y+10
end

if aT-an<aS then
aT=math.min(aR.X-aS,aS+an)
end
if aU+ao>aR.Y-aS then
aU=math.max(aS,aR.Y-ao-aS)
end

at.Position=UDim2.fromOffset(aT,aU)
as.TargetPosition=at.Position
au.Size=UDim2.fromOffset(aR.X,aR.Y)

if as.UserMoved and as.StoredPosition then
at.Position=as.StoredPosition
end
end

function as.SetButton(aR,aS)
as.Button=aS
end

local aR=ad.Drag(at,{ax,aw},function(aR)
if not aR then
as.UserMoved=true
as.StoredPosition=at.Position
end
end)
as.UIElements.Drag=aR

function as.OpenMenu(aS)
if as.Open then
return
end

as.Open=true
as.Token+=1
RenderElementBindings()
UpdateRootPosition()
local aT=as.TargetPosition or at.Position
at.Visible=true
at.Active=true
au.Visible=true
if am then
at.Position=UDim2.new(
aT.X.Scale,
aT.X.Offset,
aT.Y.Scale,
aT.Y.Offset+18
)
end
at.ImageTransparency=1
av.GroupTransparency=1
at.GlassLayer.ImageTransparency=1
at.Outline.ImageTransparency=1
at.Scale.Scale=0.98
au.BackgroundTransparency=1
ae.Play(at,"DropdownOpen",{
ImageTransparency=ak.BackgroundTransparency or(am and 0.48 or 0.18),
Position=aT,
},nil,nil,"KeyBindMenu")
ae.Play(av,"DropdownOpen",{GroupTransparency=0},nil,nil,"KeyBindContent")
ae.Play(at.GlassLayer,"DropdownOpen",{ImageTransparency=am and 0.92 or 0.78},nil,nil,"KeyBindGlass")
ae.Play(at.Outline,"DropdownOpen",{ImageTransparency=am and 0.48 or 0.72},nil,nil,"KeyBindOutline")
ae.Play(at.Scale,"DropdownOpen",{Scale=1},nil,nil,"KeyBindScale")
ae.Play(
au,
"DropdownOpen",
{BackgroundTransparency=GetScrimTransparency()},
nil,
nil,
"KeyBindScrim"
)
end

function as.CloseMenu(aS)
if not as.Open then
return
end

as.Open=false
as.Token+=1
local aT=as.Token
StopCapture()
at.Active=false
local aU=at.Position
if am then
aU=UDim2.new(
at.Position.X.Scale,
at.Position.X.Offset,
at.Position.Y.Scale,
at.Position.Y.Offset+18
)
end
ae.Play(at,"DropdownClose",{ImageTransparency=1,Position=aU},nil,nil,"KeyBindMenu")
ae.Play(av,"DropdownClose",{GroupTransparency=1},nil,nil,"KeyBindContent")
ae.Play(at.GlassLayer,"DropdownClose",{ImageTransparency=1},nil,nil,"KeyBindGlass")
ae.Play(at.Outline,"DropdownClose",{ImageTransparency=1},nil,nil,"KeyBindOutline")
ae.Play(at.Scale,"DropdownClose",{Scale=0.98},nil,nil,"KeyBindScale")
ae.Play(au,"DropdownClose",{BackgroundTransparency=1},nil,nil,"KeyBindScrim")
task.delay(ae.GetDuration"DropdownClose",function()
if aT==as.Token then
at.Visible=false
au.Visible=false
end
end)
end

function as.Toggle(aS)
if as.Open then
as:CloseMenu()
else
as:OpenMenu()
end
end

ad.AddSignal(aa.InputBegan,function(aS)
if not as.Open then
return
end
if aS.UserInputType~=Enum.UserInputType.MouseButton1 and aS.UserInputType~=Enum.UserInputType.Touch then
return
end
if ContainsPoint(at,aS.Position)or ContainsPoint(as.Button,aS.Position)then
return
end
as:CloseMenu()
end)

as.UIElements.CurrentKey=aF
as.UIElements.SetButton=aM
as.UIElements.ClearButton=aN

return as
end

return ag end function a.G()

local aa={}

local ab=a.load'd'
local ad=ab.New
local ae=ab.Tween


function aa.New(af,ag,ah,ai,aj,ak)
local al={
Container=nil,
TooltipSize=16,

TooltipArrowSizeX=aj=="Small"and 16 or 24,
TooltipArrowSizeY=aj=="Small"and 6 or 9,

PaddingX=aj=="Small"and 12 or 14,
PaddingY=aj=="Small"and 7 or 9,

Radius=999,

TitleFrame=nil,
}

ai=ai or""
ak=ak~=false

local am=ad("TextLabel",{
AutomaticSize="XY",
TextWrapped=ak,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Text=af,
TextSize=aj=="Small"and 15 or 17,
TextTransparency=1,
ThemeTag={
TextColor3="Tooltip"..ai.."Text",
}
})

al.TitleFrame=am

local an=ad("UIScale",{
Scale=.9
})

local ao=ad("Frame",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=ag,

Visible=false
},{
ad("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
ad("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=ah,
Name="Arrow",
},{
ad("ImageLabel",{
Size=UDim2.new(0,al.TooltipArrowSizeX,0,al.TooltipArrowSizeY),
BackgroundTransparency=1,

Image="rbxassetid://105854070513330",
ThemeTag={
ImageColor3="Tooltip"..ai,
},
},{










}),
}),
ab.NewRoundFrame(al.Radius,"Squircle",{
AutomaticSize="XY",
ThemeTag={
ImageColor3="Tooltip"..ai,
},
ImageTransparency=1,
Name="Background",
},{



ad("Frame",{



AutomaticSize="XY",
BackgroundTransparency=1,
},{
ad("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ad("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

am,
ad("UIPadding",{
PaddingTop=UDim.new(0,al.PaddingY),
PaddingLeft=UDim.new(0,al.PaddingX),
PaddingRight=UDim.new(0,al.PaddingX),
PaddingBottom=UDim.new(0,al.PaddingY),
}),
})
}),
an,
ad("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
al.Container=ao

function al.Open(ap)
ao.Visible=true


ae(ao.Background,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ae(ao.Arrow.ImageLabel,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ae(am,.2,{TextTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ae(an,.22,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function al.Close(ap,aq)

ae(ao.Background,.3,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ae(ao.Arrow.ImageLabel,.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ae(am,.3,{TextTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ae(an,.35,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.In):Play()

aq=aq~=false
if aq then
task.wait(.35)

ao.Visible=false
ao:Destroy()
end
end

return al
end



return aa end function a.H()
local aa=game:GetService"TweenService"

local ab=a.load'd'
local ad=a.load'e'
local ae=ab.New

local af={}

local function GetImageTarget(ag)
if typeof(ag)~="Instance"then
return nil
end

if ag:IsA"ImageLabel"or ag:IsA"ImageButton"then
return ag
end

return ag:FindFirstChildWhichIsA("ImageLabel",true)or ag:FindFirstChildWhichIsA("ImageButton",true)
end

local function AsColor(ag,ah)
if typeof(ag)=="Color3"then
return ag
end

if typeof(ag)=="string"then
local ai,aj=pcall(function()
return Color3.fromHex(ag)
end)
if ai then
return aj
end
end

return ah
end

local function NewGradient(ag,ah,ai,aj)
return ae("UIGradient",{
Rotation=ag or 0,
Offset=ah or Vector2.new(0,0),
Color=ColorSequence.new(ai),
Transparency=NumberSequence.new(aj),
})
end

function af.Apply(ag,ah)
if typeof(ag)~="Instance"then
return nil
end

ah=typeof(ah)=="table"and ah or{}

local ai=ah.Corner or 16
local aj=ah.ZIndex or ag.ZIndex or 1
local ak=ah.Compact==true
local al=ah.Animated~=false

local am=AsColor(ah.EdgeColor,Color3.fromRGB(255,215,92))
local an=AsColor(ah.DeepColor,Color3.fromRGB(84,54,10))
local ao=AsColor(ah.MidColor,Color3.fromRGB(206,147,39))
local ap=AsColor(ah.HotColor,Color3.fromRGB(255,241,166))

pcall(function()
ag.ClipsDescendants=true
end)

local aq=ae("Frame",{
Name=ah.Name or"GoldenEffect",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Active=false,
ZIndex=aj+20,
Parent=ag,
})

local ar=ab.NewRoundFrame(ai,"Squircle",{
Name="GoldenFill",
Size=UDim2.new(1,0,1,0),
ImageColor3=an,
ImageTransparency=ah.FillTransparency or 0.76,
Active=false,
ZIndex=aj+20,
Parent=aq,
},{
NewGradient(24,Vector2.new(-0.1,0),{
ColorSequenceKeypoint.new(0,an),
ColorSequenceKeypoint.new(0.42,ao),
ColorSequenceKeypoint.new(0.72,ap),
ColorSequenceKeypoint.new(1,an),
},{
NumberSequenceKeypoint.new(0,0.18),
NumberSequenceKeypoint.new(0.52,0.04),
NumberSequenceKeypoint.new(1,0.22),
}),
})

local as=ab.NewRoundFrame(ai,"SquircleOutline",{
Name="GoldenOutline",
Size=UDim2.new(1,0,1,0),
ImageColor3=am,
ImageTransparency=ah.OutlineTransparency or 0.22,
Active=false,
ZIndex=aj+22,
Parent=aq,
},{
NewGradient(35,Vector2.new(0,0),{
ColorSequenceKeypoint.new(0,am),
ColorSequenceKeypoint.new(0.5,ap),
ColorSequenceKeypoint.new(1,ao),
},{
NumberSequenceKeypoint.new(0,0.04),
NumberSequenceKeypoint.new(0.48,0),
NumberSequenceKeypoint.new(1,0.12),
}),
})

local at=NewGradient(18,Vector2.new(-1.15,0),{
ColorSequenceKeypoint.new(0,ap),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,ap),
},{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.42,1),
NumberSequenceKeypoint.new(0.5,0.15),
NumberSequenceKeypoint.new(0.58,1),
NumberSequenceKeypoint.new(1,1),
})

local au=ab.NewRoundFrame(ai,"Squircle",{
Name="GoldenSheen",
Size=UDim2.new(1,0,1,0),
ImageColor3=ap,
ImageTransparency=ah.SheenTransparency or 0.74,
Active=false,
ZIndex=aj+23,
Parent=aq,
},{
at,
})

local av=ae("Frame",{
Name="Sparkles",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Active=false,
ClipsDescendants=true,
ZIndex=aj+24,
Parent=aq,
})

local aw={}
local ax=ah.Points or{
{0.16,0.28,0},
{0.76,0.22,0.42},
{0.34,0.72,0.82},
{0.88,0.64,1.12},
}

for ay,az in ipairs(ax)do
local aA=ak and 9 or 12
local aB=ab.Image("sparkles","GoldenSparkle"..ay,0,"Temp","GoldenEffect",false,true)
aB.Name="Sparkle"..ay
aB.Size=UDim2.fromOffset(aA,aA)
aB.AnchorPoint=Vector2.new(0.5,0.5)
aB.Position=UDim2.fromScale(az[1],az[2])
aB.BackgroundTransparency=1
aB.ZIndex=aj+24
aB.Parent=av

local aC=GetImageTarget(aB)
if aC then
aC.ImageColor3=ap
aC.ImageTransparency=0.62
aC.ZIndex=aj+24
end

local aD=ae("UIScale",{
Scale=0.72,
Parent=aB,
})

table.insert(aw,{
Frame=aB,
Image=aC,
Scale=aD,
Delay=az[3]or 0,
})
end

local ay={
Root=aq,
Fill=ar,
Outline=as,
Sheen=au,
Sparkles=aw,
Running=true,
}

function ay.Destroy(az)
az.Running=false
if az.Root then
az.Root:Destroy()
end
end

if ad:IsEnabled()and not ad.Reduced and al then
task.spawn(function()
while ay.Running and aq.Parent do
at.Offset=Vector2.new(-1.15,0)
local az=aa:Create(
at,
TweenInfo.new(ah.SheenDuration or 1.65,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{Offset=Vector2.new(1.15,0)}
)
az:Play()
az.Completed:Wait()
task.wait(ah.SheenPause or 0.42)
end
end)

for az,aA in ipairs(aw)do
task.spawn(function()
task.wait(aA.Delay)
while ay.Running and aq.Parent and aA.Frame.Parent do
aA.Scale.Scale=0.72
aA.Frame.Rotation=-18
if aA.Image then
aA.Image.ImageTransparency=0.68
end

local aB=aa:Create(
aA.Scale,
TweenInfo.new(0.34,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
{Scale=1.12}
)
local aC=aA.Image and aa:Create(
aA.Image,
TweenInfo.new(0.22,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),
{ImageTransparency=0.12}
)
local aD=aa:Create(
aA.Frame,
TweenInfo.new(0.58,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{Rotation=22}
)

aB:Play()
aD:Play()
if aC then
aC:Play()
end
aB.Completed:Wait()

local aE=aa:Create(
aA.Scale,
TweenInfo.new(0.24,Enum.EasingStyle.Sine,Enum.EasingDirection.In),
{Scale=0.78}
)
local aF=aA.Image and aa:Create(
aA.Image,
TweenInfo.new(0.28,Enum.EasingStyle.Sine,Enum.EasingDirection.In),
{ImageTransparency=0.72}
)
aE:Play()
if aF then
aF:Play()
end
aE.Completed:Wait()
task.wait(ah.SparklePause or 1.2)
end
end)
end
end

return ay
end

return af end function a.I()

game:GetService"ReplicatedStorage"
local aa=a.load'd'
local ab=a.load'e'
local ad=aa.New
local ae=aa.NewRoundFrame
local af=a.load'H'

local ag=(cloneref or clonereference or function(ag)
return ag
end)

ag(game:GetService"UserInputService")

local ah=a.load'A'

local function Color3ToHSB(ai)
local aj,ak,al=ai.R,ai.G,ai.B
local am=math.max(aj,ak,al)
local an=math.min(aj,ak,al)
local ao=am-an

local ap=0
if ao~=0 then
if am==aj then
ap=(ak-al)/ao%6
elseif am==ak then
ap=(al-aj)/ao+2
else
ap=(aj-ak)/ao+4
end
ap=ap*60
else
ap=0
end

local aq=(am==0)and 0 or(ao/am)
local ar=am

return{
h=math.floor(ap+0.5),
s=aq,
b=ar,
}
end

local function GetPerceivedBrightness(ai)
local aj=ai.R
local ak=ai.G
local al=ai.B
return 0.299*aj+0.587*ak+0.114*al
end

local function GetTextColorForHSB(ai)
local aj=Color3ToHSB(ai)local
ak, al, am=aj.h, aj.s, aj.b
if GetPerceivedBrightness(ai)>0.5 then
return Color3.fromHSV(ak/360,0,0.05)
else
return Color3.fromHSV(ak/360,0,0.98)
end
end

local function Coalesce(...)
for ai=1,select("#",...)do
local aj=select(ai,...)
if aj~=nil then
return aj
end
end
return nil
end

return function(ai)
local aj={
Title=ai.Title,
Desc=ai.Desc or nil,
Hover=ai.Hover,
Thumbnail=ai.Thumbnail,
ThumbnailSize=ai.ThumbnailSize or 80,
Image=ai.Image,
IconThemed=ai.IconThemed or false,
ImageSize=ai.ImageSize or 30,
Color=ai.Color,
Scalable=ai.Scalable,
Parent=ai.Parent,
Justify=ai.Justify or"Between",
UIPadding=ai.Window.ElementConfig.UIPadding,
UICorner=ai.Window.ElementConfig.UICorner,
Transparency=Coalesce(
ai.Transparency,
ai.ParentConfig and ai.ParentConfig.Transparency,
ai.ParentConfig and ai.ParentConfig.ElementTransparency,
ai.Window.ElementConfig.Transparency
),
GlassTransparency=Coalesce(
ai.GlassTransparency,
ai.ParentConfig and ai.ParentConfig.GlassTransparency,
ai.Window.ElementConfig.GlassTransparency
),
LiquidGlass=Coalesce(
ai.LiquidGlass,
ai.ParentConfig and ai.ParentConfig.LiquidGlass,
ai.ParentConfig and ai.ParentConfig.GlassLiquid,
ai.Window.ElementConfig.LiquidGlass
),
Golden=ai.Golden==true
or ai.Premium==true
or(ai.ParentConfig and(ai.ParentConfig.Golden==true or ai.ParentConfig.Premium==true)),
CornerStyle=Coalesce(
ai.CornerStyle,
ai.ParentConfig and ai.ParentConfig.CornerStyle,
ai.ParentConfig and ai.ParentConfig.ElementCornerStyle,
ai.Window.ElementConfig.CornerStyle
),
Size=ai.Size or"Default",
Tags=ai.Tags or{},
UIElements={},

Index=ai.Index,
LinkCorners=ai.LinkCorners,
CornerGroup=ai.CornerGroup or ai.LinkCornerGroup,
CornerBreak=ai.CornerBreak,
CornerBreakBefore=ai.CornerBreakBefore,
CornerBreakAfter=ai.CornerBreakAfter,
}

local ak=aj.Size=="Small"and-4 or aj.Size=="Large"and 4 or 0
local al=aj.Size=="Small"and-4 or aj.Size=="Large"and 4 or 0

local am=aj.ImageSize
local an=aj.ThumbnailSize
local ao=true

local ap=aj.CornerStyle=="Native"or aj.CornerStyle=="PerCorner"
local aq=aa.ClampTransparency(aj.Transparency,nil)
local ar
local as
local at
local au={
TopLeft=true,
TopRight=true,
BottomLeft=true,
BottomRight=true,
}

local av=0

local aw
local ax
if aj.Thumbnail then
aw=aa.Image(
aj.Thumbnail,
aj.Title,
ai.Window.NewElements and aj.UICorner-11 or(aj.UICorner-4),
ai.Window.Folder,
"Thumbnail",
false,
aj.IconThemed
)
aw.Size=UDim2.new(1,0,0,an)
end
if aj.Image then
ax=aa.Image(
aj.Image,
aj.Title,
ai.Window.NewElements and aj.UICorner-11 or(aj.UICorner-4),
ai.Window.Folder,
"Image",
aj.IconThemed,
not aj.Color and true or false,
"ElementIcon"
)

if typeof(aj.Color)=="string"and not string.find(aj.Image,"rbxthumb")then
ax.ImageLabel.ImageColor3=GetTextColorForHSB(Color3.fromHex(aa.Colors[aj.Color]))
elseif typeof(aj.Color)=="Color3"and not string.find(aj.Image,"rbxthumb")then
ax.ImageLabel.ImageColor3=GetTextColorForHSB(aj.Color)
end

ax.Size=UDim2.new(0,am,0,am)

av=am
end

local function CreateText(ay,az)
local aA=typeof(aj.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[aj.Color]))
or typeof(aj.Color)=="Color3"and GetTextColorForHSB(aj.Color)

return ad("TextLabel",{
BackgroundTransparency=1,
Text=ay or"",
TextSize=az=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not aj.Color and("Element"..az)or nil,
},
TextColor3=aj.Color and aA or nil,
TextTransparency=az=="Desc"and 0.3 or 0,
TextWrapped=true,
Size=UDim2.new(aj.Justify=="Between"and 1 or 0,0,0,0),
AutomaticSize=aj.Justify=="Between"and"Y"or"XY",
FontFace=Font.new(aa.Font,az=="Desc"and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold),
})
end

local ay=CreateText(aj.Title,"Title")
local az=CreateText(aj.Desc,"Desc")
if not aj.Title or aj.Title==""then
az.Visible=false
end
if not aj.Desc or aj.Desc==""then
az.Visible=false
end

aj.UIElements.Title=ay
aj.UIElements.Desc=az

aj.UIElements.Container=ad("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ad("UIListLayout",{
Padding=UDim.new(0,aj.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment=aj.Justify=="Between"and"Left"or"Center",
}),
aw,
ad("Frame",{
Size=UDim2.new(
aj.Justify=="Between"and 1 or 0,
aj.Justify=="Between"and-ai.TextOffset or 0,
0,
0
),
AutomaticSize=aj.Justify=="Between"and"Y"or"XY",
BackgroundTransparency=1,
Name="TitleFrame",
},{
ad("UIListLayout",{
Padding=UDim.new(0,aj.UIPadding),
FillDirection="Horizontal",
VerticalAlignment=ai.Window.NewElements and(aj.Justify=="Between"and"Top"or"Center")
or"Center",
HorizontalAlignment=aj.Justify~="Between"and aj.Justify or"Center",
}),
ax,
ad("Frame",{
BackgroundTransparency=1,
AutomaticSize=aj.Justify=="Between"and"Y"or"XY",
Size=UDim2.new(
aj.Justify=="Between"and 1 or 0,
aj.Justify=="Between"and(ax and-av-aj.UIPadding or-av)
or 0,
1,
0
),
Name="TitleFrame",
},{
ad("UIPadding",{
PaddingTop=UDim.new(0,(ai.Window.NewElements and aj.UIPadding/2 or 0)+al),
PaddingLeft=UDim.new(0,(ai.Window.NewElements and aj.UIPadding/2 or 0)+ak),
PaddingRight=UDim.new(
0,
(ai.Window.NewElements and aj.UIPadding/2 or 0)+ak
),
PaddingBottom=UDim.new(
0,
(ai.Window.NewElements and aj.UIPadding/2 or 0)+al
),
}),
ad("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ad("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=-99,
BackgroundTransparency=1,
ScrollingDirection="X",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
Visible=false,
},{
ad("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,ai.Window.UIPadding/2),
}),
}),
ad("Frame",{
Name="Space",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Visible=false,
}),
ay,
az,
}),
}),
})

for aA,aB in next,ai.Tags or{}do
if not aj.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible then
aj.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible=true
aj.UIElements.Container.TitleFrame.TitleFrame.Space.Visible=true
end
ah:New(aB,aj.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame)
end

aa.AddSignal(
aj.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout:GetPropertyChangedSignal
"AbsoluteContentSize"
,
function()
aj.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Size=UDim2.new(
1,
0,
0,
aj.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y
/ai.ParentConfig.UIScale
)
end
)





local aA=aa.Image("lock","lock",0,ai.Window.Folder,"Lock",false)
aA.Size=UDim2.new(0,20,0,20)
aA.ImageLabel.ImageColor3=Color3.new(1,1,1)
aA.ImageLabel.ImageTransparency=0.4

local aB=ad("TextLabel",{
Text="Locked",
TextSize=18,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
AutomaticSize="XY",
BackgroundTransparency=1,
TextColor3=Color3.new(1,1,1),
TextTransparency=0.05,
})

local aC=ad("Frame",{
Size=UDim2.new(1,aj.UIPadding*2,1,aj.UIPadding*2),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ZIndex=9999999,
})

local aD,aE=ae(aj.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.25,
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
Parent=aC,
},{
ad("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
aA,
aB,
},nil,true)local

aF=ae(aj.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=aC,
},{
ad("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)

local aG,aH=ae(aj.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=aC,
},{
ad("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)local

aI=ae(aj.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Visible=false,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=aC,
},{
ad("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
ad("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
},nil,true)

local aJ,aK=ae(aj.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=aC,
},{
ad("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
ad("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)

local function GetElementColor()
if typeof(aj.Color)=="string"then
return Color3.fromHex(aa.Colors[aj.Color])
end
if typeof(aj.Color)=="Color3"then
return aj.Color
end
return nil
end

local function GetBackgroundTransparency()
if aq~=nil then
return aq
end
if aj.LiquidGlass then
return aa.ClampTransparency(aj.GlassTransparency,0.24)
end
if aj.Color then
return 0.05
end
if not ai.Window.NewElements then
return 0.93
end
return nil
end

local function ApplyNativeCorners(aL)
au=aL or au
if as then
aa.ApplyCornerRadii(as,UDim.new(0,aj.UICorner),au)
end
end

local function CreateLiquidGlassChildren()
if not aj.LiquidGlass then
return{}
end

at=ad("UIGradient",{
Rotation=25,
Offset=Vector2.new(-0.35,0),
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.45,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.94),
NumberSequenceKeypoint.new(0.45,0.78),
NumberSequenceKeypoint.new(1,0.98),
},
})

return{
ad("UIStroke",{
ApplyStrokeMode="Border",
Thickness=1,
Color=Color3.new(1,1,1),
Transparency=0.88,
}),
at,
}
end

local function CreateNativeBackground()
as=ad("UICorner",{
CornerRadius=UDim.new(0,aj.UICorner),
})

local aL={
as,
}

for aM,aN in next,CreateLiquidGlassChildren()do
table.insert(aL,aN)
end

return ad("Frame",{
Name="NativeBackground",
Size=UDim2.new(1,aj.UIPadding*2,1,aj.UIPadding*2),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
BackgroundColor3=GetElementColor()or nil,
BackgroundTransparency=GetBackgroundTransparency()or 0,
ThemeTag=not aj.Color and{
BackgroundColor3="ElementBackground",
BackgroundTransparency=aq==nil and not aj.LiquidGlass and"ElementBackgroundTransparency"
or nil,
}or nil,
ZIndex=0,
Active=false,
},aL)
end

local aL={}
if ap then
ar=CreateNativeBackground()
table.insert(aL,ar)
end

table.insert(aL,aj.UIElements.Container)
table.insert(aL,aC)
table.insert(aL,ad("UIPadding",{
PaddingTop=UDim.new(0,aj.UIPadding),
PaddingLeft=UDim.new(0,aj.UIPadding),
PaddingRight=UDim.new(0,aj.UIPadding),
PaddingBottom=UDim.new(0,aj.UIPadding),
}))

local aM,aN=ae(aj.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ImageTransparency=ap and 1 or GetBackgroundTransparency(),



Parent=ai.Parent,
ThemeTag={
ImageColor3=not ap
and not aj.Color
and(ai.Window.NewElements and"ElementBackground"or"Text")
or nil,
ImageTransparency=not ap
and not aj.Color
and aq==nil
and not aj.LiquidGlass
and(ai.Window.NewElements and"ElementBackgroundTransparency"or nil)
or nil,
},
ImageColor3=not ap and GetElementColor()or nil,
},aL,true,true)

aj.UIElements.Main=aM
aj.UIElements.Locked=aD
ApplyNativeCorners(au)

if aj.Golden then
aj.UIElements.GoldenEffect=af.Apply(aC,{
Corner=aj.UICorner,
Compact=aj.Size=="Small",
FillTransparency=0.8,
OutlineTransparency=0.18,
SheenTransparency=0.82,
})

ay.TextColor3=Color3.fromRGB(255,232,144)
az.TextColor3=Color3.fromRGB(255,224,138)
az.TextTransparency=math.min(az.TextTransparency+0.08,0.72)
end

if aj.Hover then
aa.AddSignal(aM.MouseMoved,function(aO,aP)
if ao and aM.AbsoluteSize.X>0 then
aJ.HoverGradient.Offset=Vector2.new(((aO-aM.AbsolutePosition.X)/aM.AbsoluteSize.X)-0.5,0)
aI.HoverGradient.Offset=
Vector2.new(((aO-aM.AbsolutePosition.X)/aM.AbsoluteSize.X)-0.5,0)
if at then
at.Offset=Vector2.new(((aO-aM.AbsolutePosition.X)/aM.AbsoluteSize.X)-0.5,0)
end
end
end)

aa.AddSignal(aM.MouseEnter,function()
if ao then

aI.Visible=true
ab.Play(aJ,"Hover",{ImageTransparency=0.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Hover")
ab.Play(
aI,
"Hover",
{ImageTransparency=0.8},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
if ar and aj.LiquidGlass then
ab.Play(
ar,
"Hover",
{BackgroundTransparency=math.max((aq or aj.GlassTransparency or 0.24)-0.06,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
end
end
end)
aa.AddSignal(aM.InputEnded,function()
if ao then

ab.Play(aJ,"Hover",{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Hover")
ab.Play(
aI,
"Hover",
{ImageTransparency=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
if ar and aj.LiquidGlass then
ab.Play(
ar,
"Hover",
{BackgroundTransparency=GetBackgroundTransparency()or 0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
end
end
end)
aa.AddSignal(aM.MouseLeave,function()
if ao then
ab.Play(aJ,"Hover",{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Hover")
ab.Play(
aI,
"Hover",
{ImageTransparency=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
if ar and aj.LiquidGlass then
ab.Play(
ar,
"Hover",
{BackgroundTransparency=GetBackgroundTransparency()or 0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
end
end
end)
end

if aj.Scalable then
ab.AttachPress(aM,aa,{
Amount=0.985,
Enabled=function()
return ao
end,
})
end

function aj.SetTitle(aO,aP)
aj.Title=aP
ay.Text=aP
end

function aj.SetDesc(aO,aP)
aj.Desc=aP
az.Text=aP or""
if not aP then
az.Visible=false
elseif not az.Visible then
az.Visible=true
end
end

function aj.SetTransparency(aO,aP)
aq=aa.ClampTransparency(aP,aq or 0)
aj.Transparency=aq

if ar then
ab.Play(
ar,
"Focus",
{BackgroundTransparency=aq},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"ElementTransparency"
)
else
ab.Play(
aM,
"Focus",
{ImageTransparency=aq},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"ElementTransparency"
)
end
end

function aj.SetLiquidGlass(aO,aP)
aj.LiquidGlass=aP==true
if ar then
for aQ,aR in next,ar:GetChildren()do
if aR:IsA"UIStroke"or aR:IsA"UIGradient"then
pcall(function()
aR.Enabled=aj.LiquidGlass
end)
end
end
if aq==nil then
ar.BackgroundTransparency=GetBackgroundTransparency()or 0
end
end
end

function aj.Colorize(aO,aP,aQ)
if aj.Color then
aP[aQ]=typeof(aj.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[aj.Color]))
or typeof(aj.Color)=="Color3"and GetTextColorForHSB(aj.Color)
or nil
end
end

if ai.ElementTable then
aa.AddSignal(ay:GetPropertyChangedSignal"Text",function()
if aj.Title~=ay.Text then
aj:SetTitle(ay.Text)
ai.ElementTable.Title=ay.Text
end
end)
aa.AddSignal(az:GetPropertyChangedSignal"Text",function()
if aj.Desc~=az.Text then
aj:SetDesc(az.Text)
ai.ElementTable.Desc=az.Text
end
end)
end





function aj.SetThumbnail(aO,aP,aQ)
aj.Thumbnail=aP
if aQ then
aj.ThumbnailSize=aQ
an=aQ
end

if aw then
if aP then
aw:Destroy()
aw=aa.Image(
aP,
aj.Title,
aj.UICorner-3,
ai.Window.Folder,
"Thumbnail",
false,
aj.IconThemed
)
if aw then
aw.Size=UDim2.new(1,0,0,an)
aw.Parent=aj.UIElements.Container
local aR=aj.UIElements.Container:FindFirstChild"UIListLayout"
if aR then
aw.LayoutOrder=-1
end
end
else
aw.Visible=false
end
else
if aP then
aw=aa.Image(
aP,
aj.Title,
aj.UICorner-3,
ai.Window.Folder,
"Thumbnail",
false,
aj.IconThemed
)
if aw then
aw.Size=UDim2.new(1,0,0,an)
aw.Parent=aj.UIElements.Container
local aR=aj.UIElements.Container:FindFirstChild"UIListLayout"
if aR then
aw.LayoutOrder=-1
end
end
end
end
end

function aj.SetImage(aO,aP,aQ)
aj.Image=aP
if aQ then
aj.ImageSize=aQ
am=aQ
end

if aP then
local aR=ax and ax.Parent or aj.UIElements.Container.TitleFrame
if ax then
ax:Destroy()
end

ax=aa.Image(
aP,
aP,
aj.UICorner-3,
ai.Window.Folder,
"Image",
not aj.Color and true or false
)
if ax then
if typeof(aj.Color)=="string"and not string.find(aj.Image,"rbxthumb")then
ax.ImageLabel.ImageColor3=
GetTextColorForHSB(Color3.fromHex(aa.Colors[aj.Color]))
elseif typeof(aj.Color)=="Color3"and not string.find(aj.Image,"rbxthumb")then
ax.ImageLabel.ImageColor3=GetTextColorForHSB(aj.Color)
end

ax.Visible=true
ax.Parent=aR
ax.LayoutOrder=-99

ax.Size=UDim2.new(0,am,0,am)
av=aj.ImageSize+aj.UIPadding
end
else
if ax then
ax.Visible=true
end
av=0
end

aj.UIElements.Container.TitleFrame.TitleFrame.Size=UDim2.new(1,-av,1,0)
end

function aj.Destroy(aO)
aM:Destroy()
end

function aj.Lock(aO,aP)
ao=false
aD.Active=true
aD.Visible=true
aB.Text=aP or"Locked"
end

function aj.Unlock(aO)
ao=true
aD.Active=false
aD.Visible=false
end

function aj.Highlight(aO)
local aP=ad("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.1,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.9,0.9),
NumberSequenceKeypoint.new(1,1),
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=aF,
})

local aQ=ad("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.15,0.8),
NumberSequenceKeypoint.new(0.5,0.1),
NumberSequenceKeypoint.new(0.85,0.8),
NumberSequenceKeypoint.new(1,1),
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=aG,
})

aF.ImageTransparency=0.65
aG.ImageTransparency=0.88

ab.Play(aP,"Highlight",{
Offset=Vector2.new(1,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Highlight")

ab.Play(aQ,"Highlight",{
Offset=Vector2.new(1,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Highlight")

task.spawn(function()
task.wait(ab.GetDuration"Highlight")
aF.ImageTransparency=1
aG.ImageTransparency=1
aP:Destroy()
aQ:Destroy()
end)
end

function aj.UpdateShape(aO)
if ai.Window.NewElements then
local aP=ai.ParentConfig
and ai.ParentConfig.ParentTable
and ai.ParentConfig.ParentTable.__type
or ai.ParentType
local aQ=ai.Window.ElementConfig.LinkCorners
or(ai.ParentConfig and ai.ParentConfig.LinkCorners==true)

local aR="Squircle"
local aS={
TopLeft=true,
TopRight=true,
BottomLeft=true,
BottomRight=true,
}

if aQ then
aR,aS=aa.GetLinkedCornerShape(
aO.Elements,
aj.Index,
aO,
aP,
ai.CornerLink
or(ai.ParentConfig and ai.ParentConfig.CornerLink)
or ai.Window.ElementConfig.CornerLink
)
end

if aR and aM then
local aT=(aR=="Squircle-TL-BL"or aR=="Squircle-TR-BR")and"Squircle"
or aR

aN:SetType(aT)
aE:SetType(aT)
aH:SetType(aT)

aK:SetType(aT)

ApplyNativeCorners(aS)
end
end
end





return aj
end end function a.J()

local aa=a.load'd'
local ab=aa.New

local ad={}

local ae=a.load'n'.New

function ad.New(af,ag)
ag.Hover=false
ag.TextOffset=0
ag.ParentConfig=ag
ag.IsButtons=ag.Buttons and#ag.Buttons>0 and true or false

local ah={
__type="Paragraph",
Title=ag.Title or"Paragraph",
Desc=ag.Desc or nil,

Locked=ag.Locked or false,
}
local ai=a.load'I'(ag)

ah.ParagraphFrame=ai
if ag.Buttons and#ag.Buttons>0 then
local aj=ab("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=ai.UIElements.Container,
},{
ab("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
}),
})

for ak,al in next,ag.Buttons do
local am=ae(
al.Title,
al.Icon,
al.Callback,
al.Variant or"White",
aj,
nil,
nil,
ag.Window.NewElements and 999 or 10
)
am.Size=UDim2.new(1,0,0,38)

end
end

return ah.__type,ah
end

return ad end function a.K()

local aa=a.load'd'local ab=
aa.New
local ad=game:GetService"UserInputService"

local ae={}

local function NormalizeKey(af)
if typeof(af)=="EnumItem"then
return af.Name,af
end
if typeof(af)=="string"and Enum.KeyCode[af]then
return af,Enum.KeyCode[af]
end
return nil,nil
end

local function GetImageTarget(af)
if typeof(af)~="Instance"then
return nil
end

if af:IsA"ImageLabel"or af:IsA"ImageButton"then
return af
end

return af:FindFirstChildWhichIsA("ImageLabel",true)or af:FindFirstChildWhichIsA("ImageButton",true)
end

function ae.New(af,ag)
local ah,ai=
NormalizeKey(ag.Keybind or ag.KeyBind or ag.Shortcut or ag.Bind or ag.Hotkey)
local aj={
__type="Button",
Title=ag.Title or"Button",
Desc=ag.Desc or nil,
Icon=ag.Icon or"mouse-pointer-click",
IconThemed=ag.IconThemed or false,
IconColor=ag.IconColor or nil,
Color=ag.Color,
Justify=ag.Justify or"Between",
IconAlign=ag.IconAlign or"Right",
Locked=ag.Locked or false,
LockedTitle=ag.LockedTitle,
Golden=ag.Golden==true or ag.Premium==true,
Premium=ag.Premium==true or ag.Golden==true,
Keybind=ah,
KeyCode=ai,
Callback=ag.Callback or function()end,
UIElements={},
}

local ak=true

aj.ButtonFrame=a.load'I'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ag.Parent,




Window=ag.Window,
Color=aj.Color,
Justify=aj.Justify,
TextOffset=20,
Hover=true,
Scalable=true,
Tab=ag.Tab,
Index=ag.Index,
ElementTable=aj,
ParentConfig=ag,
Size=ag.Size,
Tags=ag.Tags,
Golden=aj.Golden,
Premium=aj.Premium,
}














aj.UIElements.ButtonIcon=aa.Image(
aj.Icon,
aj.Icon,
0,
ag.Window.Folder,
"Button",
not(aj.Color or aj.IconColor)and true or nil,
aj.IconThemed
)

aj.UIElements.ButtonIcon.Size=UDim2.new(0,20,0,20)
aj.UIElements.ButtonIcon.Parent=aj.Justify=="Between"and aj.ButtonFrame.UIElements.Main
or aj.ButtonFrame.UIElements.Container.TitleFrame
aj.UIElements.ButtonIcon.LayoutOrder=aj.IconAlign=="Left"and-99999 or 99999
aj.UIElements.ButtonIcon.AnchorPoint=Vector2.new(1,0.5)
aj.UIElements.ButtonIcon.Position=UDim2.new(1,0,0.5,0)

local al=GetImageTarget(aj.UIElements.ButtonIcon)
if al then
if aj.IconColor then
al.ImageColor3=aj.IconColor
elseif aj.Golden then
al.ImageColor3=Color3.fromRGB(255,222,105)
end
aj.ButtonFrame:Colorize(al,"ImageColor3")
end

function aj.Lock(am)
aj.Locked=true
ak=false
return aj.ButtonFrame:Lock(aj.LockedTitle)
end
function aj.Unlock(am)
aj.Locked=false
ak=true
return aj.ButtonFrame:Unlock()
end

if aj.Locked then
aj:Lock()
end

function aj.Press(am)
if ak then
task.spawn(function()
aa.SafeCallback(aj.Callback)
end)
end
end

aa.AddSignal(aj.ButtonFrame.UIElements.Main.MouseButton1Click,function()
aj:Press()
end)

if aj.KeyCode then
aa.AddSignal(ad.InputBegan,function(am,an)
if an or ad:GetFocusedTextBox()then
return
end
if am.UserInputType==Enum.UserInputType.Keyboard and am.KeyCode==aj.KeyCode then
aj:Press()
end
end)
end

return aj.__type,aj
end

return ae end function a.L()

local aa={}

local ab=a.load'd'
local ad=a.load'e'
local ae=ab.New

local af=game:GetService"UserInputService"

function aa.New(ag,ah,ai,aj,ak,al,am)
local an={
GlassSpritesheet={
Id="rbxassetid://77297718671545",
MirroredId="rbxassetid://92258969882244",
Size=Vector2.new(102,128),
Total=80,
Cols=10,
},
}

function an.GetGlassFrame(ao,ap:number):(string,Vector2,Vector2)
local aq=an.GlassSpritesheet
local ar:number

if ap<=0.4 then
ar=math.floor((ap/0.4)*(aq.Total-1))
elseif ap<0.6 then
ar=aq.Total-1
else
ar=math.floor(((ap-0.6)/0.4)*(aq.Total-1))
end

ar=math.clamp(ar,0,aq.Total-1)

local as=ap>=0.6
if as then
ar=(aq.Total-1)-ar
end

local at=as and aq.MirroredId or aq.Id

return at,aq.Size,Vector2.new((ar%aq.Cols)*aq.Size.X,math.floor(ar/aq.Cols)*aq.Size.Y)
end

local ao=12
local ap
if ah and ah~=""then
ap=ae("ImageLabel",{
Size=UDim2.new(0,13,0,13),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(ah)[1],
ImageRectOffset=ab.Icon(ah)[2].ImageRectPosition,
ImageRectSize=ab.Icon(ah)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local aq=ae("Frame",{
Size=UDim2.new(0,2,0,26),
BackgroundTransparency=1,
Parent=aj,
})

local ar=ab.NewRoundFrame(ao,"Squircle",{
ImageTransparency=0.85,
ThemeTag={
ImageColor3="Text",
},
Parent=aq,
Size=UDim2.new(0,al and(52)or(40.8),0,24),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(0,0,0.5,0),
Name="ToggleFrame",
},{
ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Toggle",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(ao,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ae("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
}),
}),


ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(0,al and 30 or 20,0,20),
Position=UDim2.new(0,2,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=1,
Name="Frame",
},{
ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Bar",
},{
ab.New("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(1,1,1),
Name="Highlight",
BackgroundTransparency=1,
},{
ab.NewRoundFrame(9999,"SquircleGlass",{
Size=UDim2.new(1,1,1,1),
ImageColor3=Color3.new(1,1,1),
Name="SquircleGlass",
ImageTransparency=0.5,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
}),
ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="GlassBackground",
ImageTransparency=0,
ThemeTag={
ImageColor3="ElementBackground",
},
ZIndex=-1,
}),
ae("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Glass",
ImageTransparency=0,
},{
ae("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),






ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="BarOverlay",
ThemeTag={
ImageColor3="ToggleBar",
},
ZIndex=999,
}),
}),
ap,
ae("UIScale",{
Scale=1,
}),
}),
}),
ae("TextButton",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Name="Hitbox",
Text="",
}),
})

local as
local at

local au=al and 30 or 20
local av=ar.Size.X.Offset

function an.Set(aw,ax,ay,az)
local aA=ax and UDim2.new(0,av-au-2,0.5,0)
or UDim2.new(0,2,0.5,0)

if not az then
ad.Play(
ar.Frame,
"Select",
{Position=aA},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Position"
)
if ax then
ab.SetThemeTag(ar.Frame.Bar.Highlight.Glass,{ImageColor3="Toggle"},0.15)

ad.Play(
ar.Frame.Bar.Highlight.Glass,
"Select",
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Glass"
)
else
ab.SetThemeTag(ar.Frame.Bar.Highlight.Glass,{ImageColor3="Text"},0.15)
ad.Play(
ar.Frame.Bar.Highlight.Glass,
"Select",
{ImageTransparency=0.85},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Glass"
)
end
else
ar.Frame.Position=aA
end

if ax then
ad.Play(ar.Layer,"Fast",{
ImageTransparency=0,
},nil,nil,"Layer")
ab.SetThemeTag(ar.Frame.Bar.Highlight.Glass,{ImageColor3="Toggle"},0.1)
ad.Play(
ar.Frame.Bar.Highlight.Glass,
"Fast",
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Glass"
)

if ap then
ad.Play(ap,"Fast",{
ImageTransparency=0,
},nil,nil,"Icon")
end

local aB,aC,aD=an:GetGlassFrame(1)

ar.Frame.Bar.Highlight.Glass.Image=aB
ar.Frame.Bar.Highlight.Glass.ImageRectSize=aC
ar.Frame.Bar.Highlight.Glass.ImageRectOffset=aD
else
ad.Play(ar.Layer,"Fast",{
ImageTransparency=1,
},nil,nil,"Layer")
ab.SetThemeTag(ar.Frame.Bar.Highlight.Glass,{ImageColor3="Text"},0.1)
ad.Play(
ar.Frame.Bar.Highlight.Glass,
"Fast",
{ImageTransparency=0.85},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Glass"
)

if ap then
ad.Play(ap,"Fast",{
ImageTransparency=1,
},nil,nil,"Icon")
end

local aB,aC,aD=an:GetGlassFrame(0)

ar.Frame.Bar.Highlight.Glass.Image=aB
ar.Frame.Bar.Highlight.Glass.ImageRectSize=aC
ar.Frame.Bar.Highlight.Glass.ImageRectOffset=aD
end

ay=ay~=false

task.spawn(function()
if ak and ay then
ab.SafeCallback(ak,ax)
end
end)
end

function an.Animate(aw,ax,ay)
if not am.Window.IsToggleDragging then
am.Window.IsToggleDragging=true

local az=ax.Position.X
local aA=ax.Position.Y
local aB=ar.Frame.Position.X.Offset
local aC=false
local aD=false

ad.Play(
ar.Frame.Bar.UIScale,
"Focus",
{Scale=1.5},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Press"
)
ad.Play(
ar.Frame.Bar.Highlight.BarOverlay,
"Focus",
{ImageTransparency=0.86},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Press"
)

if as then
as:Disconnect()
end

as=af.InputChanged:Connect(function(aE)
if not am.Window.IsToggleDragging then
return
end
if
aE.UserInputType~=Enum.UserInputType.MouseMovement
and aE.UserInputType~=Enum.UserInputType.Touch
then
return
end
if aC then
return
end

local aF=math.abs(aE.Position.X-az)
math.abs(aE.Position.Y-aA)

if not aD and aF>8 then
aD=true
end

local aG=aE.Position.X-az
local aH=math.max(2,math.min(aB+aG,av-au-2))

local aI=math.clamp((aH-2)/(av-au-4),0,1)

local aJ,aK,aL=an:GetGlassFrame(aI)
ar.Frame.Bar.Highlight.Glass.Image=aJ
ar.Frame.Bar.Highlight.Glass.ImageRectSize=aK
ar.Frame.Bar.Highlight.Glass.ImageRectOffset=aL

ar.Frame.Position=UDim2.new(0,aH,0.5,0)
end)

if at then
at:Disconnect()
end

at=af.InputEnded:Connect(function(aE)
if not am.Window.IsToggleDragging then
return
end
if
aE.UserInputType~=Enum.UserInputType.MouseButton1
and aE.UserInputType~=Enum.UserInputType.Touch
then
return
end

am.Window.IsToggleDragging=false

if as then
as:Disconnect()
as=nil
end
if at then
at:Disconnect()
at=nil
end

am.WindUI.CurrentInput=nil

if aC then
return
end

if not aD then
ay:Set(not ay.Value,true,false)
else
local aF=ar.Frame.Position.X.Offset
local aG=aF+au/2
local aH=aG>av/2
ay:Set(aH,true,false)
end

ad.Play(
ar.Frame.Bar.UIScale,
"Focus",
{Scale=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Press"
)
ad.Play(
ar.Frame.Bar.Highlight.BarOverlay,
"Focus",
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Press"
)
end)
end
end

return aq,an
end

return aa end function a.M()

local aa={}

local ab=a.load'd'
local ad=a.load'e'local ae=
ab.New


function aa.New(af,ag,ah,ai,aj,ak)
local al={}

ag=ag or"sfsymbols:checkmark"

local am=9

local an=ab.Image(
ag,
ag,
0,
(ak and ak.Window.Folder or"Temp"),
"Checkbox",
true,
false,
"CheckboxIcon"
)
an.Size=UDim2.new(1,-26+ah,1,-26+ah)
an.AnchorPoint=Vector2.new(0.5,0.5)
an.Position=UDim2.new(0.5,0,0.5,0)


local ao=ab.NewRoundFrame(am,"Squircle",{
ImageTransparency=.85,
ThemeTag={
ImageColor3="Text"
},
Parent=ai,
Size=UDim2.new(0,26,0,26),
},{
ab.NewRoundFrame(am,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Checkbox",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(am,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ThemeTag={
ImageColor3="CheckboxBorder",
ImageTransparency="CheckboxBorderTransparency",
},
},{







}),

an,
},true)

function al.Set(ap,aq)
if aq then
ad.Play(ao.Layer,"Fast",{
ImageTransparency=0,
},nil,nil,"State")



ad.Play(an.ImageLabel,"Fast",{
ImageTransparency=0,
},nil,nil,"State")
else
ad.Play(ao.Layer,"Fast",{
ImageTransparency=1,
},nil,nil,"State")



ad.Play(an.ImageLabel,"Fast",{
ImageTransparency=1,
},nil,nil,"State")
end

task.spawn(function()
if aj then
ab.SafeCallback(aj,aq)
end
end)
end

return ao,al
end


return aa end function a.N()

local aa=a.load'd'local ab=
aa.New local ad=
aa.Tween
local ae=game:GetService"UserInputService"

local af=a.load'L'.New
local ag=a.load'M'.New

local ah={}

local function NormalizeKey(ai)
if typeof(ai)=="EnumItem"then
return ai.Name,ai
end
if typeof(ai)=="string"and Enum.KeyCode[ai]then
return ai,Enum.KeyCode[ai]
end
return nil,nil
end

function ah.New(ai,aj)
local ak,al=
NormalizeKey(aj.Keybind or aj.KeyBind or aj.Shortcut or aj.Bind or aj.Hotkey)
local am={
__type="Toggle",
Title=aj.Title or"Toggle",
Desc=aj.Desc or nil,
Locked=aj.Locked or false,
LockedTitle=aj.LockedTitle,
Value=aj.Value,
Icon=aj.Icon or nil,
IconSize=aj.IconSize or 23,
Type=aj.Type or"Toggle",
Keybind=ak,
KeyCode=al,
Callback=aj.Callback or function()end,
UIElements={},
}
am.ToggleFrame=a.load'I'{
Title=am.Title,
Desc=am.Desc,




Window=aj.Window,
Parent=aj.Parent,
TextOffset=(52),
Hover=false,
Tab=aj.Tab,
Index=aj.Index,
ElementTable=am,
ParentConfig=aj,
Tags=aj.Tags,
}

local an=true

if am.Value==nil then
am.Value=false
end

function am.Lock(ao)
am.Locked=true
an=false
return am.ToggleFrame:Lock(am.LockedTitle)
end
function am.Unlock(ao)
am.Locked=false
an=true
return am.ToggleFrame:Unlock()
end

if am.Locked then
am:Lock()
end

local ao=am.Value

local ap,aq
if am.Type=="Toggle"then
ap,aq=af(
ao,
am.Icon,
am.IconSize,
am.ToggleFrame.UIElements.Main,
am.Callback,
aj.Window.NewElements,
aj
)
elseif am.Type=="Checkbox"then
ap,aq=ag(
ao,
am.Icon,
am.IconSize,
am.ToggleFrame.UIElements.Main,
am.Callback,
aj
)
else
error("Unknown Toggle Type: "..tostring(am.Type))
end

ap.AnchorPoint=Vector2.new(1,aj.Window.NewElements and 0 or 0.5)
ap.Position=UDim2.new(1,0,aj.Window.NewElements and 0 or 0.5,0)

function am.Set(ar,as,at,au)
if an then
aq:Set(as,at,au or false)
ao=as
am.Value=as
end
end

function am.Toggle(ar,as,at)
am:Set(not am.Value,as,at or aj.Window.NewElements)
end

am:Set(ao,false,aj.Window.NewElements)

local ar=aj.WindUI.GenerateGUID()

if aj.Window.NewElements and aq.Animate then
if am.Type=="Toggle"then
aa.AddSignal(ap.ToggleFrame.Hitbox.InputBegan,function(as)
if
not aj.Window.IsToggleDragging
and(
as.UserInputType==Enum.UserInputType.MouseButton1
or as.UserInputType==Enum.UserInputType.Touch
)
then
if aj.WindUI.CurrentInput and aj.WindUI.CurrentInput~=ar then
return
end

aj.WindUI.CurrentInput=ar
aq:Animate(as,am)
end
end)
end





else
if am.Type=="Toggle"then
aa.AddSignal(ap.ToggleFrame.Hitbox.MouseButton1Click,function()
am:Toggle(nil,aj.Window.NewElements)
end)
elseif am.Type=="Checkbox"then
aa.AddSignal(ap.MouseButton1Click,function()
am:Toggle(nil,aj.Window.NewElements)
end)
end
end

if am.KeyCode then
aa.AddSignal(ae.InputBegan,function(as,at)
if at or ae:GetFocusedTextBox()then
return
end
if as.UserInputType==Enum.UserInputType.Keyboard and as.KeyCode==am.KeyCode then
am:Toggle(nil,aj.Window.NewElements)
end
end)
end

return am.__type,am
end

return ah end function a.O()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ad=aa(game:GetService"UserInputService")
local ae=aa(game:GetService"RunService")

local af=a.load'd'
local ag=a.load'e'
local ah=af.New

local ai={}

local aj=false

function ai.New(ak,al)
local am={
__type="Slider",
Title=al.Title or nil,
Desc=al.Desc or nil,
Locked=al.Locked or nil,
LockedTitle=al.LockedTitle,
Value=al.Value or{},
Icons=al.Icons or nil,
IsTooltip=al.IsTooltip or false,
IsTextbox=al.IsTextbox,
Step=al.Step or 1,
Callback=al.Callback or function()end,
UIElements={},
IsFocusing=false,

Width=al.Width or 130,
TextBoxWidth=al.Window.NewElements and 40 or 30,
ThumbSize=13,
IconSize=26,
}
if am.Icons=={}then
am.Icons={
From="sfsymbols:sunMinFill",
To="sfsymbols:sunMaxFill",
}
end
if am.IsTextbox==nil and am.Title==nil then
am.IsTextbox=false
else
am.IsTextbox=am.IsTextbox~=false
end

local an
local ao
local ap
local aq=am.Value.Default or am.Value.Min or 0

local ar=aq
local as=(aq-(am.Value.Min or 0))/((am.Value.Max or 100)-(am.Value.Min or 0))

local at=true
local au=am.Step%1~=0

local function FormatValue(av)
if au then
return tonumber(string.format("%.2f",av))
end
return math.floor(av+0.5)
end

local function CalculateValue(av)
if au then
return math.floor(av/am.Step+0.5)*am.Step
else
return math.floor(av/am.Step+0.5)*am.Step
end
end

local av,aw
local ax=32
if am.Icons then
if am.Icons.From then
av=af.Image(
am.Icons.From,
am.Icons.From,
0,
al.Window.Folder,
"SliderIconFrom",
true,
true,
"SliderIconFrom"
)
av.Size=UDim2.new(0,am.IconSize,0,am.IconSize)
ax=ax+am.IconSize-2
end
if am.Icons.To then
aw=af.Image(
am.Icons.To,
am.Icons.To,
0,
al.Window.Folder,
"SliderIconTo",
true,
true,
"SliderIconTo"
)
aw.Size=UDim2.new(0,am.IconSize,0,am.IconSize)
ax=ax+am.IconSize-2
end
end
am.SliderFrame=a.load'I'{
Title=am.Title,
Desc=am.Desc,
Parent=al.Parent,
TextOffset=am.Width,
Hover=false,
Tab=al.Tab,
Index=al.Index,
Window=al.Window,
ElementTable=am,
ParentConfig=al,
Tags=al.Tags,
}

am.UIElements.SliderIcon=af.NewRoundFrame(99,"Squircle",{
ImageTransparency=0.95,
Size=UDim2.new(1,not am.IsTextbox and-ax or(-am.TextBoxWidth-8),0,4),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
af.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(as,0,1,0),
ImageTransparency=0.1,
ThemeTag={
ImageColor3="Slider",
},
},{
af.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(
0,
al.Window.NewElements and(am.ThumbSize*2)or(am.ThumbSize+2),
0,
al.Window.NewElements and(am.ThumbSize+4)or(am.ThumbSize+2)
),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="SliderThumb",
},
Name="Thumb",
},{
af.NewRoundFrame(999,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
Name="Highlight",
ImageTransparency=0.5,
}),
}),
}),
})

am.UIElements.SliderContainer=ah("Frame",{
Size=UDim2.new(am.Title==nil and 1 or 0,am.Title==nil and 0 or am.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,am.IsTextbox and(al.Window.NewElements and-16 or 0)or 0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Parent=am.SliderFrame.UIElements.Main,
},{
ah("UIListLayout",{
Padding=UDim.new(0,am.Title~=nil and 8 or 12),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=am.Icons
and(am.Icons.From and(am.Icons.To and"Center"or"Left")or am.Icons.To and"Right")
or"Center",
}),
av,
am.UIElements.SliderIcon,
aw,
ah("TextBox",{
Size=UDim2.new(0,am.TextBoxWidth,0,0),
TextXAlignment="Left",
Text=FormatValue(aq),
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
Visible=am.IsTextbox,
}),
})

local ay
if am.IsTooltip then
ay=a.load'G'.New(
aq,
am.UIElements.SliderIcon.Frame.Thumb,
true,
"Secondary",
"Small",
false
)
ay.Container.AnchorPoint=Vector2.new(0.5,1)
ay.Container.Position=UDim2.new(0.5,0,0,-8)
end

local function SetFillSize(az,aA)
local aB=UDim2.new(az,0,1,0)
if aA==0 or not ag.ShouldAnimate(al)then
am.UIElements.SliderIcon.Frame.Size=aB
else
ag.Play(am.UIElements.SliderIcon.Frame,aA or"Fast",{Size=aB},nil,nil,"Fill")
end
end

function am.Lock(az)
am.Locked=true
at=false
return am.SliderFrame:Lock(am.LockedTitle)
end
function am.Unlock(az)
am.Locked=false
at=true
return am.SliderFrame:Unlock()
end

if am.Locked then
am:Lock()
end


local az=al.Tab.UIElements.ContainerFrame

function am.Set(aA,aB,aC)
if at then
if
not am.IsFocusing
and not aj
and(
not aC
or(
aC.UserInputType==Enum.UserInputType.MouseButton1
or aC.UserInputType==Enum.UserInputType.Touch
)
)
then
if aC then
an=(aC.UserInputType==Enum.UserInputType.Touch)
az.ScrollingEnabled=false
aj=true

local aD=an and aC.Position.X or ad:GetMouseLocation().X
local aE=math.clamp(
(aD-am.UIElements.SliderIcon.AbsolutePosition.X)
/am.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
aB=CalculateValue(am.Value.Min+aE*(am.Value.Max-am.Value.Min))
aB=math.clamp(aB,am.Value.Min or 0,am.Value.Max or 100)

if aB~=ar then
SetFillSize(aE,0)
am.UIElements.SliderContainer.TextBox.Text=FormatValue(aB)
if ay then
ay.TitleFrame.Text=FormatValue(aB)
end
am.Value.Default=FormatValue(aB)
ar=aB
af.SafeCallback(am.Callback,FormatValue(aB))
end

ao=ae.RenderStepped:Connect(function()
local aF=an and aC.Position.X or ad:GetMouseLocation().X
local aG=math.clamp(
(aF-am.UIElements.SliderIcon.AbsolutePosition.X)
/am.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
aB=CalculateValue(am.Value.Min+aG*(am.Value.Max-am.Value.Min))

if aB~=ar then
SetFillSize(aG,0)
am.UIElements.SliderContainer.TextBox.Text=FormatValue(aB)
if ay then
ay.TitleFrame.Text=FormatValue(aB)
end
am.Value.Default=FormatValue(aB)
ar=aB
af.SafeCallback(am.Callback,FormatValue(aB))
end
end)


ap=ad.InputEnded:Connect(function(aF)
if
(
aF.UserInputType==Enum.UserInputType.MouseButton1
or aF.UserInputType==Enum.UserInputType.Touch
)and aC==aF
then
ao:Disconnect()
ap:Disconnect()
aj=false
az.ScrollingEnabled=true

al.WindUI.CurrentInput=nil

if al.Window.NewElements then
ag.Play(am.UIElements.SliderIcon.Frame.Thumb,"Focus",{
ImageTransparency=0,
Size=UDim2.new(
0,
al.Window.NewElements and(am.ThumbSize*2)or(am.ThumbSize+2),
0,
al.Window.NewElements and(am.ThumbSize+4)or(am.ThumbSize+2)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Thumb")
end
if ay then
ay:Close(false)
end
end
end)
else
aB=math.clamp(aB,am.Value.Min or 0,am.Value.Max or 100)

local aD=math.clamp(
(aB-(am.Value.Min or 0))/((am.Value.Max or 100)-(am.Value.Min or 0)),
0,
1
)
aB=CalculateValue(am.Value.Min+aD*(am.Value.Max-am.Value.Min))

if aB~=ar then
SetFillSize(aD,"Fast")
am.UIElements.SliderContainer.TextBox.Text=FormatValue(aB)
if ay then
ay.TitleFrame.Text=FormatValue(aB)
end
am.Value.Default=FormatValue(aB)
ar=aB
af.SafeCallback(am.Callback,FormatValue(aB))
end
end
end
end
end

function am.SetMax(aA,aB)
am.Value.Max=aB

local aC=tonumber(am.Value.Default)or ar
if aC>aB then
am:Set(aB)
else
local aD=
math.clamp((aC-(am.Value.Min or 0))/(aB-(am.Value.Min or 0)),0,1)
SetFillSize(aD,"Fast")
end
end

function am.SetMin(aA,aB)
am.Value.Min=aB

local aC=tonumber(am.Value.Default)or ar
if aC<aB then
am:Set(aB)
else
local aD=math.clamp((aC-aB)/((am.Value.Max or 100)-aB),0,1)
SetFillSize(aD,"Fast")
end
end

af.AddSignal(am.UIElements.SliderContainer.TextBox.FocusLost,function(aA)
local aB=tonumber(am.UIElements.SliderContainer.TextBox.Text)
if aB then
am:Set(aB)
else
am.UIElements.SliderContainer.TextBox.Text=FormatValue(ar)
if ay then
ay.TitleFrame.Text=FormatValue(ar)
end
end
end)

local aA=al.WindUI.GenerateGUID()

af.AddSignal(am.UIElements.SliderContainer.InputBegan,function(aB)
if am.Locked or aj then
return
end
if
aB.UserInputType==Enum.UserInputType.MouseButton1
or aB.UserInputType==Enum.UserInputType.Touch
then
if al.WindUI.CurrentInput and al.WindUI.CurrentInput~=aA then
return
end
al.WindUI.CurrentInput=aA

am:Set(aq,aB)


if al.Window.NewElements then
ag.Play(am.UIElements.SliderIcon.Frame.Thumb,"Focus",{
ImageTransparency=0.85,
Size=UDim2.new(
0,
(al.Window.NewElements and(am.ThumbSize*2)or am.ThumbSize)+8,
0,
am.ThumbSize+8
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Thumb")
end
if ay then
ay:Open()
end

end
end)

return am.__type,am
end

return ai end function a.P()

local aa=a.load'd'
local ad=aa.New
local ae=aa.Tween

local af={}

local function ToFiniteNumber(ag)
local ah=tonumber(ag)
if ah==nil or ah~=ah or math.abs(ah)==math.huge then
return nil
end

return ah
end

local function FormatNumber(ag)
if ag%1==0 then
return tostring(ag)
end

return tostring(tonumber(string.format("%.2f",ag)))
end

function af.New(ag,ah)
local ai=typeof(ah.Value)=="table"and ah.Value or{}
local aj=ToFiniteNumber(ai.Min)or ToFiniteNumber(ah.Min)or 0
local ak=ToFiniteNumber(ai.Max)or ToFiniteNumber(ah.Max)or 100

if aj>ak then
aj,ak=ak,aj
end

local al=typeof(ah.Value)=="number"and ah.Value
or ToFiniteNumber(ai.Default)
or ToFiniteNumber(ah.Default)
or aj
al=ToFiniteNumber(al)or aj

local am=ah.Indeterminate==true

local an=ah.ShowValue
if an==nil then
an=not am
end

local ao=math.max(ToFiniteNumber(ah.ValueWidth)or 44,0)

local ap={
__type="ProgressBar",
Title=ah.Title or"Progress",
Desc=ah.Desc or nil,
Value={
Min=aj,
Max=ak,
Default=math.clamp(al,aj,ak),
},
ShowValue=an,
DisplayMode=ah.DisplayMode or"Percent",
Format=ah.Format,
Animate=ah.Animate~=false,
AnimationDuration=math.max(ToFiniteNumber(ah.AnimationDuration)or 0.15,0),
Indeterminate=am,
IndeterminateText=ah.IndeterminateText or"",
Speed=math.max(ToFiniteNumber(ah.Speed)or 1,0.01),
ControlGap=math.max(ToFiniteNumber(ah.ControlGap)or 16,0),
UIElements={},

Width=math.max(ToFiniteNumber(ah.Width)or 160,0),
ValueWidth=ao,
}

local function GetRatio(aq)
if ap.Value.Max==ap.Value.Min then
return aq>=ap.Value.Max and 1 or 0
end

return math.clamp((aq-ap.Value.Min)/(ap.Value.Max-ap.Value.Min),0,1)
end

local function GetValueText(aq,ar)
if ap.Indeterminate then
return tostring(ap.IndeterminateText)
end

local as=ar*100

if typeof(ap.Format)=="function"then
local at,au=
pcall(ap.Format,aq,as,ap.Value.Min,ap.Value.Max)

if at and au~=nil then
return tostring(au)
end
end

if ap.DisplayMode=="Value"then
return FormatNumber(aq)
elseif ap.DisplayMode=="Fraction"then
return FormatNumber(aq).."/"..FormatNumber(ap.Value.Max)
end

return tostring(math.floor(as+0.5)).."%"
end

ap.ProgressBarFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ah.Parent,
TextOffset=ap.Width+ap.ControlGap,
Hover=false,
Tab=ah.Tab,
Index=ah.Index,
Window=ah.Window,
ElementTable=ap,
ParentConfig=ah,
Tags=ah.Tags,
}

ap.UIElements.Fill=aa.NewRoundFrame(99,"Squircle",{
Name="Fill",
Size=ap.Indeterminate and UDim2.new(0.3,0,1,0)
or UDim2.new(GetRatio(ap.Value.Default),0,1,0),
Position=ap.Indeterminate and UDim2.new(-0.3,0,0,0)or UDim2.new(0,0,0,0),
ThemeTag={
ImageColor3="ProgressBar",
},
})

ap.UIElements.Bar=aa.NewRoundFrame(99,"Squircle",{
Name="Bar",
Size=UDim2.new(1,ap.ShowValue and-(ap.ValueWidth+8)or 0,0,6),
ClipsDescendants=true,
ImageTransparency=0.9,
ThemeTag={
ImageColor3="ProgressBarTrack",
ImageTransparency="ProgressBarTrackTransparency",
},
},{
ap.UIElements.Fill,
})

ap.UIElements.Value=ad("TextLabel",{
Name="Value",
Size=UDim2.new(0,ap.ValueWidth,0,20),
BackgroundTransparency=1,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
Text=GetValueText(ap.Value.Default,GetRatio(ap.Value.Default)),
TextSize=14,
TextTransparency=0.25,
TextTruncate="AtEnd",
TextXAlignment="Right",
Visible=ap.ShowValue,
ThemeTag={
TextColor3="ProgressBarText",
},
})

ap.UIElements.Container=ad("Frame",{
Name="ProgressBarContainer",
Size=UDim2.new(0,ap.Width,0,36),
Position=UDim2.new(1,0,ah.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ah.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=ap.ProgressBarFrame.UIElements.Main,
},{
ad("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Right",
VerticalAlignment="Center",
}),
ap.UIElements.Bar,
ap.UIElements.Value,
})

if ap.Indeterminate then
local aq=ae(
ap.UIElements.Fill,
1/ap.Speed,
{Position=UDim2.new(1,0,0,0)},
Enum.EasingStyle.Linear,
Enum.EasingDirection.InOut,-1

)
aa.AddSignal(ap.UIElements.Bar.Destroying,function()
aq:Cancel()
end)
aq:Play()
end

local function Update(aq,ar)
local as=ToFiniteNumber(aq)
if as==nil then
return ap.Value.Default
end

as=math.clamp(as,ap.Value.Min,ap.Value.Max)
ap.Value.Default=as

local at=GetRatio(as)
local au=UDim2.new(at,0,1,0)

if ap.UIElements.Fill and not ap.Indeterminate then
if ar or not ap.Animate or ap.AnimationDuration<=0 then
ap.UIElements.Fill.Size=au
else
ae(
ap.UIElements.Fill,
ap.AnimationDuration,
{Size=au},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end

ap.UIElements.Value.Text=GetValueText(as,at)

return as
end

function ap.Set(aq,ar)
return Update(ar,false)
end

function ap.Get(aq)
return ap.Value.Default
end

function ap.GetPercentage(aq)
return GetRatio(ap.Value.Default)*100
end

function ap.SetRange(aq,ar,as)
ar=ToFiniteNumber(ar)
as=ToFiniteNumber(as)

if ar==nil or as==nil then
return ap.Value.Min,ap.Value.Max
end

if ar>as then
ar,as=as,ar
end

ap.Value.Min=ar
ap.Value.Max=as
Update(ap.Value.Default,false)

return ar,as
end

function ap.SetMin(aq,ar)
ar=ToFiniteNumber(ar)
if ar==nil then
return ap.Value.Min
end

ap:SetRange(ar,math.max(ar,ap.Value.Max))
return ap.Value.Min
end

function ap.SetMax(aq,ar)
ar=ToFiniteNumber(ar)
if ar==nil then
return ap.Value.Max
end

ap:SetRange(math.min(ap.Value.Min,ar),ar)
return ap.Value.Max
end

Update(ap.Value.Default,true)

return ap.__type,ap
end

return af end function a.Q()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ad=aa(game:GetService"UserInputService")

local ae=a.load'd'
local af=ae.New local ag=
ae.Tween

local ah={
UICorner=6,
UIPadding=8,
}

local ai=a.load'y'.New

function ah.New(aj,ak)
local function NormalizeKeyCode(al)
if typeof(al)=="EnumItem"then
return al.Name
elseif type(al)=="string"then
return al
else
return"F"
end
end

local al={
__type="Keybind",
Title=ak.Title or"Keybind",
Desc=ak.Desc or nil,
Locked=ak.Locked or false,
LockedTitle=ak.LockedTitle,
Value=NormalizeKeyCode(ak.Value)or"F",
Callback=ak.Callback or function()end,
CanChange=ak.CanChange~=false,
Blacklist=ak.Blacklist or{},
Picking=false,
UIElements={},
}

local am={}

for an,ao in next,al.Blacklist do
table.insert(am,Enum.KeyCode[NormalizeKeyCode(ao)])
end
table.insert(am,Enum.KeyCode[NormalizeKeyCode"Escape"])

local an=true

al.KeybindFrame=a.load'I'{
Title=al.Title,
Desc=al.Desc,
Parent=ak.Parent,
TextOffset=85,
Hover=al.CanChange,
Tab=ak.Tab,
Index=ak.Index,
Window=ak.Window,
ElementTable=al,
ParentConfig=ak,
Tags=ak.Tags,
}

al.UIElements.Keybind=ai(
al.Value,
nil,
al.KeybindFrame.UIElements.Main,
nil,
ak.Window.NewElements and 12 or 10
)

al.UIElements.Keybind.Size=
UDim2.new(0,24+al.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
al.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
al.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)
al.UIElements.Keybind.Interactable=false

af("UIScale",{
Parent=al.UIElements.Keybind,
Scale=0.85,
})

ae.AddSignal(
al.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",
function()
al.UIElements.Keybind.Size=
UDim2.new(0,24+al.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
end
)

function al.Lock(ao)
al.Locked=true
an=false
return al.KeybindFrame:Lock(al.LockedTitle)
end
function al.Unlock(ao)
al.Locked=false
an=true
return al.KeybindFrame:Unlock()
end

function al.Set(ao,ap)
local aq=NormalizeKeyCode(ap)
al.Value=aq
al.UIElements.Keybind.Frame.Frame.TextLabel.Text=aq
end

if al.Locked then
al:Lock()
end

local ao

ae.AddSignal(al.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if an then
if al.CanChange then
al.Picking=true
al.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."



local ap
ap=ad.InputBegan:Connect(function(aq)
local ar

if aq.UserInputType==Enum.UserInputType.Keyboard then
if table.find(am,aq.KeyCode)then
ar=nil
return
else
ar=aq.KeyCode.Name
end
elseif
aq.UserInputType==Enum.UserInputType.MouseButton1
and not table.find(am,"MouseLeftButton")
then
ar="MouseLeftButton"
elseif
aq.UserInputType==Enum.UserInputType.MouseButton2
and not table.find(am,"MouseRightButton")
then
ar="MouseRightButton"
end

if ao then
ao:Disconnect()
end

ao=ad.InputEnded:Connect(function(as)
if
ar
and(
as.KeyCode.Name==ar
or ar=="MouseLeft"and as.UserInputType==Enum.UserInputType.MouseButton1
or ar=="MouseRight"and as.UserInputType==Enum.UserInputType.MouseButton2
)
then
al.Picking=false

al.UIElements.Keybind.Frame.Frame.TextLabel.Text=ar
al.Value=ar

ap:Disconnect()
ao:Disconnect()
end
end)
end)
end
end
end)

ae.AddSignal(ad.InputBegan,function(ap,aq)
if ad:GetFocusedTextBox()then
return
end
if not an then
return
end
if al.Picking then
return
end

if ap.UserInputType==Enum.UserInputType.Keyboard then
if ap.KeyCode.Name==al.Value then
ae.SafeCallback(al.Callback,ap.KeyCode.Name)
end
elseif ap.UserInputType==Enum.UserInputType.MouseButton1 and al.Value=="MouseLeft"then
ae.SafeCallback(al.Callback,"MouseLeft")
elseif ap.UserInputType==Enum.UserInputType.MouseButton2 and al.Value=="MouseRight"then
ae.SafeCallback(al.Callback,"MouseRight")
end
end)

return al.__type,al
end

return ah end function a.R()

local aa=a.load'd'local ad=
aa.New local ae=
aa.Tween

local af={
UICorner=8,
UIPadding=8,
}local ag=a.load'n'

.New
local ah=a.load'o'.New

function af.New(ai,aj)
local ak={
__type="Input",
Title=aj.Title or"Input",
Desc=aj.Desc or nil,
Type=aj.Type or"Input",
Locked=aj.Locked or false,
LockedTitle=aj.LockedTitle,
InputIcon=aj.InputIcon or false,
Placeholder=aj.Placeholder or"Enter Text...",
Value=aj.Value or"",
Callback=aj.Callback or function()end,
ClearTextOnFocus=aj.ClearTextOnFocus or false,
UIElements={},

Width=150,
}

local al=true

ak.InputFrame=a.load'I'{
Title=ak.Title,
Desc=ak.Desc,
Parent=aj.Parent,
TextOffset=ak.Width,
Hover=false,
Tab=aj.Tab,
Index=aj.Index,
Window=aj.Window,
ElementTable=ak,
ParentConfig=aj,
Tags=aj.Tags,
}

local am=ah(
ak.Placeholder,
ak.InputIcon,
ak.Type=="Textarea"and ak.InputFrame.UIElements.Container or ak.InputFrame.UIElements.Main,
ak.Type,
function(am)
ak:Set(am,true)
end,
nil,
aj.Window.NewElements and 12 or 10,
ak.ClearTextOnFocus
)

if ak.Type~="Textarea"then
am.Size=UDim2.new(0,ak.Width,0,36)
am.Position=UDim2.new(1,0,aj.Window.NewElements and 0 or 0.5,0)
am.AnchorPoint=Vector2.new(1,aj.Window.NewElements and 0 or 0.5)
else
am.Size=UDim2.new(1,0,0,148)
end






function ak.Lock(an)
ak.Locked=true
al=false
return ak.InputFrame:Lock(ak.LockedTitle)
end
function ak.Unlock(an)
ak.Locked=false
al=true
return ak.InputFrame:Unlock()
end

function ak.Set(an,ao,ap)
if al then
ak.Value=ao
aa.SafeCallback(ak.Callback,ao)

if not ap then
am.Frame.Frame.TextBox.Text=ao
end
end
end

function ak.SetPlaceholder(an,ao)
am.Frame.Frame.TextBox.PlaceholderText=ao
ak.Placeholder=ao
end

ak:Set(ak.Value)

if ak.Locked then
ak:Lock()
end

return ak.__type,ak
end

return af end function a.S()

local aa=a.load'd'
local af=aa.New

local ag={}

function ag.New(ah,ai)
local aj=af("Frame",{
Size=ai.ParentType~="Group"and UDim2.new(1,0,0,1)or UDim2.new(0,1,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local ak=af("Frame",{
Parent=ai.Parent,
Size=ai.ParentType~="Group"and UDim2.new(1,-7,0,7)or UDim2.new(0,7,1,-7),
BackgroundTransparency=1,
},{
aj
})

return"Divider",{__type="Divider",ElementFrame=ak}
end

return ag end function a.T()
local aa={}

local af=(cloneref or clonereference or function(af)
return af
end)

local ag=af(game:GetService"UserInputService")
local ah=af(game:GetService"Players").LocalPlayer:GetMouse()
local ai=af(game:GetService"Workspace")
local aj=ai.CurrentCamera local ak=

workspace.CurrentCamera

local al=a.load'd'
local am=a.load'e'
local an=al.New
local ao=al.Tween

local ap=0.76

function aa.New(aq,ar,as,at)
local au={}

if not ar.Callback then
at="Menu"
end

ar.UIElements.UIListLayout=an("UIListLayout",{
Padding=UDim.new(0,as.MenuPadding/1.5),
FillDirection="Vertical",
HorizontalAlignment="Center",
})

ar.UIElements.Menu=al.NewRoundFrame(as.MenuCorner,ar.Glass and"SquircleGlass"or"Squircle",{
ThemeTag={
ImageColor3="DropdownBackground",
},
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
an("UIPadding",{
PaddingTop=UDim.new(0,as.MenuPadding),
PaddingLeft=UDim.new(0,as.MenuPadding),
PaddingRight=UDim.new(0,as.MenuPadding),
PaddingBottom=UDim.new(0,as.MenuPadding),
}),
an("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,as.MenuPadding),
}),
an("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,ar.SearchBarEnabled and-as.MenuPadding-as.SearchBarHeight),

ClipsDescendants=true,
LayoutOrder=999,
Name="Frame",
},{
an("UICorner",{
CornerRadius=UDim.new(0,as.MenuCorner-as.MenuPadding),
}),
an("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
ar.UIElements.UIListLayout,
}),
}),
})

ar.UIElements.MenuCanvas=an("Frame",{
Size=UDim2.new(0,ar.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=aq.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
ar.UIElements.Menu,
an("UISizeConstraint",{
MinSize=Vector2.new(ar.Compact and 148 or 170,0),
MaxSize=Vector2.new(ar.MenuMaxWidth or 420,ar.MenuMaxHeight or 340),
}),
})

local function GetLayoutScale()
local av=aq.UIScale or al.UIScale or 1
return av>0 and av or 1
end

local function GetVisibleContentHeight()
local av=0
local aw=0
local ax=GetLayoutScale()
local ay=ar.UIElements.Menu.Frame.ScrollingFrame

for az,aA in next,ay:GetChildren()do
if aA:IsA"GuiObject"and aA.Visible then
local aB=aA.AbsoluteSize.Y/ax
if aB<=0 then
aB=aA.Size.Y.Offset>0 and aA.Size.Y.Offset or ar.ItemHeight
end

av+=aB
aw+=1
end
end

if aw>1 then
av+=ar.UIElements.UIListLayout.Padding.Offset*(aw-1)
end

return av
end

local function RecalculateCanvasSize()
ar.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,GetVisibleContentHeight())
end

local function GetDropdownButton()
return ar.UIElements.Dropdown or ar.DropdownFrame.UIElements.Main
end

local function GetViewportSize()
if aq.WindUI.DropdownGui and aq.WindUI.DropdownGui.AbsoluteSize.X>0 then
return aq.WindUI.DropdownGui.AbsoluteSize
end
local av=ai.CurrentCamera or aj
return av and av.ViewportSize or Vector2.new(1280,720)
end

local function GetInputPosition(av)
if av and typeof(av.Position)=="Vector3"then
return Vector2.new(av.Position.X,av.Position.Y)
end
return Vector2.new(ah.X,ah.Y)
end

local function ContainsPoint(av,aw)
if typeof(av)~="Instance"or not av.Visible then
return false
end

local ax=av.AbsolutePosition
local ay=av.AbsoluteSize

return aw.X>=ax.X
and aw.X<=ax.X+ay.X
and aw.Y>=ax.Y
and aw.Y<=ax.Y+ay.Y
end

local function NormalizeDirection(av,aw)
local ax=tostring(av or aw or"Auto")
ax=ax:sub(1,1):upper()..ax:sub(2):lower()
if ax~="Auto"and ax~="Down"and ax~="Up"and ax~="Left"and ax~="Right"then
return aw or"Auto"
end
return ax
end

local function NormalizeSide(av,aw)
local ax=tostring(av or aw or"Right")
ax=ax:sub(1,1):upper()..ax:sub(2):lower()
if ax~="Left"and ax~="Center"and ax~="Right"then
return aw or"Right"
end
return ax
end

local function IsMobileViewport()
local av=GetViewportSize()
return aq.Window.IsPC==false
or(ag.TouchEnabled and not ag.KeyboardEnabled)
or av.X<=640
end

local function GetCanvasWidth()
local av=GetDropdownButton()
local aw=GetViewportSize()
local ax=math.max(as.MenuPadding*2,8)
local ay=math.max(
120,
math.min(ar.MenuMaxWidth or(IsMobileViewport()and 320 or 420),aw.X-(ax*2))
)
local az=math.min(ar.Compact and 148 or 170,ay)
local aA=av.AbsoluteSize.X>0 and av.AbsoluteSize.X or ar.MenuWidth
local aB=ar.FullWidth and math.max(aA,ar.MenuWidth)or ar.MenuWidth

return math.floor(math.clamp(aB,az,ay)+0.5)
end

local function ApplyCanvasWidth()
local av=GetCanvasWidth()
ar.UIElements.MenuCanvas.Size=UDim2.new(
0,
av,
ar.UIElements.MenuCanvas.Size.Y.Scale,
ar.UIElements.MenuCanvas.Size.Y.Offset
)
end

local function RecalculateListSize()
ApplyCanvasWidth()

local av=GetViewportSize()
local aw=ar.SearchBarEnabled and(as.SearchBarHeight+44)or 44
local ax=math.max(
aw,
math.min(ar.MenuMaxHeight or(IsMobileViewport()and 280 or 340),av.Y-(as.MenuPadding*4))
)

local ay=GetVisibleContentHeight()
local az=ar.SearchBarEnabled and(as.SearchBarHeight+(as.MenuPadding*3))
or(as.MenuPadding*2)
local aA=ay+az

if aA>ax then
ar.UIElements.MenuCanvas.Size=
UDim2.fromOffset(ar.UIElements.MenuCanvas.AbsoluteSize.X,ax)
else
ar.UIElements.MenuCanvas.Size=
UDim2.fromOffset(ar.UIElements.MenuCanvas.AbsoluteSize.X,aA)
end
end

function UpdatePosition()
local av=GetDropdownButton()
local aw=ar.UIElements.MenuCanvas
local ax=GetViewportSize()
local ay=as.MenuPadding*2
local az=IsMobileViewport()
local aA=NormalizeDirection(az and(ar.MobileDirection or ar.Direction)or ar.Direction,"Auto")
local aB=NormalizeSide(az and(ar.MobileSide or"Center")or ar.Side,az and"Center"or"Right")
local aC=av.AbsolutePosition
local aD=av.AbsoluteSize
local aE=aw.AbsoluteSize

if aE.X<=0 or aE.Y<=0 then
aE=Vector2.new(aw.Size.X.Offset,aw.Size.Y.Offset)
end

if az and not ar.MobileDirection and(aA=="Left"or aA=="Right")then
aA="Auto"
end

if aA=="Left"and aC.X-ay<aE.X then
aA="Auto"
elseif aA=="Right"and ax.X-(aC.X+aD.X)-ay<aE.X then
aA="Auto"
end

if aA=="Auto"then
local aF=ax.Y-(aC.Y+aD.Y)-ay
local aG=aC.Y-ay
if aF>=aE.Y or aF>=aG then
aA="Down"
else
aA="Up"
end
end

if aA~="Up"and aA~="Left"and aA~="Right"then
aA="Down"
end

local aF
local aG
local aH=Vector2.new(1,0)

if aA=="Left"then
aF=aC.X-ay
aG=aC.Y
aH=Vector2.new(1,0)
elseif aA=="Right"then
aF=aC.X+aD.X+ay
aG=aC.Y
aH=Vector2.new(0,0)
elseif aA=="Up"then
aG=aC.Y-ay
aH=Vector2.new(aB=="Left"and 0 or aB=="Center"and 0.5 or 1,1)
if aB=="Left"then
aF=aC.X
elseif aB=="Center"then
aF=aC.X+(aD.X/2)
else
aF=aC.X+aD.X
end
else
aG=aC.Y+aD.Y+ay
aH=Vector2.new(aB=="Left"and 0 or aB=="Center"and 0.5 or 1,0)
if aB=="Left"then
aF=aC.X
elseif aB=="Center"then
aF=aC.X+(aD.X/2)
else
aF=aC.X+aD.X
end
end

local aI=aF-(aH.X*aE.X)
local aJ=aG-(aH.Y*aE.Y)

if aI<ay then
aF+=ay-aI
elseif aI+aE.X>ax.X-ay then
aF-=(aI+aE.X)-(ax.X-ay)
end

if aJ<ay then
aG+=ay-aJ
elseif aJ+aE.Y>ax.Y-ay then
aG-=(aJ+aE.Y)-(ax.Y-ay)
end

aw.AnchorPoint=aH
aw.Position=UDim2.fromOffset(math.floor(aF+0.5),math.floor(aG+0.5))
ar.UIElements.Menu.AnchorPoint=aA=="Left"and Vector2.new(1,0)
or aA=="Right"and Vector2.new(0,0)
or aA=="Up"and Vector2.new(1,1)
or Vector2.new(1,0)
ar.UIElements.Menu.Position=aA=="Left"and UDim2.new(1,0,0,0)
or aA=="Right"and UDim2.new(0,0,0,0)
or aA=="Up"and UDim2.new(1,0,1,0)
or UDim2.new(1,0,0,0)

return aA
end

local av
local aw=""
local ax
local ay

local function CreateSearchBar()
local az=math.max(as.MenuCorner-as.MenuPadding,6)
local aA=al.Icon"search"

ax=an("TextBox",{
Name="TextBox",
BackgroundTransparency=1,
ClearTextOnFocus=false,
ClipsDescendants=true,
FontFace=Font.new(al.Font,Enum.FontWeight.Regular),
PlaceholderText=ar.SearchPlaceholder,
Text=aw,
TextColor3=Color3.new(1,1,1),
TextSize=16,
TextScaled=false,
TextTruncate=Enum.TextTruncate.AtEnd,
TextWrapped=false,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Center,
ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
Size=UDim2.new(1,-31,1,0),
})

local aB=al.NewRoundFrame(az,"Squircle",{
Name="SearchBar",
LayoutOrder=0,
Parent=ar.UIElements.Menu,
Size=UDim2.new(1,0,0,as.SearchBarHeight),
ImageTransparency=0,
ThemeTag={
ImageColor3="DropdownTabBackground",
},
},{
al.NewRoundFrame(az,"Squircle",{
Name="Outline",
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.8,
ThemeTag={
ImageColor3="DropdownTabBorder",
},
}),
an("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
},{
an("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
an("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Left",
VerticalAlignment="Center",
Padding=UDim.new(0,8),
SortOrder=Enum.SortOrder.LayoutOrder,
}),
an("ImageLabel",{
Name="Icon",
BackgroundTransparency=1,
Image=aA[1],
ImageRectOffset=aA[2].ImageRectPosition,
ImageRectSize=aA[2].ImageRectSize,
ImageTransparency=0.18,
Size=UDim2.new(0,19,0,19),
ThemeTag={
ImageColor3="Icon",
},
}),
ax,
}),
})

al.AddSignal(ax:GetPropertyChangedSignal"Text",function()
ay(ax.Text)
end)

al.AddSignal(ax.Focused,function()
ao(aB.Outline,0.12,{ImageTransparency=0.48}):Play()
end)

al.AddSignal(ax.FocusLost,function()
ao(aB.Outline,0.12,{ImageTransparency=0.8}):Play()
end)

return aB
end

local function GetSearchText(az)
local aA={
az.Name,
az.Desc,
}

if typeof(az.Original)=="table"then
table.insert(aA,az.Original.Value)
table.insert(aA,az.Original.Id)
table.insert(aA,az.Original.Key)
end

local aB={}
for aC,aD in next,aA do
if aD~=nil then
table.insert(aB,tostring(aD))
end
end

return string.lower(table.concat(aB," "))
end

function ay(az)
aw=tostring(az or"")
local aA=string.lower(aw)

for aB,aC in next,ar.Tabs do
if aC.UIElements and aC.UIElements.TabItem then
local aD=aC.UIElements.TabItem
local aE=aA==""or string.find(GetSearchText(aC),aA,1,true)~=nil
if aE then
if not aD.Parent then
aD.Parent=ar.UIElements.Menu.Frame.ScrollingFrame
end
aD.Visible=true
aD.Size=aC.Size
aD.AutomaticSize=aC.AutomaticSize
else
aD.Visible=false
end
end
end

RecalculateCanvasSize()
RecalculateListSize()

if ar.UIElements.MenuCanvas.Visible then
UpdatePosition()
end

task.defer(function()
if aq.Window.Destroyed then
return
end

RecalculateCanvasSize()
RecalculateListSize()

if ar.UIElements.MenuCanvas.Visible then
UpdatePosition()
end
end)
end

function au.Display(az)
local aA=ar.Values
local aB=""

if ar.Multi then
local aC={}
if typeof(ar.Value)=="table"then
for aD,aE in ipairs(ar.Value)do
local aF=typeof(aE)=="table"and aE.Title or aE
aC[aF]=true
end
end

for aD,aE in ipairs(aA)do
local aF=typeof(aE)=="table"and aE.Title or aE
if aC[aF]then
aB=aB..aF..", "
end
end

if#aB>0 then
aB=aB:sub(1,#aB-2)
end
else
aB=typeof(ar.Value)=="table"and(ar.Value.Title or ar.Value[1])
or ar.Value
or""
end

if ar.UIElements.Dropdown then
ar.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(aB==""and"--"or aB)
end
end

local function Callback(az)
au:Display()
if ar.Locked then
return
end

if ar.Callback then
task.spawn(function()
if ar.Locked then
return
end
al.SafeCallback(ar.Callback,ar.Value)
end)
else
task.spawn(function()
if ar.Locked then
return
end
al.SafeCallback(az)
end)
end
end

function au.LockValues(az,aA)
if not aA then
return
end

for aB,aC in next,ar.Tabs do
if aC and aC.UIElements and aC.UIElements.TabItem then
local aD=aC.Name
local aE=false

for aF,aG in next,aA do
if aD==aG then
aE=true
break
end
end

if aE then
ao(aC.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

ao(aC.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.6}):Play()
if aC.UIElements.TabIcon then
ao(aC.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.6}):Play()
end

aC.UIElements.TabItem.Active=false
aC.Locked=true
else
if aC.Selected then
ao(aC.UIElements.TabItem,0.1,{ImageTransparency=ap}):Play()

ao(aC.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if aC.UIElements.TabIcon then
ao(aC.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
else
ao(aC.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

ao(
aC.UIElements.TabItem.Frame.Title.TextLabel,
0.1,
{TextTransparency=at=="Dropdown"and 0.4 or 0.05}
):Play()
if aC.UIElements.TabIcon then
ao(
aC.UIElements.TabIcon.ImageLabel,
0.1,
{ImageTransparency=at=="Dropdown"and 0.2 or 0}
):Play()
end
end

aC.UIElements.TabItem.Active=true
aC.Locked=false
end
end
end
end

function au.Refresh(az,aA)
if aq.Window.Destroyed then
return
end

for aB,aC in next,ar.Tabs do
if aC.UIElements and aC.UIElements.TabItem then
aC.UIElements.TabItem:Destroy()
end
end

for aB,aC in next,ar.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not aC:IsA"UIListLayout"then
aC:Destroy()
end
end

ar.Tabs={}

if ar.SearchBarEnabled then
if not av then
av=CreateSearchBar()
elseif ax then
ax.PlaceholderText=ar.SearchPlaceholder
end
end

for aB,aC in next,aA do
if typeof(aC)~="table"or aC.Type~="Divider"then
local aD={
Name=typeof(aC)=="table"and aC.Title or aC,
Desc=typeof(aC)=="table"and aC.Desc or nil,
Icon=typeof(aC)=="table"and aC.Icon or nil,
IconSize=typeof(aC)=="table"and aC.IconSize or nil,
Original=aC,
Selected=false,
Locked=typeof(aC)=="table"and aC.Locked or false,
UIElements={},
}
local aE
if aD.Icon then
aE=al.Image(aD.Icon,aD.Icon,0,aq.Window.Folder,"Dropdown",true)
aE.Size=
UDim2.new(0,aD.IconSize or as.TabIcon,0,aD.IconSize or as.TabIcon)
aE.ImageLabel.ImageTransparency=at=="Dropdown"and 0.2 or 0
aD.UIElements.TabIcon=aE
end
aD.UIElements.TabItem=al.NewRoundFrame(
as.MenuCorner-as.MenuPadding,
"Squircle",
{
Size=UDim2.new(1,0,0,ar.ItemHeight),
AutomaticSize=aD.Desc and"Y",
LayoutOrder=typeof(aB)=="number"and aB or 0,
ImageTransparency=1,
Parent=ar.UIElements.Menu.Frame.ScrollingFrame,

ThemeTag={
ImageColor3="DropdownTabBackground",
},
Active=not aD.Locked,
},
{
al.NewRoundFrame(as.MenuCorner-as.MenuPadding,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="DropdownTabBorder",
},
ImageTransparency=1,
Name="Highlight",
},{













}),
an("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
an("UIListLayout",{
Padding=UDim.new(0,as.TabPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
an("UIPadding",{
PaddingTop=UDim.new(0,as.TabPadding),
PaddingLeft=UDim.new(0,as.TabPadding),
PaddingRight=UDim.new(0,as.TabPadding),
PaddingBottom=UDim.new(0,as.TabPadding),
}),
an("UICorner",{
CornerRadius=UDim.new(0,as.MenuCorner-as.MenuPadding),
}),
aE,
an("Frame",{
Size=UDim2.new(1,aE and-as.TabPadding-as.TabIcon or 0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Name="Title",
},{
an("TextLabel",{
Text=aD.Name,
TextXAlignment="Left",
FontFace=Font.new(al.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text",
},
TextSize=14,
BackgroundTransparency=1,
TextTransparency=at=="Dropdown"and 0.4 or 0.05,
LayoutOrder=999,
AutomaticSize="Y",
TextTruncate="AtEnd",
Size=UDim2.new(1,0,0,0),
}),
an("TextLabel",{
Text=aD.Desc or"",
TextXAlignment="Left",
FontFace=Font.new(al.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text",
},
TextSize=13,
BackgroundTransparency=1,
TextTransparency=at=="Dropdown"and 0.6 or 0.35,
LayoutOrder=999,
AutomaticSize="Y",
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
Visible=aD.Desc and true or false,
Name="Desc",
}),
an("UIListLayout",{
Padding=UDim.new(0,as.TabPadding/3),
FillDirection="Vertical",
}),
}),
}),
},
true
)
aD.Size=aD.UIElements.TabItem.Size
aD.AutomaticSize=aD.UIElements.TabItem.AutomaticSize

if aD.Locked then
aD.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0.6
if aD.UIElements.TabIcon then
aD.UIElements.TabIcon.ImageLabel.ImageTransparency=0.6
end
end

if ar.Multi and typeof(ar.Value)=="string"then
for aF,aG in next,ar.Values do
if typeof(aG)=="table"then
if aG.Title==ar.Value then
ar.Value={aG}
end
else
if aG==ar.Value then
ar.Value={ar.Value}
end
end
end
end

if ar.Multi then
local aF=false
if typeof(ar.Value)=="table"then
for aG,aH in ipairs(ar.Value)do
local aI=typeof(aH)=="table"and aH.Title or aH
if aI==aD.Name then
aF=true
break
end
end
end
aD.Selected=aF
else
local aF=typeof(ar.Value)=="table"and ar.Value.Title or ar.Value
aD.Selected=aF==aD.Name
end

if aD.Selected and not aD.Locked then
aD.UIElements.TabItem.ImageTransparency=ap

aD.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0
if aD.UIElements.TabIcon then
aD.UIElements.TabIcon.ImageLabel.ImageTransparency=0
end
end

ar.Tabs[aB]=aD

au:Display()

if at=="Dropdown"then
al.AddSignal(aD.UIElements.TabItem.MouseButton1Click,function()
if ar.Locked or aD.Locked then
return
end

if ar.Multi then
if not aD.Selected then
aD.Selected=true
ao(
aD.UIElements.TabItem,
0.1,
{ImageTransparency=ap}
):Play()

ao(aD.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if aD.UIElements.TabIcon then
ao(aD.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
table.insert(ar.Value,aD.Original)
else
if not ar.AllowNone and#ar.Value==1 then
return
end
aD.Selected=false
ao(aD.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

ao(aD.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.4}):Play()
if aD.UIElements.TabIcon then
ao(aD.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
end

for aF,aG in next,ar.Value do
if typeof(aG)=="table"and(aG.Title==aD.Name)or(aG==aD.Name)then
table.remove(ar.Value,aF)
break
end
end
end
else
for aF,aG in next,ar.Tabs do
ao(aG.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

ao(
aG.UIElements.TabItem.Frame.Title.TextLabel,
0.1,
{TextTransparency=0.4}
):Play()
if aG.UIElements.TabIcon then
ao(aG.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
end
aG.Selected=false
end
aD.Selected=true
ao(aD.UIElements.TabItem,0.1,{ImageTransparency=ap}):Play()

ao(aD.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if aD.UIElements.TabIcon then
ao(aD.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
ar.Value=aD.Original
end
Callback()
if not ar.Multi then
au:Close()
end
end)
elseif at=="Menu"then
if not aD.Locked then
al.AddSignal(aD.UIElements.TabItem.MouseEnter,function()
ao(aD.UIElements.TabItem,0.08,{ImageTransparency=ap}):Play()
end)
al.AddSignal(aD.UIElements.TabItem.InputEnded,function()
ao(aD.UIElements.TabItem,0.08,{ImageTransparency=1}):Play()
end)
end
al.AddSignal(aD.UIElements.TabItem.MouseButton1Click,function()
if ar.Locked or aD.Locked then
return
end
Callback(aC.Callback or function()end)
au:Close()
end)
end

RecalculateCanvasSize()
RecalculateListSize()
else a.load'S'
:New{Parent=ar.UIElements.Menu.Frame.ScrollingFrame}
end
end










ApplyCanvasWidth()
ay(aw)
Callback()

ar.Values=aA
end

au:Refresh(ar.Values)

function au.Select(az,aA)
if aA then
ar.Value=aA
else
if ar.Multi then
ar.Value={}
else
ar.Value=nil
end
end
au:Refresh(ar.Values)
end

RecalculateListSize()
RecalculateCanvasSize()

local az=0
local aA="Down"

function au.Open(aB)
if not ar.Locked then
az+=1
local aC=az
ar.UIElements.Menu.Visible=true
ar.UIElements.MenuCanvas.Visible=true
ar.UIElements.MenuCanvas.Active=true
RecalculateListSize()
RecalculateCanvasSize()
aA=UpdatePosition()
local aD=aA=="Left"or aA=="Right"
ar.UIElements.Menu.Size=aD and UDim2.new(0,0,1,0)or UDim2.new(1,0,0,0)
am.Play(ar.UIElements.Menu,"DropdownOpen",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=ar.Glass and ar.GlassTransparency or 0,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out,"OpenClose")

task.spawn(function()
task.wait(am.GetDuration"DropdownOpen")
if ar.Locked or az~=aC then
return
end
ar.Opened=true
end)

UpdatePosition()
end
end

function au.Close(aB)
az+=1
local aC=az
ar.Opened=false

local aD=aA=="Left"or aA=="Right"
am.Play(ar.UIElements.Menu,"DropdownClose",{
Size=aD and UDim2.new(0,0,1,0)or UDim2.new(1,0,0,0),
ImageTransparency=1,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out,"OpenClose")

task.spawn(function()
task.wait(am.GetDuration"DropdownClose")
if az~=aC then
return
end
ar.UIElements.Menu.Visible=false
ar.UIElements.MenuCanvas.Visible=false
ar.UIElements.MenuCanvas.Active=false
end)
end

al.AddSignal(
(
ar.UIElements.Dropdown and ar.UIElements.Dropdown.MouseButton1Click
or ar.DropdownFrame.UIElements.Main.MouseButton1Click
),
function()
if ar.Opened or ar.UIElements.MenuCanvas.Visible then
au:Close()
else
au:Open()
end
end
)

al.AddSignal(ag.InputBegan,function(aB)
if
aB.UserInputType==Enum.UserInputType.MouseButton1
or aB.UserInputType==Enum.UserInputType.Touch
then
local aC=ar.UIElements.MenuCanvas
local aD=ar.UIElements.Dropdown or ar.DropdownFrame.UIElements.Main
local aE=GetInputPosition(aB)
local aF=ContainsPoint(aD,aE)
local aG=ContainsPoint(aC,aE)

if
aq.Window.CanDropdown
and(ar.Opened or aC.Visible)
and not aF
and not aG
then
au:Close()
end
end
end)

al.AddSignal(
ar.UIElements.Dropdown and ar.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition"
or ar.DropdownFrame.UIElements.Main:GetPropertyChangedSignal"AbsolutePosition",
UpdatePosition
)

if aq.WindUI.DropdownGui then
al.AddSignal(aq.WindUI.DropdownGui:GetPropertyChangedSignal"AbsoluteSize",function()
if ar.UIElements.MenuCanvas.Visible then
RecalculateListSize()
UpdatePosition()
end
end)
end

return au
end

return aa end function a.U()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")
aa(game:GetService"Players").LocalPlayer:GetMouse()local af=
aa(game:GetService"Workspace").CurrentCamera

local ag=a.load'd'
local ah=ag.New local ai=
ag.Tween

local aj=a.load'y'.New local ak=a.load'o'
.New
local al=a.load'T'.New local am=

workspace.CurrentCamera

local an={
UICorner=10,
UIPadding=12,
MenuCorner=14,
MenuPadding=4,
TabPadding=8,
SearchBarHeight=36,
TabIcon=16,
ItemHeight=32,
}

function an.New(ao,ap)
local aq=ap.Values or{}
local ar=ap.SearchBarEnabled
if ar==nil then
if ap.Search~=nil then
ar=ap.Search
elseif ap.EnableSearch~=nil then
ar=ap.EnableSearch
else
ar=#aq>=(ap.SearchThreshold or 7)
end
end

local as=ap.Compact~=false

local at={
__type="Dropdown",
Title=ap.Title or"Dropdown",
Desc=ap.Desc or nil,
Locked=ap.Locked or false,
LockedTitle=ap.LockedTitle,
Values=aq,
MenuWidth=ap.MenuWidth or(as and 164 or 180),
MenuMaxWidth=ap.MenuMaxWidth,
FullWidth=ap.FullWidth or ap.Full or ap.Mode=="Full"or ap.MenuMode=="Full",
Direction=ap.Direction or ap.OpenDirection or"Auto",
Side=ap.Side or ap.Align or ap.Alignment or"Right",
MobileDirection=ap.MobileDirection or ap.MobileOpenDirection,
MobileSide=ap.MobileSide or ap.MobileAlign,
Value=ap.Value,
AllowNone=ap.AllowNone,
SearchBarEnabled=ar==true,
SearchPlaceholder=ap.SearchPlaceholder or"Search...",
Compact=as,
Glass=ap.Glass==true,
GlassTransparency=ap.GlassTransparency or ap.MenuTransparency or 0,
ItemHeight=ap.ItemHeight or(as and an.ItemHeight or 36),
Multi=ap.Multi,
Callback=ap.Callback or nil,

UIElements={},

Opened=false,
Tabs={},

Width=ap.Width or(as and 136 or 150),
}

if at.Multi and not at.Value then
at.Value={}
end
if at.Values and typeof(at.Value)=="number"then
at.Value=at.Values[at.Value]
end

at.DropdownFrame=a.load'I'{
Title=at.Title,
Desc=at.Desc,
Parent=ap.Parent,
TextOffset=at.Callback and at.Width or 20,
Hover=not at.Callback and true or false,
Tab=ap.Tab,
Index=ap.Index,
Window=ap.Window,
ElementTable=at,
ParentConfig=ap,
Tags=ap.Tags,
}

if at.Callback then
at.UIElements.Dropdown=
aj("",nil,at.DropdownFrame.UIElements.Main,nil,ap.Window.NewElements and 12 or 10)

at.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
at.UIElements.Dropdown.Frame.Frame.TextLabel.Size=
UDim2.new(1,at.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

at.UIElements.Dropdown.Size=UDim2.new(0,at.Width,0,as and 32 or 36)
at.UIElements.Dropdown.Position=UDim2.new(1,0,ap.Window.NewElements and 0 or 0.5,0)
at.UIElements.Dropdown.AnchorPoint=Vector2.new(1,ap.Window.NewElements and 0 or 0.5)





end

at.DropdownMenu=al(ap,at,an,"Dropdown")

at.Display=at.DropdownMenu.Display
at.Refresh=at.DropdownMenu.Refresh
at.Select=at.DropdownMenu.Select
at.Open=at.DropdownMenu.Open
at.Close=at.DropdownMenu.Close

ah("ImageLabel",{
Image=ag.Icon"chevrons-up-down"[1],
ImageRectOffset=ag.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=ag.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,at.UIElements.Dropdown and-12 or 0,0.5,0),
ThemeTag={
ImageColor3="Icon",
},
AnchorPoint=Vector2.new(1,0.5),
Parent=at.UIElements.Dropdown and at.UIElements.Dropdown.Frame
or at.DropdownFrame.UIElements.Main,
})

function at.Lock(au)
at.Locked=true
if at.Opened or at.UIElements.MenuCanvas.Visible then
at:Close()
end
return at.DropdownFrame:Lock(at.LockedTitle)
end
function at.Unlock(au)
at.Locked=false
return at.DropdownFrame:Unlock()
end

if at.Locked then
at:Lock()
end

return at.__type,at
end

return an end function a.V()




local aa={}
local ag={
lua={
"and",
"break",
"or",
"else",
"elseif",
"if",
"then",
"until",
"repeat",
"while",
"do",
"for",
"in",
"end",
"local",
"return",
"function",
"export",
},
rbx={
"game",
"workspace",
"script",
"math",
"string",
"table",
"task",
"wait",
"select",
"next",
"Enum",
"tick",
"assert",
"shared",
"loadstring",
"tonumber",
"tostring",
"type",
"typeof",
"unpack",
"Instance",
"CFrame",
"Vector3",
"Vector2",
"Color3",
"UDim",
"UDim2",
"Ray",
"BrickColor",
"OverlapParams",
"RaycastParams",
"Axes",
"Random",
"Region3",
"Rect",
"TweenInfo",
"collectgarbage",
"not",
"utf8",
"pcall",
"xpcall",
"_G",
"setmetatable",
"getmetatable",
"os",
"pairs",
"ipairs",
},
operators={
"#",
"+",
"-",
"*",
"%",
"/",
"^",
"=",
"~",
"=",
"<",
">",
},
}

local ah={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(aj)
local al={}
for am,an in ipairs(aj)do
al[an]=true
end
return al
end

local aj=createKeywordSet(ag.lua)
local al=createKeywordSet(ag.rbx)
local am=createKeywordSet(ag.operators)

local function getHighlight(an,ao)
local ap=an[ao]

if ah[ap.."_color"]then
return ah[ap.."_color"]
end

if tonumber(ap)then
return ah.numbers
elseif ap=="nil"then
return ah.null
elseif ap:sub(1,2)=="--"then
return ah.comment
elseif am[ap]then
return ah.operator
elseif aj[ap]then
return ah.lua
elseif al[ap]then
return ah.rbx
elseif ap:sub(1,1)=='"'or ap:sub(1,1)=="'"then
return ah.str
elseif ap=="true"or ap=="false"then
return ah.boolean
end

if an[ao+1]=="("then
if an[ao-1]==":"then
return ah.self_call
end

return ah.call
end

if an[ao-1]=="."then
if an[ao-2]=="Enum"then
return ah.rbx
end

return ah.local_property
end
end

function aa.run(an,ao)
if ao~=nil then
for ap,aq in next,ao do
ah[ap]=aq
end
end

local ap={}
local aq=""

local ar=false
local as=false
local at=false

for au=1,#an do
local av=an:sub(au,au)

if as then
if av=="\n"and not at then
table.insert(ap,aq)
table.insert(ap,av)
aq=""

as=false
elseif an:sub(au-1,au)=="]]"and at then
aq=aq.."]"

table.insert(ap,aq)
aq=""

as=false
at=false
else
aq=aq..av
end
elseif ar then
if av==ar and an:sub(au-1,au-1)~="\\"or av=="\n"then
aq=aq..av
ar=false
else
aq=aq..av
end
else
if an:sub(au,au+1)=="--"then
table.insert(ap,aq)
aq="-"
as=true
at=an:sub(au+2,au+3)=="[["
elseif av=='"'or av=="'"then
table.insert(ap,aq)
aq=av
ar=av
elseif am[av]then
table.insert(ap,aq)
table.insert(ap,av)
aq=""
elseif av:match"[%w_]"then
aq=aq..av
else
table.insert(ap,aq)
table.insert(ap,av)
aq=""
end
end
end

table.insert(ap,aq)

local au={}

for av,aw in ipairs(ap)do
local ax=getHighlight(ap,av)

if ax then
local ay=string.format(
'<font color = "#%s">%s</font>',
ax:ToHex(),
aw:gsub("<","&lt;"):gsub(">","&gt;")
)

table.insert(au,ay)
else
table.insert(au,aw)
end
end

return table.concat(au)
end

return aa end function a.W()

local aa={}

local ag=a.load'd'
local ah=ag.New
local aj=ag.Tween

local al=a.load'V'

function aa.New(am,an,ao,ap,aq)
local ar={
Radius=an.ElementConfig.UICorner,
Padding=an.NewElements and an.ElementConfig.UIPadding+4 or an.ElementConfig.UIPadding,

CodeFrame=nil,
}

local as=ah("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=am.CodeSize,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ah("UIPadding",{
PaddingTop=UDim.new(0,ar.Padding+3),
PaddingLeft=UDim.new(0,ar.Padding+3),
PaddingRight=UDim.new(0,ar.Padding+3),
PaddingBottom=UDim.new(0,ar.Padding+3),
}),
})
as.Font="Code"

local at=ah("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize=am.Height~=nil and"XY"or"X",
ScrollingDirection=am.Height~=nil and"XY"or"X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
as,
})

local au=am.CanCopied
and ah("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,35,0,35),
Position=UDim2.new(1,-ar.Padding/2,0,ar.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=ap and true or false,
},{
ag.NewRoundFrame(ar.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
ah("UIScale",{
Scale=1,
}),
ah("ImageLabel",{
Image=ag.Icon"copy"[1],
ImageRectSize=ag.Icon"copy"[2].ImageRectSize,
ImageRectOffset=ag.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.1,
}),
}),
})
or nil

local av,aw=ag.NewRoundFrame(ar.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.955,
Visible=false,
})

local ax,ay=ag.NewRoundFrame(ar.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.96,
Size=UDim2.new(1,0,0,20+(ar.Padding*2)),
Visible=am.Title and true or false,
},{










ah("TextLabel",{
Text=am.Title,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=0.2,
TextSize=18,
AutomaticSize="Y",
FontFace=Font.new(ag.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,au and-20-(ar.Padding*2),0,0),
}),
ah("UIPadding",{

PaddingLeft=UDim.new(0,ar.Padding+3),
PaddingRight=UDim.new(0,ar.Padding+3),

}),
ah("UIListLayout",{
Padding=UDim.new(0,ar.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
})

local az,aA=ag.NewRoundFrame(ar.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=0.035,
Size=am.Height~=nil
and UDim2.new(1,0,am.Height.Scale,am.Height.Offset==0 and-40 or am.Height.Offset)
or UDim2.new(1,0,0,20+(ar.Padding*2)),
AutomaticSize=am.Height~=nil and"None"or"Y",
Parent=ao,
},{
av,
ah("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,am.Height~=nil and 1 or 0,0),
AutomaticSize=am.Height~=nil and"None"or"Y",
},{
ax,
at,
ah("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
au,
},nil,true)

ar.CodeFrame=az
ar.CodeFrameModule=aA
ar.OutlineFrame=av
ar.OutlineFrameModule=aw
ar.TopbarFrame=ax
ar.TopbarFrameModule=ay

ag.AddSignal(as:GetPropertyChangedSignal"TextBounds",function()
if am.Height~=nil then
at.Size=UDim2.new(1,0,1,am.Title~=nil and-(20+(ar.Padding*2))or nil)
else
at.Size=
UDim2.new(1,0,0,(as.TextBounds.Y/(aq or 1))+((ar.Padding+3)*2))
end
end)

function ar.Set(aB)
as.Text=al.run(aB,am.CodeTheme)
end

function ar.Destroy()
az:Destroy()
ar=nil
end

ar.Set(am.Code)

if au then
ag.AddSignal(au.InputBegan,function(aB:InputObject)
if
aB.UserInputType==Enum.UserInputType.MouseButton1
or aB.UserInputType==Enum.UserInputType.Touch
then
aj(au.Button,0.05,{ImageTransparency=0.95}):Play()
aj(au.Button.UIScale,0.05,{Scale=0.9}):Play()
end
end)
ag.AddSignal(au.InputEnded,function()
aj(au.Button,0.08,{ImageTransparency=1}):Play()
aj(au.Button.UIScale,0.08,{Scale=1}):Play()
end)
ag.AddSignal(au.MouseButton1Click,function()
if ap then
ap()
local aB=ag.Icon"check"
au.Button.ImageLabel.Image=aB[1]
au.Button.ImageLabel.ImageRectSize=aB[2].ImageRectSize
au.Button.ImageLabel.ImageRectOffset=aB[2].ImageRectPosition

task.delay(1,function()
local aC=ag.Icon"copy"
au.Button.ImageLabel.Image=aC[1]
au.Button.ImageLabel.ImageRectSize=aC[2].ImageRectSize
au.Button.ImageLabel.ImageRectOffset=aC[2].ImageRectPosition
end)
end
end)
end

return ar
end

return aa end function a.X()

local aa=a.load'd'local ag=
aa.New


local ah=a.load'W'

local aj={}

function aj.New(al,am)
local an={
__type="Code",
Title=am.Title,
Code=am.Code,
CodeSize=am.CodeSize or 18,
Height=am.Height,
CodeTheme=am.CodeTheme,
Locked=false,
CanCopied=am.CanCopied~=false,
OnCopy=am.OnCopy,
LinkCorners=am.LinkCorners,
CornerGroup=am.CornerGroup or am.LinkCornerGroup,
CornerBreak=am.CornerBreak,
CornerBreakBefore=am.CornerBreakBefore,
CornerBreakAfter=am.CornerBreakAfter,

Index=am.Index,
}

local ao=not an.Locked











local ap=ah.New(an,am.Window,am.Parent,function()
if ao then
local ap=an.Title or"code"
local aq,ar=pcall(function()
if toclipboard then
toclipboard(an.Code)
end
if setclipboard then
setclipboard(an.Code)
end

if an.OnCopy then
an.OnCopy()
end
end)
if not aq then
am.WindUI:Notify{
Title="Error",
Content="The "..ap.." is not copied. Error: "..ar,
Icon="x",
Style="Error",
Duration=5,
}
end
end
end,am.WindUI.UIScale)

function an.SetCode(aq,ar)
ap.Set(ar)
an.Code=ar
end

function an.Set(aq,ar)
return an.SetCode(ar)
end

function an.Destroy(aq)
ap.Destroy()
an=nil
end

function an.UpdateShape(aq)
if am.Window.NewElements then
local ar=am.Window.ElementConfig.LinkCorners or am.LinkCorners==true
local as="Squircle"

if ar then
as=aa.GetLinkedCornerShape(
aq.Elements,
an.Index,
aq,
am.ParentType,
am.CornerLink
or(am.ParentConfig and am.ParentConfig.CornerLink)
or am.Window.ElementConfig.CornerLink
)
end

if as and ap.CodeFrameModule then
local at=(as=="Squircle-TL-BL"or as=="Squircle-TR-BR")and"Squircle"
or as

ap.CodeFrameModule:SetType(at)

ap.TopbarFrameModule:SetType(
table.find({"Squircle-BL-BR","SquircleH-BL-BR","Squircle-TR-BR"},as)~=nil and"Square"
or at
)
end
end
end

an.UIElements={Main=ap.CodeFrame}
an.ElementFrame=ap.CodeFrame

return an.__type,an
end

return aj end function a.Y()

local aa=a.load'd'
local ag=aa.New local ah=
aa.Tween

local aj=(cloneref or clonereference or function(aj)
return aj
end)

local al=aj(game:GetService"UserInputService")
aj(game:GetService"TouchInputService")
local am=aj(game:GetService"RunService")
local an=aj(game:GetService"Players")local ao=

am.RenderStepped
local ap=an.LocalPlayer
local aq=ap:GetMouse()

local ar=a.load'n'.New
local as=a.load'o'.New

local at={
UICorner=9,

}

local au

function at.Colorpicker(av,aw,ax,ay,az)
local aA={
__type="Colorpicker",
Title=aw.Title,
Desc=aw.Desc,
Default=aw.Value or aw.Default,
Callback=aw.Callback,
Transparency=aw.Transparency,
UIElements=aw.UIElements,

TextPadding=10,
}

local aB={}
local aC=aA.Transparency~=nil

function aA.SetHSVFromRGB(aD,aE)
local aF,aG,aH=Color3.toHSV(aE)
aA.Hue=aF
aA.Sat=aG
aA.Vib=aH
end

aA:SetHSVFromRGB(aA.Default)

local aD=a.load'p'
local aE=aD.Create(nil,"Dialog",ax,ay,ax.UIElements.Main.Main)

aA.ColorpickerFrame=aE

aE.UIElements.Main.Size=UDim2.new(1,0,0,0)



local aF,aG,aH=aA.Hue,aA.Sat,aA.Vib

aA.UIElements.Title=ag("TextLabel",{
Text=aA.Title,
TextSize=20,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=aE.UIElements.Main,
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,aA.TextPadding/2),
PaddingLeft=UDim.new(0,aA.TextPadding/2),
PaddingRight=UDim.new(0,aA.TextPadding/2),
PaddingBottom=UDim.new(0,aA.TextPadding/2),
}),
})





local aI=ag("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local aJ=ag("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=aI,
BackgroundColor3=aA.Default,
},{
ag("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

aA.UIElements.SatVibMap=ag("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40+aA.TextPadding),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(aF,1,1),
BackgroundTransparency=0,
Parent=aE.UIElements.Main,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
ag("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),

aJ,
})

aA.UIElements.Inputs=ag("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(
aC and 240 or 210,
40+aA.TextPadding
),
BackgroundTransparency=1,
Parent=aE.UIElements.Main,
},{
ag("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
}),
})





local aK=ag("Frame",{
BackgroundColor3=aA.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=aA.Transparency,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ag("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208+aA.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=aE.UIElements.Main,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
ag("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),







aK,
})

local aL=ag("Frame",{
BackgroundColor3=aA.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ag("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208+aA.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=aE.UIElements.Main,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),







aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
ag("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),
aL,
})

local aM={}

for aN=0,1,0.1 do
table.insert(aM,ColorSequenceKeypoint.new(aN,Color3.fromHSV(aN,1,1)))
end

local aN=ag("UIGradient",{
Color=ColorSequence.new(aM),
Rotation=90,
})

local aO=ag("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=aI,


BackgroundColor3=aA.Default,
},{
ag("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

local aP=ag("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(180,40+aA.TextPadding),
Parent=aE.UIElements.Main,
},{
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
aN,
aI,
})

local function CreateNewInput(aQ,aR)
local aS=as(aQ,nil,aA.UIElements.Inputs,nil,nil,nil,nil,nil,true)

ag("TextLabel",{
BackgroundTransparency=1,
TextTransparency=0.4,
TextSize=17,
FontFace=Font.new(aa.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=aS.Frame,
Text=aQ,
})

ag("UIScale",{
Parent=aS,
Scale=0.85,
})

aS.Frame.Frame.TextBox.Text=aR
aS.Size=UDim2.new(0,150,0,42)

return aS
end

local function ToRGB(aQ)
return{
R=math.floor(aQ.R*255),
G=math.floor(aQ.G*255),
B=math.floor(aQ.B*255),
}
end

local aQ=CreateNewInput("Hex","#"..aA.Default:ToHex())

local aR=CreateNewInput("Red",ToRGB(aA.Default).R)
local aS=CreateNewInput("Green",ToRGB(aA.Default).G)
local aT=CreateNewInput("Blue",ToRGB(aA.Default).B)
local aU
if aC then
aU=CreateNewInput("Alpha",((1-aA.Transparency)*100).."%")
end

local aV=ag("Frame",{
Size=UDim2.new(0,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254+aA.TextPadding),
BackgroundTransparency=1,
Parent=aE.UIElements.Main,
LayoutOrder=4,
},{
ag("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),






})

aa.AddSignal(aE.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",function()
aA.UIElements.Title.Size=UDim2.new(
0,
aE.UIElements.Main.AbsoluteSize.X/aw.UIScale-(aE.UIPadding*2),
0,
0
)
aV.Size=UDim2.new(
0,
aE.UIElements.Main.AbsoluteSize.X/aw.UIScale-aE.UIPadding*2,
0,
40
)
end)

local b={
{
Title="Cancel",
Variant="Secondary",
Callback=function()
aw.IsShowed=false
for b,d in next,aB do
d:Disconnect()
end
aB={}
end,
},
{
Title="Apply",

Variant="Primary",
Callback=function()
aw.IsShowed=false
for b,d in next,aB do
d:Disconnect()
end
aB={}

az(Color3.fromHSV(aA.Hue,aA.Sat,aA.Vib),aA.Transparency)
end,
},
}

for d,e in next,b do
local f=ar(
e.Title,
e.Icon,
e.Callback,
e.Variant,
aV,
aE,
true
)
f.Size=UDim2.new(0.5,-3,0,40)
f.AutomaticSize="None"
end

local d,e,f
if aC then
local g=ag("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

e=ag("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=g,
},{
ag("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

f=ag("Frame",{
Size=UDim2.fromScale(1,1),
},{
ag("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
ag("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

d=ag("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(210,40+aA.TextPadding),
Parent=aE.UIElements.Main,
BackgroundTransparency=1,
},{
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
ag("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
f,
g,
})
end

function aA.Round(g,h,i)
if i==0 then
return math.floor(h)
end
h=tostring(h)
return h:find"%."and tonumber(h:sub(1,h:find"%."+i))or h
end

function aA.Update(g,h,i)
if h then
aF,aG,aH=Color3.toHSV(h)
else
aF,aG,aH=aA.Hue,aA.Sat,aA.Vib
end

aA.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(aF,1,1)
aJ.Position=UDim2.new(aG,0,1-aH,0)
aJ.BackgroundColor3=Color3.fromHSV(aF,aG,aH)
aL.BackgroundColor3=Color3.fromHSV(aF,aG,aH)
aO.BackgroundColor3=Color3.fromHSV(aF,1,1)
aO.Position=UDim2.new(0.5,0,aF,0)

aQ.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(aF,aG,aH):ToHex()
aR.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aF,aG,aH)).R
aS.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aF,aG,aH)).G
aT.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aF,aG,aH)).B

if i or aC then
aL.BackgroundTransparency=aA.Transparency or i
f.BackgroundColor3=Color3.fromHSV(aF,aG,aH)
e.BackgroundColor3=Color3.fromHSV(aF,aG,aH)
e.BackgroundTransparency=aA.Transparency or i
e.Position=UDim2.new(0.5,0,1-aA.Transparency or i,0)
aU.Frame.Frame.TextBox.Text=aA:Round(
(1-aA.Transparency or i)*100,
0
).."%"
end
end

aA:Update(aA.Default,aA.Transparency)

local function GetRGB()
local g=Color3.fromHSV(aA.Hue,aA.Sat,aA.Vib)
return{R=math.floor(g.r*255),G=math.floor(g.g*255),B=math.floor(g.b*255)}
end



local function clamp(g,h,i)
return math.clamp(tonumber(g)or 0,h,i)
end

table.insert(
aB,
aa.AddSignal(aQ.Frame.Frame.TextBox.FocusLost,function(g)
if g then
local h=aQ.Frame.Frame.TextBox.Text:gsub("#","")
local i,j=pcall(Color3.fromHex,h)
if i and typeof(j)=="Color3"then
aA.Hue,aA.Sat,aA.Vib=Color3.toHSV(j)
aA:Update()
aA.Default=j
end
end
end)
)

local function updateColorFromInput(g,h)
aa.AddSignal(g.Frame.Frame.TextBox.FocusLost,function(i)
if i then
local j=g.Frame.Frame.TextBox
local m=GetRGB()
local p=clamp(j.Text,0,255)
j.Text=tostring(p)

m[h]=p
local r=Color3.fromRGB(m.R,m.G,m.B)
aA.Hue,aA.Sat,aA.Vib=Color3.toHSV(r)
aA:Update()
end
end)
end

updateColorFromInput(aR,"R")
updateColorFromInput(aS,"G")
updateColorFromInput(aT,"B")

if aC then
aa.AddSignal(aU.Frame.Frame.TextBox.FocusLost,function(g)
if g then
local h=aU.Frame.Frame.TextBox
local i=clamp(h.Text,0,100)
h.Text=tostring(i)

aA.Transparency=1-i*0.01
aA:Update(nil,aA.Transparency)
end
end)
end



local function UpdateSatVib(g,h)
local i=g.AbsolutePosition.X
local j=i+g.AbsoluteSize.X
local m=g.AbsolutePosition.Y
local p=m+g.AbsoluteSize.Y

local r=math.clamp(aq.X,i,j)
local u=math.clamp(aq.Y,m,p)

h.Sat=(r-i)/(j-i)
h.Vib=1-((u-m)/(p-m))

h:Update()
end

local function UpdateHue(g,h)
local i=g.AbsolutePosition.Y
local j=i+g.AbsoluteSize.Y

local m=math.clamp(aq.Y,i,j)

h.Hue=(m-i)/(j-i)

h:Update()
end

local function UpdateTransparency(g,h)
local i=g.AbsolutePosition.Y
local j=i+g.AbsoluteSize.Y

local m=math.clamp(aq.Y,i,j)

h.Transparency=1-((m-i)/(j-i))

h:Update()
end

local g=ay.GenerateGUID()

table.insert(
aB,
al.InputChanged:Connect(function(h)
if
h.UserInputType~=Enum.UserInputType.MouseMovement
and h.UserInputType~=Enum.UserInputType.Touch
then
return
end

if au=="SatVib"then
UpdateSatVib(aA.UIElements.SatVibMap,aA)
elseif au=="Hue"then
UpdateHue(aP,aA)
elseif au=="Transparency"then
UpdateTransparency(d,aA)
end
end)
)

table.insert(
aB,
aA.UIElements.SatVibMap.InputBegan:Connect(function(h)
if
h.UserInputType~=Enum.UserInputType.MouseButton1
and h.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ay.CurrentInput and ay.CurrentInput~=g then
return
end
ay.CurrentInput=g

if au and au~="SatVib"then
return
end

au="SatVib"

UpdateSatVib(aA.UIElements.SatVibMap,aA)
end)
)

table.insert(
aB,
aP.InputBegan:Connect(function(h)
if
h.UserInputType~=Enum.UserInputType.MouseButton1
and h.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ay.CurrentInput and ay.CurrentInput~=g then
return
end
ay.CurrentInput=g

if au and au~="Hue"then
return
end

au="Hue"

UpdateHue(aP,aA)
end)
)

if d then
table.insert(
aB,
d.InputBegan:Connect(function(h)
if
h.UserInputType~=Enum.UserInputType.MouseButton1
and h.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ay.CurrentInput and ay.CurrentInput~=g then
return
end
ay.CurrentInput=g

if au and au~="Transparency"then
return
end

au="Transparency"

UpdateTransparency(d,aA)
end)
)
end

table.insert(
aB,
al.InputEnded:Connect(function(h)
au=nil

if ay.CurrentInput and ay.CurrentInput~=g then
return
end
ay.CurrentInput=nil
end)
)

return aA
end

function at.New(av,aw)
local ax={
__type="Colorpicker",
Title=aw.Title or"Colorpicker",
Desc=aw.Desc or nil,
Locked=aw.Locked or false,
LockedTitle=aw.LockedTitle,
Default=aw.Default or Color3.new(1,1,1),
Callback=aw.Callback or function()end,

UIScale=aw.UIScale,
Transparency=aw.Transparency,
UIElements={},

IsShowed=false,
}

local ay=true



ax.ColorpickerFrame=a.load'I'{
Title=ax.Title,
Desc=ax.Desc,
Parent=aw.Parent,
TextOffset=40,
Hover=false,
Tab=aw.Tab,
Index=aw.Index,
Window=aw.Window,
ElementTable=ax,
ParentConfig=aw,
Tags=aw.Tags,
}

ax.UIElements.Colorpicker=aa.NewRoundFrame(at.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=ax.Default,
Parent=ax.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,26,0,26),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
ZIndex=2,
},{
aa.NewRoundFrame(at.UICorner,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=0.55,
}),
},true)

function ax.Lock(az)
ax.Locked=true
ay=false
return ax.ColorpickerFrame:Lock(ax.LockedTitle)
end
function ax.Unlock(az)
ax.Locked=false
ay=true
return ax.ColorpickerFrame:Unlock()
end

if ax.Locked then
ax:Lock()
end

function ax.Update(az,aA,aB)
ax.UIElements.Colorpicker.ImageTransparency=aB or 0
ax.UIElements.Colorpicker.ImageColor3=aA
ax.Default=aA
if aB then
ax.Transparency=aB
end
end

function ax.Set(az,aA,aB)
return ax:Update(aA,aB)
end

aa.AddSignal(ax.UIElements.Colorpicker.MouseButton1Click,function()
if ay and not ax.IsShowed then
ax.IsShowed=true

at:Colorpicker(ax,aw.Window,aw.WindUI,function(az,aA)
ax:Update(az,aA)
ax.Default=az
ax.Transparency=aA
aa.SafeCallback(ax.Callback,az,aA)
end).ColorpickerFrame
:Open()
end
end)

return ax.__type,ax
end

return at end function a.Z()

local aa={}

function aa.ToFiniteNumber(ag)
local aj=tonumber(ag)
if aj==nil or aj~=aj or math.abs(aj)==math.huge then
return nil
end

return aj
end

function aa.FormatNumber(ag)
if ag%1==0 then
return tostring(ag)
end

return tostring(tonumber(string.format("%.2f",ag)))
end

function aa.NormalizeOptions(ag)
local aj={}

for al,am in next,ag or{}do
local an
if typeof(am)=="table"then
local ao=am.Value
if ao==nil then
ao=am.Id or am.Key or am.Title or am.Name or al
end

an={
Title=tostring(am.Title or am.Name or ao),
Desc=am.Desc,
Value=ao,
Icon=am.Icon,
Disabled=am.Disabled==true,
}
else
an={
Title=tostring(am),
Value=am,
Disabled=false,
}
end

table.insert(aj,an)
end

return aj
end

function aa.FindOption(ag,aj)
for al,am in next,ag or{}do
if am.Value==aj then
return am,al
end
end

return nil,nil
end

function aa.ContainsValue(ag,aj)
for al,am in next,ag or{}do
if am==aj then
return true
end
end

return false
end

function aa.CloneArray(ag)
local aj={}
for al,am in next,ag or{}do
table.insert(aj,am)
end
return aj
end

function aa.NormalizeValues(ag)
if ag==nil then
return{}
end

if typeof(ag)~="table"then
return{ag}
end

return aa.CloneArray(ag)
end

function aa.ToggleValue(ag,aj)
local al=aa.CloneArray(ag)

for am,an in next,al do
if an==aj then
table.remove(al,am)
return al,false
end
end

table.insert(al,aj)
return al,true
end

return aa end function a._()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'Z'

local am={}

local function GetControlWidth(an)
return math.max(al.ToFiniteNumber(an.Width)or al.ToFiniteNumber(an.ControlWidth)or 220,120)
end

function am.New(an,ao)
local ap={
__type="RadioGroup",
Title=ao.Title or"Radio Group",
Desc=ao.Desc or nil,
Locked=ao.Locked or false,
LockedTitle=ao.LockedTitle,
Options=al.NormalizeOptions(ao.Options or ao.Values or{}),
Value=ao.Value,
AllowNone=ao.AllowNone==true,
Callback=ao.Callback or function()end,
UIElements={},
OptionFrames={},
Animation=ao.Animation~=false,

Width=GetControlWidth(ao),
}

if ap.Value==nil then
ap.Value=ao.Default
end
if typeof(ap.Value)=="number"and ap.Options[ap.Value]then
ap.Value=ap.Options[ap.Value].Value
end
if ap.Value==nil and not ap.AllowNone and ap.Options[1]then
ap.Value=ap.Options[1].Value
end

local aq=true

ap.RadioGroupFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=ap.Width+14,
Hover=false,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.Options=aj("Frame",{
Name="RadioGroupOptions",
Size=UDim2.new(0,ap.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,0,ao.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ao.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=ap.RadioGroupFrame.UIElements.Main,
},{
aj("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
HorizontalAlignment="Right",
SortOrder="LayoutOrder",
}),
})

local function UpdateOptionVisuals(ar)
for as,at in next,ap.OptionFrames do
local au=at.Option.Value==ap.Value
local av=au and 0.84 or 0.94
local aw=au and 0 or 1
local ax=at.Option.Disabled and 0.55 or(au and 0 or 0.18)

if ar and ap.Animation then
ag.Play(at.Row,"Select",{ImageTransparency=av},nil,nil,"Select")
ag.Play(at.Dot,"Select",{ImageTransparency=aw},nil,nil,"Select")
ag.Play(at.Title,"Select",{TextTransparency=ax},nil,nil,"Select")
else
at.Row.ImageTransparency=av
at.Dot.ImageTransparency=aw
at.Title.TextTransparency=ax
end
end
end

local function CreateOption(ar,as)
local at=aa.NewRoundFrame(99,"Circle",{
Name="Dot",
Size=UDim2.new(0,8,0,8),
ImageTransparency=1,
ThemeTag={
ImageColor3="RadioGroupActive",
},
})

local au=aa.NewRoundFrame(99,"CircleOutline",{
Name="Ring",
Size=UDim2.new(0,18,0,18),
ImageTransparency=ar.Disabled and 0.75 or 0.45,
ThemeTag={
ImageColor3="RadioGroupBorder",
},
},{
at,
})
at.Position=UDim2.new(0.5,0,0.5,0)
at.AnchorPoint=Vector2.new(0.5,0.5)

local av=aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,-28,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ar.Title,
TextSize=14,
TextWrapped=true,
TextXAlignment="Left",
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="RadioGroupText",
},
})

local aw=aa.NewRoundFrame(12,"Squircle",{
Name="Option",
Size=UDim2.new(1,0,0,36),
LayoutOrder=as,
ImageTransparency=0.94,
Active=not ar.Disabled,
ThemeTag={
ImageColor3="RadioGroupBackground",
},
},{
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
aj("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
au,
av,
},true)

aw.Parent=ap.UIElements.Options

local ax={
Row=aw,
Ring=au,
Dot=at,
Title=av,
Option=ar,
}
ap.OptionFrames[as]=ax

ag.AttachPress(aw,aa,{
Enabled=function()
return ap.Animation and not ap.Locked and not ar.Disabled
end,
})

aa.AddSignal(aw.MouseButton1Click,function()
if not ar.Disabled then
ap:Select(ar.Value)
end
end)
end

local function RenderOptions()
for ar,as in next,ap.OptionFrames do
if as.Row then
as.Row:Destroy()
end
end

ap.OptionFrames={}

for ar,as in next,ap.Options do
CreateOption(as,ar)
end

UpdateOptionVisuals(false)
end

function ap.Lock(ar)
ap.Locked=true
aq=false
return ap.RadioGroupFrame:Lock(ap.LockedTitle)
end
function ap.Unlock(ar)
ap.Locked=false
aq=true
return ap.RadioGroupFrame:Unlock()
end

function ap.Get(ar)
return ap.Value
end

function ap.Select(ar,as,at)
local au=al.FindOption(ap.Options,as)
if not au and not ap.AllowNone then
return ap.Value
end
if au and au.Disabled then
return ap.Value
end

ap.Value=as
UpdateOptionVisuals(true)

if aq and at~=false then
aa.SafeCallback(ap.Callback,as,au)
end

return ap.Value
end

function ap.SetOptions(ar,as)
ap.Options=al.NormalizeOptions(as)

if not al.FindOption(ap.Options,ap.Value)then
ap.Value=ap.AllowNone and nil or(ap.Options[1]and ap.Options[1].Value)
end

RenderOptions()
return ap.Options
end

RenderOptions()

if ap.Locked then
ap:Lock()
end

return ap.__type,ap
end

return am end function a.aa()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'Z'

local am={}

local function GetControlWidth(an)
return math.max(al.ToFiniteNumber(an.Width)or al.ToFiniteNumber(an.ControlWidth)or 220,120)
end

function am.New(an,ao)
local ap={
__type="CheckboxGroup",
Title=ao.Title or"Checkbox Group",
Desc=ao.Desc or nil,
Locked=ao.Locked or false,
LockedTitle=ao.LockedTitle,
Options=al.NormalizeOptions(ao.Options or ao.Values or{}),
Values=al.NormalizeValues(ao.ValuesSelected or ao.SelectedValues or ao.Value or ao.ValuesDefault),
Callback=ao.Callback or function()end,
UIElements={},
OptionFrames={},
Animation=ao.Animation~=false,

Width=GetControlWidth(ao),
}

local aq=true

ap.CheckboxGroupFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=ap.Width+14,
Hover=false,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.Options=aj("Frame",{
Name="CheckboxGroupOptions",
Size=UDim2.new(0,ap.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,0,ao.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ao.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=ap.CheckboxGroupFrame.UIElements.Main,
},{
aj("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
HorizontalAlignment="Right",
SortOrder="LayoutOrder",
}),
})

local function SanitizeValues(ar)
local as={}

for at,au in next,ar or{}do
local av=al.FindOption(ap.Options,au)
if av and not av.Disabled and not al.ContainsValue(as,au)then
table.insert(as,au)
end
end

return as
end

local function UpdateOptionVisuals(ar)
for as,at in next,ap.OptionFrames do
local au=al.ContainsValue(ap.Values,at.Option.Value)
local av=au and 0.84 or 0.94
local aw=au and 0 or 1
local ax=au and 0 or 1
local ay=at.Option.Disabled and 0.55 or(au and 0 or 0.18)

if ar and ap.Animation then
ag.Play(at.Row,"Select",{ImageTransparency=av},nil,nil,"Select")
ag.Play(at.Fill,"Select",{ImageTransparency=aw},nil,nil,"Select")
ag.Play(at.Icon,"Select",{ImageTransparency=ax},nil,nil,"Select")
ag.Play(at.Title,"Select",{TextTransparency=ay},nil,nil,"Select")
else
at.Row.ImageTransparency=av
at.Fill.ImageTransparency=aw
at.Icon.ImageTransparency=ax
at.Title.TextTransparency=ay
end
end
end

local function CreateOption(ar,as)
local at=aa.Icon"check"
local au=aj("ImageLabel",{
Name="Check",
Size=UDim2.new(0,12,0,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image=at[1],
ImageRectOffset=at[2].ImageRectPosition,
ImageRectSize=at[2].ImageRectSize,
ImageTransparency=1,
ThemeTag={
ImageColor3="CheckboxGroupIcon",
},
})

local av=aa.NewRoundFrame(5,"Squircle",{
Name="Fill",
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ThemeTag={
ImageColor3="CheckboxGroupActive",
},
},{
au,
})

local aw=aa.NewRoundFrame(5,"SquircleOutline",{
Name="Box",
Size=UDim2.new(0,18,0,18),
ImageTransparency=ar.Disabled and 0.75 or 0.45,
ThemeTag={
ImageColor3="CheckboxGroupBorder",
},
},{
av,
})

local ax=aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,-28,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ar.Title,
TextSize=14,
TextWrapped=true,
TextXAlignment="Left",
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="CheckboxGroupText",
},
})

local ay=aa.NewRoundFrame(12,"Squircle",{
Name="Option",
Size=UDim2.new(1,0,0,36),
LayoutOrder=as,
ImageTransparency=0.94,
Active=not ar.Disabled,
ThemeTag={
ImageColor3="CheckboxGroupBackground",
},
},{
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
aj("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
aw,
ax,
},true)

ay.Parent=ap.UIElements.Options

local az={
Row=ay,
Fill=av,
Icon=au,
Title=ax,
Option=ar,
}
ap.OptionFrames[as]=az

ag.AttachPress(ay,aa,{
Enabled=function()
return ap.Animation and not ap.Locked and not ar.Disabled
end,
})

aa.AddSignal(ay.MouseButton1Click,function()
if not ar.Disabled then
ap:Toggle(ar.Value)
end
end)
end

local function RenderOptions()
for ar,as in next,ap.OptionFrames do
if as.Row then
as.Row:Destroy()
end
end

ap.OptionFrames={}

for ar,as in next,ap.Options do
CreateOption(as,ar)
end

ap.Values=SanitizeValues(ap.Values)
UpdateOptionVisuals(false)
end

function ap.Lock(ar)
ap.Locked=true
aq=false
return ap.CheckboxGroupFrame:Lock(ap.LockedTitle)
end
function ap.Unlock(ar)
ap.Locked=false
aq=true
return ap.CheckboxGroupFrame:Unlock()
end

function ap.Get(ar)
return al.CloneArray(ap.Values)
end

function ap.Set(ar,as,at)
ap.Values=SanitizeValues(al.NormalizeValues(as))
UpdateOptionVisuals(true)

if aq and at~=false then
aa.SafeCallback(ap.Callback,ap:Get())
end

return ap:Get()
end

function ap.Toggle(ar,as,at)
local au=al.FindOption(ap.Options,as)
if not au or au.Disabled then
return ap:Get()
end

ap.Values=al.ToggleValue(ap.Values,as)
return ap:Set(ap.Values,at)
end

function ap.SetOptions(ar,as)
ap.Options=al.NormalizeOptions(as)
RenderOptions()
return ap.Options
end

RenderOptions()

if ap.Locked then
ap:Lock()
end

return ap.__type,ap
end

return am end function a.ab()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'Z'

local am={}

local function GetControlWidth(an)
return math.max(al.ToFiniteNumber(an.Width)or al.ToFiniteNumber(an.ControlWidth)or 220,120)
end

function am.New(an,ao)
local ap={
__type="SegmentedControl",
Title=ao.Title or"Segmented Control",
Desc=ao.Desc or nil,
Locked=ao.Locked or false,
LockedTitle=ao.LockedTitle,
Options=al.NormalizeOptions(ao.Options or ao.Values or{}),
Value=ao.Value or ao.Default,
Callback=ao.Callback or function()end,
UIElements={},
Segments={},
Animation=ao.Animation~=false,

Width=GetControlWidth(ao),
}

if typeof(ap.Value)=="number"and ap.Options[ap.Value]then
ap.Value=ap.Options[ap.Value].Value
end
if ap.Value==nil and ap.Options[1]then
ap.Value=ap.Options[1].Value
end

local aq=true

ap.SegmentedControlFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=ap.Width+14,
Hover=false,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.Container=aa.NewRoundFrame(13,"Squircle",{
Name="SegmentedControl",
Size=UDim2.new(0,ap.Width,0,36),
Position=UDim2.new(1,0,ao.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ao.Window.NewElements and 0 or 0.5),
ImageTransparency=0.93,
ThemeTag={
ImageColor3="SegmentedControlBackground",
},
Parent=ap.SegmentedControlFrame.UIElements.Main,
},{
aj("UIPadding",{
PaddingTop=UDim.new(0,4),
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
PaddingBottom=UDim.new(0,4),
}),
})

local function UpdateSegmentVisuals(ar)
for as,at in next,ap.Segments do
local au=at.Option.Value==ap.Value
local av=au and 0.82 or 1
local aw=at.Option.Disabled and 0.55 or(au and 0 or 0.25)

if ar and ap.Animation then
ag.Play(at.Button,"Select",{ImageTransparency=av},nil,nil,"Select")
ag.Play(at.Title,"Select",{TextTransparency=aw},nil,nil,"Select")
else
at.Button.ImageTransparency=av
at.Title.TextTransparency=aw
end
end
end

local function CreateSegment(ar,as,at)
local au=4
local av=math.max((ap.Width-8-(au*(at-1)))/math.max(at,1),24)

local aw=aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,-10,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Text=ar.Title,
TextSize=13,
TextTruncate="AtEnd",
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="SegmentedControlText",
},
})

local ax=aa.NewRoundFrame(10,"Squircle",{
Name="Segment",
Size=UDim2.new(0,av,1,0),
Position=UDim2.new(0,(as-1)*(av+au)+4,0,4),
ImageTransparency=1,
Active=not ar.Disabled,
ThemeTag={
ImageColor3="SegmentedControlActive",
},
},{
aw,
},true)

ax.Parent=ap.UIElements.Container

local ay={
Button=ax,
Title=aw,
Option=ar,
}
ap.Segments[as]=ay

ag.AttachPress(ax,aa,{
Amount=0.96,
Enabled=function()
return ap.Animation and not ap.Locked and not ar.Disabled
end,
})

aa.AddSignal(ax.MouseButton1Click,function()
if not ar.Disabled then
ap:Select(ar.Value)
end
end)
end

local function RenderSegments()
for ar,as in next,ap.Segments do
if as.Button then
as.Button:Destroy()
end
end

ap.Segments={}

local ar=#ap.Options
for as,at in next,ap.Options do
CreateSegment(at,as,ar)
end

UpdateSegmentVisuals(false)
end

function ap.Lock(ar)
ap.Locked=true
aq=false
return ap.SegmentedControlFrame:Lock(ap.LockedTitle)
end
function ap.Unlock(ar)
ap.Locked=false
aq=true
return ap.SegmentedControlFrame:Unlock()
end

function ap.Get(ar)
return ap.Value
end

function ap.Select(ar,as,at)
local au=al.FindOption(ap.Options,as)
if not au or au.Disabled then
return ap.Value
end

ap.Value=as
UpdateSegmentVisuals(true)

if aq and at~=false then
aa.SafeCallback(ap.Callback,as,au)
end

return ap.Value
end

function ap.SetOptions(ar,as)
ap.Options=al.NormalizeOptions(as)

if not al.FindOption(ap.Options,ap.Value)then
ap.Value=ap.Options[1]and ap.Options[1].Value or nil
end

RenderSegments()
return ap.Options
end

RenderSegments()

if ap.Locked then
ap:Lock()
end

return ap.__type,ap
end

return am end function a.ac()

local aa=a.load'd'

local ag=a.load'o'.New

local aj={}

function aj.New(al,am)
local an={
__type="TextArea",
Title=am.Title or"Text Area",
Desc=am.Desc or nil,
Locked=am.Locked or false,
LockedTitle=am.LockedTitle,
InputIcon=am.InputIcon or false,
Placeholder=am.Placeholder or"Enter Text...",
Value=am.Value or"",
Callback=am.Callback or function()end,
ClearTextOnFocus=am.ClearTextOnFocus or false,
UIElements={},
}

local ao=true

an.TextAreaFrame=a.load'I'{
Title=an.Title,
Desc=an.Desc,
Parent=am.Parent,
TextOffset=0,
Hover=false,
Tab=am.Tab,
Index=am.Index,
Window=am.Window,
ElementTable=an,
ParentConfig=am,
Tags=am.Tags,
}

local ap=ag(
an.Placeholder,
an.InputIcon,
an.TextAreaFrame.UIElements.Container,
"Textarea",
function(ap)
an:Set(ap,true,true)
end,
nil,
am.Window.NewElements and 12 or 10,
an.ClearTextOnFocus
)
ap.Size=UDim2.new(1,0,0,am.Height or 148)
ap.LayoutOrder=99

local aq=ap.Frame.Frame.TextBox

function an.Lock(ar)
an.Locked=true
ao=false
return an.TextAreaFrame:Lock(an.LockedTitle)
end
function an.Unlock(ar)
an.Locked=false
ao=true
return an.TextAreaFrame:Unlock()
end

function an.Get(ar)
return an.Value
end

function an.Set(ar,as,at,au)
if not ao then
return an.Value
end

an.Value=tostring(as or"")

if not au then
aq.Text=an.Value
end

if at~=false then
aa.SafeCallback(an.Callback,an.Value)
end

return an.Value
end

function an.SetPlaceholder(ar,as)
an.Placeholder=tostring(as or"")
aq.PlaceholderText=an.Placeholder
end

an:Set(an.Value,false)

if an.Locked then
an:Lock()
end

return an.__type,an
end

return aj end function a.ad()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ag=aa(game:GetService"UserInputService")

local aj=a.load'd'
local al=a.load'e'
local am=aj.New

local an=a.load'Z'

local ao={}

local function ReadValueConfig(ap)
local aq=typeof(ap.Value)=="table"and ap.Value or{}
local ar=an.ToFiniteNumber(aq.Min)or an.ToFiniteNumber(ap.Min)or 0
local as=an.ToFiniteNumber(aq.Max)or an.ToFiniteNumber(ap.Max)or 100

if ar>as then
ar,as=as,ar
end

local at=typeof(ap.Value)=="number"and ap.Value
or an.ToFiniteNumber(aq.Default)
or an.ToFiniteNumber(ap.Default)
or ar
local au=an.ToFiniteNumber(aq.Increment)or an.ToFiniteNumber(ap.Increment)or 1

return ar,as,math.clamp(an.ToFiniteNumber(at)or ar,ar,as),math.max(math.abs(au),0.0001)
end

function ao.New(ap,aq)
local ar,as,at,au=ReadValueConfig(aq)
local av=ag.TouchEnabled and not ag.KeyboardEnabled
local aw=aq.Buttons~=false and aq.ShowButtons~=false
local ax=av and 38 or 34
local ay=av and 40 or 36
local az=aw and 164 or 128

local aA={
__type="Stepper",
Title=aq.Title or"Stepper",
Desc=aq.Desc or nil,
Locked=aq.Locked or false,
LockedTitle=aq.LockedTitle,
Value={
Min=ar,
Max=as,
Default=at,
Increment=au,
},
Callback=aq.Callback or function()end,
Format=aq.Format,
UIElements={},
Animation=aq.Animation~=false,
Draggable=aq.Draggable~=false,
ShowButtons=aw,
Width=math.max(an.ToFiniteNumber(aq.Width)or an.ToFiniteNumber(aq.ControlWidth)or(av and 188 or 176),az),
}

local aB=true

aA.StepperFrame=a.load'I'{
Title=aA.Title,
Desc=aA.Desc,
Parent=aq.Parent,
TextOffset=aA.Width+14,
Hover=false,
Tab=aq.Tab,
Index=aq.Index,
Window=aq.Window,
ElementTable=aA,
ParentConfig=aq,
Tags=aq.Tags,
}

local function FormatValue(aC)
if typeof(aA.Format)=="function"then
local aD,aE=pcall(aA.Format,aC,aA.Value.Min,aA.Value.Max)
if aD and aE~=nil then
return tostring(aE)
end
end

return an.FormatNumber(aC)
end

local function GetRange()
return math.max(aA.Value.Max-aA.Value.Min,aA.Value.Increment)
end

local function SnapValue(aC)
local aD=an.ToFiniteNumber(aC)
if aD==nil then
return aA.Value.Default
end

local aE=math.floor(((aD-aA.Value.Min)/aA.Value.Increment)+0.5)
local aF=aA.Value.Min+(aE*aA.Value.Increment)
return math.clamp(aF,aA.Value.Min,aA.Value.Max)
end

local function ValueToDelta(aC)
return math.clamp((aC-aA.Value.Min)/GetRange(),0,1)
end

local function CreateIconButton(aC,aD)
local aE=aj.Icon(aD)
local aF=am("ImageLabel",{
Name="Icon",
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image=aE[1],
ImageRectOffset=aE[2].ImageRectPosition,
ImageRectSize=aE[2].ImageRectSize,
ThemeTag={
ImageColor3="StepperIcon",
},
})

local aG=aj.NewRoundFrame(12,"Squircle",{
Name=aC,
Size=UDim2.fromOffset(ax,ax),
ImageTransparency=0.88,
ThemeTag={
ImageColor3="StepperButton",
},
},{
aF,
},true)

return aG,aF
end

local aC,aD
local aE,aF
if aA.ShowButtons then
aC,aD=CreateIconButton("Minus","minus")
aE,aF=CreateIconButton("Plus","plus")

al.AttachPress(aC,aj,{
Amount=0.94,
Enabled=function()
return aA.Animation and not aA.Locked and aA.Value.Default>aA.Value.Min
end,
})
al.AttachPress(aE,aj,{
Amount=0.94,
Enabled=function()
return aA.Animation and not aA.Locked and aA.Value.Default<aA.Value.Max
end,
})
end

local aG=aj.NewRoundFrame(999,"Squircle",{
Name="Fill",
Size=UDim2.new(ValueToDelta(aA.Value.Default),0,1,0),
ImageTransparency=0.12,
ThemeTag={
ImageColor3="Primary",
},
})

local aH=aj.NewRoundFrame(999,"Squircle",{
Name="Thumb",
Size=UDim2.fromOffset(9,9),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(ValueToDelta(aA.Value.Default),0,0.5,0),
ImageTransparency=0,
ThemeTag={
ImageColor3="SliderThumb",
},
})

local aI=aj.NewRoundFrame(999,"Squircle",{
Name="Track",
Size=UDim2.new(1,-18,0,4),
Position=UDim2.new(0.5,0,1,-7),
AnchorPoint=Vector2.new(0.5,1),
ImageTransparency=0.88,
ThemeTag={
ImageColor3="Text",
},
},{
aG,
aH,
})

aA.UIElements.ValueLabel=am("TextLabel",{
Name="Value",
Size=UDim2.new(1,-18,1,-10),
Position=UDim2.new(0.5,0,0,1),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=1,
Text=FormatValue(aA.Value.Default),
TextSize=av and 15 or 14,
TextTruncate="AtEnd",
FontFace=Font.new(aj.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="StepperText",
},
})

local aJ=aA.ShowButtons and((ax*2)+10)or 0
local aK=aj.NewRoundFrame(12,"Squircle",{
Name="ValueBackground",
Size=UDim2.new(1,-aJ,0,ay),
ImageTransparency=0.92,
Active=true,
ClipsDescendants=true,
ThemeTag={
ImageColor3="StepperValueBackground",
},
},{
aA.UIElements.ValueLabel,
aI,
},true)

aA.UIElements.Track=aI
aA.UIElements.TrackFill=aG
aA.UIElements.TrackThumb=aH
aA.UIElements.ValueBackground=aK

aA.UIElements.Container=am("Frame",{
Name="Stepper",
Size=UDim2.new(0,aA.Width,0,ay),
Position=UDim2.new(1,0,aq.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,aq.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=aA.StepperFrame.UIElements.Main,
},{
am("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection="Horizontal",
HorizontalAlignment="Right",
VerticalAlignment="Center",
}),
aC,
aK,
aE,
})

local function SetProgressVisual(aL,aM)
local aN=ValueToDelta(aL)
local aO=UDim2.new(aN,0,1,0)
local aP=UDim2.new(aN,0,0.5,0)

if aM and aA.Animation then
al.Play(aG,"Fast",{Size=aO},nil,nil,"StepperFill")
al.Play(aH,"Fast",{Position=aP},nil,nil,"StepperThumb")
else
aG.Size=aO
aH.Position=aP
end
end

local function UpdateButtonStates(aL)
if not aA.ShowButtons then
return
end

local aM=aA.Value.Default<=aA.Value.Min
local aN=aA.Value.Default>=aA.Value.Max
local aO=aM and 0.62 or 0
local aP=aN and 0.62 or 0
local aQ=aM and 0.94 or 0.88
local aR=aN and 0.94 or 0.88

if aL and aA.Animation then
al.Play(aD,"Fast",{ImageTransparency=aO},nil,nil,"State")
al.Play(aF,"Fast",{ImageTransparency=aP},nil,nil,"State")
al.Play(aC,"Fast",{ImageTransparency=aQ},nil,nil,"State")
al.Play(aE,"Fast",{ImageTransparency=aR},nil,nil,"State")
else
aD.ImageTransparency=aO
aF.ImageTransparency=aP
aC.ImageTransparency=aQ
aE.ImageTransparency=aR
end
end

local function UpdateValue(aL,aM,aN)
local aO=an.ToFiniteNumber(aL)
if aO==nil then
return aA.Value.Default
end

local aP=aA.Value.Default
aA.Value.Default=aN==false and math.clamp(aO,aA.Value.Min,aA.Value.Max)or SnapValue(aO)
aA.UIElements.ValueLabel.Text=FormatValue(aA.Value.Default)
SetProgressVisual(aA.Value.Default,true)
UpdateButtonStates(true)

if aA.Animation and aP~=aA.Value.Default then
al.Play(aK,"Fast",{ImageTransparency=0.86},nil,nil,"Pulse")
task.delay(al.GetDuration"Fast",function()
if aK.Parent then
al.Play(aK,"Select",{ImageTransparency=0.92},nil,nil,"Pulse")
end
end)
end

if aB and aM~=false and aP~=aA.Value.Default then
aj.SafeCallback(aA.Callback,aA.Value.Default)
end

return aA.Value.Default
end

function aA.Lock(aL)
aA.Locked=true
aB=false
UpdateButtonStates(true)
return aA.StepperFrame:Lock(aA.LockedTitle)
end
function aA.Unlock(aL)
aA.Locked=false
aB=true
UpdateButtonStates(true)
return aA.StepperFrame:Unlock()
end

function aA.Get(aL)
return aA.Value.Default
end

function aA.Set(aL,aM,aN)
return UpdateValue(aM,aN)
end

function aA.SetRange(aL,aM,aN)
aM=an.ToFiniteNumber(aM)
aN=an.ToFiniteNumber(aN)

if aM==nil or aN==nil then
return aA.Value.Min,aA.Value.Max
end

if aM>aN then
aM,aN=aN,aM
end

aA.Value.Min=aM
aA.Value.Max=aN
UpdateValue(aA.Value.Default,false)

return aA.Value.Min,aA.Value.Max
end

function aA.SetMin(aL,aM)
aA:SetRange(aM,math.max(an.ToFiniteNumber(aM)or aA.Value.Min,aA.Value.Max))
return aA.Value.Min
end

function aA.SetMax(aL,aM)
aA:SetRange(math.min(aA.Value.Min,an.ToFiniteNumber(aM)or aA.Value.Max),aM)
return aA.Value.Max
end

local aL=aq.WindUI.GenerateGUID()
local aM
local aN
local aO
local aP=aq.Tab and aq.Tab.UIElements and aq.Tab.UIElements.ContainerFrame

local function DisconnectDrag()
if aN then
aN:Disconnect()
aN=nil
end
if aO then
aO:Disconnect()
aO=nil
end
if aP then
aP.ScrollingEnabled=true
end
if aq.WindUI.CurrentInput==aL then
aq.WindUI.CurrentInput=nil
end
aM=nil
if aA.Animation then
al.Play(aH,"Focus",{Size=UDim2.fromOffset(9,9)},nil,nil,"StepperDrag")
end
end

local function GetInputX(aQ)
if aQ.UserInputType==Enum.UserInputType.Touch then
return aQ.Position.X
end
return ag:GetMouseLocation().X
end

local function UpdateFromInput(aQ)
if not aI or aI.AbsoluteSize.X<=0 then
return
end

local aR=math.clamp((GetInputX(aQ)-aI.AbsolutePosition.X)/aI.AbsoluteSize.X,0,1)
local aS=aA.Value.Min+(aR*GetRange())
UpdateValue(aS,true)
end

if aA.ShowButtons then
aj.AddSignal(aC.MouseButton1Click,function()
if not aA.Locked then
aA:Set(aA.Value.Default-aA.Value.Increment)
end
end)
aj.AddSignal(aE.MouseButton1Click,function()
if not aA.Locked then
aA:Set(aA.Value.Default+aA.Value.Increment)
end
end)
end

aj.AddSignal(aK.InputBegan,function(aQ)
if aA.Locked or not aA.Draggable then
return
end
if aQ.UserInputType~=Enum.UserInputType.MouseButton1 and aQ.UserInputType~=Enum.UserInputType.Touch then
return
end
if aq.WindUI.CurrentInput and aq.WindUI.CurrentInput~=aL then
return
end

aq.WindUI.CurrentInput=aL
aM=aQ
if aP then
aP.ScrollingEnabled=false
end
if aA.Animation then
al.Play(aH,"Focus",{Size=UDim2.fromOffset(13,13)},nil,nil,"StepperDrag")
end
UpdateFromInput(aQ)

aN=ag.InputChanged:Connect(function(aR)
if not aM then
return
end
if aM.UserInputType==Enum.UserInputType.Touch and aR.UserInputType~=Enum.UserInputType.Touch then
return
end
if aM.UserInputType==Enum.UserInputType.MouseButton1 and aR.UserInputType~=Enum.UserInputType.MouseMovement then
return
end
UpdateFromInput(aR)
end)

aO=ag.InputEnded:Connect(function(aR)
if not aM then
return
end
local aS=aM.UserInputType==Enum.UserInputType.Touch and aR==aM
local aT=aM.UserInputType==Enum.UserInputType.MouseButton1
and aR.UserInputType==Enum.UserInputType.MouseButton1
if aS or aT then
DisconnectDrag()
end
end)
end)

UpdateButtonStates(false)
SetProgressVisual(aA.Value.Default,false)

if aA.Locked then
aA:Lock()
end

return aA.__type,aA
end

return ao end function a.ae()

local aa={}

local ag={
Info={
Icon="info",
Color=Color3.fromHex"#2563eb",
},
Success={
Icon="circle-check",
Color=Color3.fromHex"#16a34a",
},
Warning={
Icon="triangle-alert",
Color=Color3.fromHex"#d97706",
},
Error={
Icon="circle-x",
Color=Color3.fromHex"#dc2626",
},
}

function aa.New(aj,al)
local am=al.Variant or"Info"
local an=ag[am]or ag.Info

local ao={
__type="Callout",
Title=al.Title or am,
Desc=al.Desc or al.Content,
Icon=al.Icon or an.Icon,
Variant=am,
Color=al.Color or an.Color,
UIElements={},
}

ao.CalloutFrame=a.load'I'{
Title=ao.Title,
Desc=ao.Desc,
Image=ao.Icon,
IconThemed=al.IconThemed,
Color=ao.Color,
Parent=al.Parent,
TextOffset=0,
Hover=al.Hover==true,
Tab=al.Tab,
Index=al.Index,
Window=al.Window,
ElementTable=ao,
ParentConfig=al,
Tags=al.Tags,
Size=al.Size,
}

return ao.__type,ao
end

return aa end function a.af()

local aa={}

aa.Variants={
Info={
Icon="info",
Color=Color3.fromHex"#2563eb",
},
Success={
Icon="circle-check",
Color=Color3.fromHex"#16a34a",
},
Warning={
Icon="triangle-alert",
Color=Color3.fromHex"#d97706",
},
Error={
Icon="circle-x",
Color=Color3.fromHex"#dc2626",
},
Neutral={
Icon="circle",
Color=Color3.fromHex"#71717a",
},
}

function aa.ToFiniteNumber(ag)
local aj=tonumber(ag)
if aj==nil or aj~=aj or math.abs(aj)==math.huge then
return nil
end

return aj
end

function aa.GetVariant(ag)
return aa.Variants[ag or"Info"]or aa.Variants.Info
end

function aa.GetColor(ag,aj)
if typeof(ag)=="Color3"then
return ag
end
if typeof(ag)=="string"and string.sub(ag,1,1)=="#"then
return Color3.fromHex(ag)
end
return aj
end

function aa.NormalizeItems(ag,aj,al)
local am={}

for an,ao in next,ag or{}do
if typeof(ao)=="table"then
local ap=ao[al or"Value"]
if ap==nil then
ap=ao.Id or ao.Key or ao.Title or ao.Name or an
end

table.insert(am,{
Title=tostring(ao[aj or"Title"]or ao.Name or ap),
Desc=ao.Desc or ao.Content,
Value=ap,
Icon=ao.Icon,
Color=ao.Color,
Disabled=ao.Disabled==true,
Items=ao.Items,
})
else
table.insert(am,{
Title=tostring(ao),
Value=ao,
Disabled=false,
})
end
end

return am
end

function aa.CloneArray(ag)
local aj={}
for al,am in next,ag or{}do
table.insert(aj,am)
end
return aj
end

function aa.NormalizeValues(ag)
if ag==nil then
return{}
end
if typeof(ag)~="table"then
return{ag}
end
return aa.CloneArray(ag)
end

function aa.ContainsValue(ag,aj)
for al,am in next,ag or{}do
if am==aj then
return true
end
end
return false
end

function aa.ToggleValue(ag,aj)
local al=aa.CloneArray(ag)

for am,an in next,al do
if an==aj then
table.remove(al,am)
return al,false
end
end

table.insert(al,aj)
return al,true
end

function aa.CreateIcon(ag,aj,al,am,an,ao)
if not aj or aj==""then
return nil
end

local ap=ag.Image(aj,aj,0,al,am or"Element",an~=false,true,ao)
ap.Size=UDim2.new(0,18,0,18)
return ap
end

function aa.GetImageTarget(ag)
if typeof(ag)~="Instance"then
return nil
end

if ag:IsA"ImageLabel"or ag:IsA"ImageButton"then
return ag
end

return ag:FindFirstChildWhichIsA"ImageLabel"or ag:FindFirstChildWhichIsA"ImageButton"
end

function aa.CreateText(ag,aj,al,am,an,ao)
return ag("TextLabel",{
BackgroundTransparency=1,
Text=tostring(al or""),
TextSize=am or 14,
TextTransparency=ao or 0,
TextWrapped=true,
TextXAlignment="Left",
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(aj.Font,an or Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})
end

return aa end function a.ag()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

function am.New(an,ao)
local ap=ao.Variant or"Info"
local aq=al.GetVariant(ap)
local ar={
__type="Badge",
Title=ao.Title or"Badge",
Desc=ao.Desc or nil,
Value=ao.Value or ao.Badge or ap,
Variant=ap,
Color=al.GetColor(ao.Color,aq.Color),
Icon=ao.Icon or aq.Icon,
Callback=ao.Callback,
UIElements={},

Width=math.max(al.ToFiniteNumber(ao.Width)or 96,72),
}

ar.BadgeFrame=a.load'I'{
Title=ar.Title,
Desc=ar.Desc,
Parent=ao.Parent,
TextOffset=ar.Width+14,
Hover=ao.Hover==true or ar.Callback~=nil,
Scalable=ar.Callback~=nil,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ar,
ParentConfig=ao,
Tags=ao.Tags,
}

local as=al.CreateIcon(aa,ar.Icon,ao.Window.Folder,"Badge",false,"BadgeIcon")
if as then
as.ImageLabel.ImageColor3=Color3.new(1,1,1)
as.ImageLabel.ImageTransparency=0
as.Size=UDim2.new(0,14,0,14)
end

ar.UIElements.Label=aj("TextLabel",{
Name="Label",
BackgroundTransparency=1,
Text=tostring(ar.Value),
TextSize=13,
TextTruncate="AtEnd",
TextXAlignment="Center",
Size=UDim2.new(1,as and-20 or 0,1,0),
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextColor3=Color3.new(1,1,1),
})

ar.UIElements.Pill=aa.NewRoundFrame(999,"Squircle",{
Name="Badge",
Size=UDim2.new(0,ar.Width,0,28),
Position=UDim2.new(1,0,ao.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ao.Window.NewElements and 0 or 0.5),
ImageTransparency=0,
ImageColor3=ar.Color,
Parent=ar.BadgeFrame.UIElements.Main,
},{
aj("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
aj("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
as,
ar.UIElements.Label,
})

function ar.SetValue(at,au)
ar.Value=au
ar.UIElements.Label.Text=tostring(au or"")
ag.Play(ar.UIElements.Pill,"Fast",{ImageTransparency=0.08},nil,nil,"Pulse")
task.delay(ag.GetDuration"Fast",function()
if ar.UIElements.Pill.Parent then
ag.Play(ar.UIElements.Pill,"Select",{ImageTransparency=0},nil,nil,"Pulse")
end
end)
return ar.Value
end

function ar.SetVariant(at,au)
local av=al.GetVariant(au)
ar.Variant=au
ar.Color=av.Color
ag.Play(ar.UIElements.Pill,"Select",{ImageColor3=ar.Color},nil,nil,"Variant")
return ar.Variant
end

if ar.Callback then
aa.AddSignal(ar.BadgeFrame.UIElements.Main.MouseButton1Click,function()
aa.SafeCallback(ar.Callback,ar.Value)
end)
end

return ar.__type,ar
end

return am end function a.ah()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

function am.New(an,ao)
local ap=ao.Status or ao.Variant or"Info"
local aq=al.GetVariant(ap)
local ar={
__type="StatusCard",
Title=ao.Title or"Status",
Desc=ao.Desc or ao.Content,
Value=ao.Value or ap,
Status=ap,
Color=al.GetColor(ao.Color,aq.Color),
Callback=ao.Callback,
UIElements={},

Width=math.max(al.ToFiniteNumber(ao.Width)or 136,96),
}

ar.StatusCardFrame=a.load'I'{
Title=ar.Title,
Desc=ar.Desc,
Parent=ao.Parent,
TextOffset=ar.Width+14,
Hover=ao.Hover==true or ar.Callback~=nil,
Scalable=ar.Callback~=nil,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ar,
ParentConfig=ao,
Tags=ao.Tags,
}

ar.UIElements.Dot=aa.NewRoundFrame(999,"Circle",{
Name="Dot",
Size=UDim2.new(0,10,0,10),
ImageColor3=ar.Color,
})

ar.UIElements.Value=aj("TextLabel",{
Name="Value",
BackgroundTransparency=1,
Text=tostring(ar.Value),
TextSize=14,
TextTransparency=0.08,
TextTruncate="AtEnd",
AutomaticSize="Y",
Size=UDim2.new(1,-18,0,0),
TextXAlignment="Left",
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
})

ar.UIElements.Status=aj("Frame",{
Name="StatusCard",
Size=UDim2.new(0,ar.Width,0,34),
Position=UDim2.new(1,0,ao.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ao.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=ar.StatusCardFrame.UIElements.Main,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Right",
}),
ar.UIElements.Dot,
ar.UIElements.Value,
})

function ar.SetValue(as,at)
ar.Value=at
ar.UIElements.Value.Text=tostring(at or"")
return ar.Value
end

function ar.SetStatus(as,at,au)
local av=al.GetVariant(at)
ar.Status=at
ar.Color=av.Color
if au~=nil then
ar:SetValue(au)
end
ag.Play(ar.UIElements.Dot,"Select",{ImageColor3=ar.Color},nil,nil,"Status")
return ar.Status
end

if ar.Callback then
aa.AddSignal(ar.StatusCardFrame.UIElements.Main.MouseButton1Click,function()
aa.SafeCallback(ar.Callback,ar.Status,ar.Value)
end)
end

return ar.__type,ar
end

return am end function a.ai()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

local function GetTrendColor(an)
if an=="Down"or an=="Negative"then
return Color3.fromHex"#dc2626"
end
if an=="Neutral"then
return Color3.fromHex"#71717a"
end
return Color3.fromHex"#16a34a"
end

function am.New(an,ao)
local ap={
__type="StatCard",
Title=ao.Title or"Stat",
Desc=ao.Desc,
Value=ao.Value or ao.Default or"0",
SubValue=ao.SubValue or ao.TrendText,
Trend=ao.Trend or"Up",
Icon=ao.Icon,
UIElements={},
}

ap.StatCardFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Image=ap.Icon,
Parent=ao.Parent,
TextOffset=0,
Hover=ao.Hover==true,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.Value=aj("TextLabel",{
Name="Value",
LayoutOrder=-1,
BackgroundTransparency=1,
Text=tostring(ap.Value),
TextSize=al.ToFiniteNumber(ao.ValueTextSize)or 24,
TextWrapped=true,
TextXAlignment="Left",
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(aa.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
})

ap.UIElements.TrendDot=aa.NewRoundFrame(999,"Circle",{
Name="TrendDot",
Size=UDim2.new(0,8,0,8),
ImageColor3=al.GetColor(ao.TrendColor,GetTrendColor(ap.Trend)),
})

ap.UIElements.SubValue=aj("TextLabel",{
Name="SubValue",
BackgroundTransparency=1,
Text=tostring(ap.SubValue or""),
TextSize=13,
TextTransparency=0.35,
TextWrapped=true,
TextXAlignment="Left",
AutomaticSize="Y",
Size=UDim2.new(1,-16,0,0),
Visible=ap.SubValue~=nil,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})

ap.UIElements.Footer=aj("Frame",{
Name="Footer",
LayoutOrder=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.StatCardFrame.UIElements.Container,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ap.UIElements.TrendDot,
ap.UIElements.SubValue,
})
ap.UIElements.Value.Parent=ap.StatCardFrame.UIElements.Container

function ap.SetValue(aq,ar,as)
ap.Value=ar
ap.UIElements.Value.Text=tostring(ar or"")
if as~=nil then
ap.SubValue=as
ap.UIElements.SubValue.Text=tostring(as)
ap.UIElements.SubValue.Visible=true
end
ag.Play(ap.UIElements.Value,"Fast",{TextTransparency=0.18},nil,nil,"Pulse")
task.delay(ag.GetDuration"Fast",function()
if ap.UIElements.Value.Parent then
ag.Play(ap.UIElements.Value,"Select",{TextTransparency=0},nil,nil,"Pulse")
end
end)
return ap.Value
end

function ap.SetTrend(aq,ar,as)
ap.Trend=ar
local at=al.GetColor(as,GetTrendColor(ar))
ag.Play(ap.UIElements.TrendDot,"Select",{ImageColor3=at},nil,nil,"Trend")
return ap.Trend
end

return ap.__type,ap
end

return am end function a.aj()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

function am.New(an,ao)
local ap={
__type="KeyValue",
Title=ao.Title or"Details",
Desc=ao.Desc,
Items=al.NormalizeItems(ao.Items or ao.Rows or ao.Values or{},"Key","Value"),
UIElements={},
Rows={},
}

ap.KeyValueFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=0,
Hover=ao.Hover==true,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.List=aj("Frame",{
Name="KeyValueList",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.KeyValueFrame.UIElements.Container,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
})

local function Render()
for aq,ar in next,ap.Rows do
ar:Destroy()
end
ap.Rows={}

for aq,ar in next,ap.Items do
local as=al.CreateIcon(aa,ar.Icon,ao.Window.Folder,"KeyValue",true,"KeyValueIcon")
if as then
as.Size=UDim2.new(0,16,0,16)
end

local at=aj("TextLabel",{
Name="Key",
BackgroundTransparency=1,
Text=tostring(ar.Title),
TextSize=14,
TextTransparency=0.35,
TextTruncate="AtEnd",
TextXAlignment="Left",
Size=UDim2.new(0.45,as and-24 or 0,0,0),
AutomaticSize="Y",
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})

local au=aj("TextLabel",{
Name="Value",
BackgroundTransparency=1,
Text=tostring(ar.Value or""),
TextSize=14,
TextTransparency=0.05,
TextWrapped=true,
TextXAlignment="Right",
Size=UDim2.new(0.55,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
})

local av=aj("Frame",{
Name="Row",
LayoutOrder=aq,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.UIElements.List,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
as,
at,
au,
})

table.insert(ap.Rows,av)
end
end

function ap.SetItems(aq,ar)
ap.Items=al.NormalizeItems(ar or{},"Key","Value")
Render()
ag.Play(ap.UIElements.List,"Reveal",{BackgroundTransparency=1},nil,nil,"Render")
return ap.Items
end

Render()

return ap.__type,ap
end

return am end function a.ak()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

local function GetWidth(an)
return math.max(al.ToFiniteNumber(an.Width)or al.ToFiniteNumber(an.ControlWidth)or 190,120)
end

function am.New(an,ao)
local ap={
__type="ChipList",
Title=ao.Title or"Chips",
Desc=ao.Desc,
Options=al.NormalizeItems(ao.Options or ao.Values or{}),
Values=al.NormalizeValues(ao.Value or ao.ValuesSelected or ao.SelectedValues),
Multi=ao.Multi~=false,
Callback=ao.Callback or function()end,
Locked=ao.Locked or false,
LockedTitle=ao.LockedTitle,
Animation=ao.Animation~=false,
UIElements={},
Chips={},

Width=GetWidth(ao),
}

local aq=true

ap.ChipListFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=ap.Width+14,
Hover=false,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.List=aj("Frame",{
Name="ChipList",
Size=UDim2.new(0,ap.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,0,ao.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ao.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=ap.ChipListFrame.UIElements.Main,
},{
aj("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
HorizontalAlignment="Right",
SortOrder="LayoutOrder",
}),
})

local function IsSelected(ar)
return al.ContainsValue(ap.Values,ar)
end

local function UpdateVisuals(ar)
for as,at in next,ap.Chips do
local au=IsSelected(at.Option.Value)
local av=au and 0.82 or 0.94
local aw=at.Option.Disabled and 0.55 or(au and 0 or 0.2)

if ar and ap.Animation then
ag.Play(at.Button,"Select",{ImageTransparency=av},nil,nil,"State")
ag.Play(at.Title,"Select",{TextTransparency=aw},nil,nil,"State")
else
at.Button.ImageTransparency=av
at.Title.TextTransparency=aw
end
end
end

local function Sanitize(ar)
local as={}
for at,au in next,ar or{}do
for av,aw in next,ap.Options do
if aw.Value==au and not aw.Disabled and not al.ContainsValue(as,au)then
table.insert(as,au)
break
end
end
end
return as
end

local function CreateChip(ar,as)
local at=aj("TextLabel",{
Name="Title",
BackgroundTransparency=1,
Text=ar.Title,
TextSize=13,
TextTruncate="AtEnd",
TextXAlignment="Center",
Size=UDim2.new(1,-16,1,0),
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
})

local au=aa.NewRoundFrame(999,"Squircle",{
Name="Chip",
Size=UDim2.new(1,0,0,30),
LayoutOrder=as,
ImageTransparency=0.94,
Active=not ar.Disabled,
ThemeTag={
ImageColor3="ChipListBackground",
},
Parent=ap.UIElements.List,
},{
at,
},true)

local av={
Button=au,
Title=at,
Option=ar,
}
ap.Chips[as]=av

ag.AttachPress(au,aa,{
Amount=0.96,
Enabled=function()
return ap.Animation and not ap.Locked and not ar.Disabled
end,
})

aa.AddSignal(au.MouseButton1Click,function()
if not ar.Disabled then
ap:Toggle(ar.Value)
end
end)
end

local function Render()
for ar,as in next,ap.Chips do
as.Button:Destroy()
end
ap.Chips={}

for ar,as in next,ap.Options do
CreateChip(as,ar)
end

ap.Values=Sanitize(ap.Values)
UpdateVisuals(false)
end

function ap.Lock(ar)
ap.Locked=true
aq=false
return ap.ChipListFrame:Lock(ap.LockedTitle)
end

function ap.Unlock(ar)
ap.Locked=false
aq=true
return ap.ChipListFrame:Unlock()
end

function ap.Get(ar)
return ap.Multi and al.CloneArray(ap.Values)or ap.Values[1]
end

function ap.Set(ar,as,at)
local au=al.NormalizeValues(as)
if not ap.Multi and au[1]~=nil then
au={au[1]}
end

ap.Values=Sanitize(au)
UpdateVisuals(true)

if aq and at~=false then
aa.SafeCallback(ap.Callback,ap:Get())
end

return ap:Get()
end

function ap.Toggle(ar,as,at)
if ap.Multi then
ap.Values=al.ToggleValue(ap.Values,as)
return ap:Set(ap.Values,at)
end

return ap:Set(as,at)
end

function ap.SetOptions(ar,as)
ap.Options=al.NormalizeItems(as or{})
Render()
return ap.Options
end

Render()

if ap.Locked then
ap:Lock()
end

return ap.__type,ap
end

return am end function a.al()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

local function NormalizeActions(an)
local ao={}

for ap,aq in next,an or{}do
if typeof(aq)=="table"then
table.insert(ao,{
Title=tostring(aq.Title or aq.Name or aq.Value or("Action "..tostring(ap))),
Desc=aq.Desc or aq.Content,
Value=aq.Value or aq.Badge,
Icon=aq.Icon,
Color=al.GetColor(aq.Color,nil),
Disabled=aq.Disabled==true,
Callback=aq.Callback,
})
else
table.insert(ao,{
Title=tostring(aq),
Disabled=false,
})
end
end

return ao
end

function am.New(an,ao)
local ap={
__type="ActionList",
Title=ao.Title or"Actions",
Desc=ao.Desc,
Actions=NormalizeActions(ao.Actions or ao.Items or ao.Values or{}),
Rows={},
UIElements={},
}

ap.ActionListFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=0,
Hover=ao.Hover==true,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.List=aj("Frame",{
Name="ActionList",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.ActionListFrame.UIElements.Container,
},{
aj("UIListLayout",{
Padding=UDim.new(0,ao.Window.NewElements and 6 or 8),
FillDirection="Vertical",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

local function Render()
for aq,ar in next,ap.Rows do
ar:Destroy()
end
ap.Rows={}

for aq,ar in next,ap.Actions do
local as=al.CreateIcon(aa,ar.Icon or"circle-dot",ao.Window.Folder,"ActionList",true,"ActionListIcon")
if as then
as.Size=UDim2.fromOffset(17,17)
end
local at=al.GetImageTarget(as)
if at and ar.Color then
at.ImageColor3=ar.Color
end

local au=aj("Frame",{
Name="Texts",
Size=UDim2.new(1,ar.Value and-96 or-42,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
aj("UIListLayout",{
Padding=UDim.new(0,2),
FillDirection="Vertical",
HorizontalAlignment="Left",
}),
aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ar.Title,
TextSize=14,
TextTransparency=ar.Disabled and 0.46 or 0.04,
TextXAlignment="Left",
TextTruncate="AtEnd",
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
}),
ar.Desc and aj("TextLabel",{
Name="Desc",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=tostring(ar.Desc),
TextSize=12,
TextTransparency=ar.Disabled and 0.62 or 0.38,
TextXAlignment="Left",
TextWrapped=true,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})or nil,
})

local av
if ar.Value~=nil then
av=aa.NewRoundFrame(999,"Squircle",{
Name="Value",
Size=UDim2.new(0,0,0,26),
AutomaticSize="X",
ImageTransparency=0.88,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
aj("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
aj("TextLabel",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
BackgroundTransparency=1,
Text=tostring(ar.Value),
TextSize=12,
TextTransparency=0.12,
FontFace=Font.new(aa.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
}),
})
end

local aw=aa.NewRoundFrame(14,"Squircle",{
Name="Action",
LayoutOrder=aq,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ImageTransparency=ar.Disabled and 0.96 or 0.92,
Parent=ap.UIElements.List,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
aj("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
as,
au,
av,
},not ar.Disabled)

if not ar.Disabled then
ag.AttachPress(aw,aa,{
Amount=0.985,
})
aa.AddSignal(aw.MouseButton1Click,function()
if typeof(ar.Callback)=="function"then
aa.SafeCallback(ar.Callback,ar,aq)
elseif typeof(ao.Callback)=="function"then
aa.SafeCallback(ao.Callback,ar,aq)
end
end)
end

table.insert(ap.Rows,aw)
end
end

function ap.SetActions(aq,ar)
ap.Actions=NormalizeActions(ar)
Render()
return ap.Actions
end

function ap.AddAction(aq,ar)
local as=NormalizeActions{ar}[1]
if as then
table.insert(ap.Actions,as)
Render()
end
return as
end

Render()

return ap.__type,ap
end

return am end function a.am()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

local function NormalizeMeters(an)
local ao={}

for ap,aq in next,an or{}do
if typeof(aq)=="table"then
local ar=al.ToFiniteNumber(aq.Max)or 100
local as=al.ToFiniteNumber(aq.Value or aq.Default)or 0
table.insert(ao,{
Title=tostring(aq.Title or aq.Name or("Meter "..tostring(ap))),
Value=math.clamp(as,0,ar),
Max=math.max(ar,0.0001),
Desc=aq.Desc,
Color=al.GetColor(aq.Color,nil),
Format=aq.Format,
})
else
table.insert(ao,{
Title=tostring(ap),
Value=math.clamp(al.ToFiniteNumber(aq)or 0,0,100),
Max=100,
})
end
end

return ao
end

function am.New(an,ao)
local ap={
__type="MeterGroup",
Title=ao.Title or"Meters",
Desc=ao.Desc,
Meters=NormalizeMeters(ao.Meters or ao.Items or ao.Values or{}),
Rows={},
UIElements={},
}

ap.MeterGroupFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=0,
Hover=ao.Hover==true,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.List=aj("Frame",{
Name="MeterGroup",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.MeterGroupFrame.UIElements.Container,
},{
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

local function FormatValue(aq)
local ar=math.clamp(aq.Value/aq.Max,0,1)
if typeof(aq.Format)=="function"then
local as,at=pcall(aq.Format,aq.Value,aq.Max,ar)
if as and at~=nil then
return tostring(at)
end
end
return tostring(math.floor((ar*100)+0.5)).."%"
end

local function Render()
for aq,ar in next,ap.Rows do
ar.Frame:Destroy()
end
ap.Rows={}

for aq,ar in next,ap.Meters do
local as=math.clamp(ar.Value/ar.Max,0,1)
local at=aa.NewRoundFrame(999,"Squircle",{
Name="Fill",
Size=UDim2.new(as,0,1,0),
ImageTransparency=0.08,
ImageColor3=ar.Color,
ThemeTag=not ar.Color and{
ImageColor3="Primary",
}or nil,
})

local au=aj("TextLabel",{
Name="Value",
Size=UDim2.new(0,52,0,18),
BackgroundTransparency=1,
Text=FormatValue(ar),
TextSize=12,
TextTransparency=0.22,
TextXAlignment="Right",
FontFace=Font.new(aa.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
})

local av=aj("Frame",{
Name="Meter",
LayoutOrder=aq,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.UIElements.List,
},{
aj("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
HorizontalAlignment="Left",
}),
aj("Frame",{
Name="Header",
Size=UDim2.new(1,0,0,18),
BackgroundTransparency=1,
},{
aj("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,-58,1,0),
BackgroundTransparency=1,
Text=ar.Title,
TextSize=13,
TextTransparency=0.1,
TextXAlignment="Left",
TextTruncate="AtEnd",
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
}),
au,
}),
aa.NewRoundFrame(999,"Squircle",{
Name="Track",
Size=UDim2.new(1,0,0,7),
ImageTransparency=0.9,
ClipsDescendants=true,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
at,
}),
ar.Desc and aj("TextLabel",{
Name="Desc",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=tostring(ar.Desc),
TextSize=12,
TextTransparency=0.42,
TextXAlignment="Left",
TextWrapped=true,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
})or nil,
})

ap.Rows[aq]={
Frame=av,
Fill=at,
ValueLabel=au,
}
end
end

function ap.SetValue(aq,ar,as)
local at=ap.Meters[ar]
local au=ap.Rows[ar]
if not at or not au then
return nil
end

at.Value=math.clamp(al.ToFiniteNumber(as)or at.Value,0,at.Max)
local av=math.clamp(at.Value/at.Max,0,1)
au.ValueLabel.Text=FormatValue(at)
ag.Play(au.Fill,"Fast",{
Size=UDim2.new(av,0,1,0),
},nil,nil,"Meter")
return at.Value
end

function ap.SetMeters(aq,ar)
ap.Meters=NormalizeMeters(ar)
Render()
return ap.Meters
end

Render()

return ap.__type,ap
end

return am end function a.an()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

function am.New(an,ao)
local ap={
__type="Timeline",
Title=ao.Title or"Timeline",
Desc=ao.Desc,
Items=al.NormalizeItems(ao.Items or ao.Events or{}),
UIElements={},
Rows={},
}

ap.TimelineFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=0,
Hover=ao.Hover==true,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.List=aj("Frame",{
Name="TimelineList",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.TimelineFrame.UIElements.Container,
},{
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
})

local function Render()
for aq,ar in next,ap.Rows do
ar:Destroy()
end
ap.Rows={}

for aq,ar in next,ap.Items do
local as=al.GetVariant(ar.Value)
local at=al.GetColor(ar.Color,as.Color)

local au=aa.NewRoundFrame(999,"Circle",{
Name="Dot",
Size=UDim2.new(0,10,0,10),
Position=UDim2.new(0.5,0,0,5),
AnchorPoint=Vector2.new(0.5,0),
ImageTransparency=1,
ImageColor3=at,
})

local av=aj("Frame",{
Name="Rail",
Size=UDim2.new(0,24,0,ar.Desc and 46 or 30),
BackgroundTransparency=1,
},{
aj("Frame",{
Name="Line",
Size=UDim2.new(0,1,1,aq==#ap.Items and-8 or 0),
Position=UDim2.new(0.5,0,0,16),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=0.86,
ThemeTag={
BackgroundColor3="TimelineLine",
},
}),
au,
})

local aw=aj("Frame",{
Name="Text",
Size=UDim2.new(1,-32,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
aj("UIListLayout",{
Padding=UDim.new(0,3),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
al.CreateText(aj,aa,ar.Title,14,Enum.FontWeight.SemiBold,0),
ar.Desc and al.CreateText(aj,aa,ar.Desc,13,Enum.FontWeight.Medium,0.4)or nil,
})

local ax=aj("Frame",{
Name="Item",
LayoutOrder=aq,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.UIElements.List,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
av,
aw,
})

table.insert(ap.Rows,ax)
task.delay((aq-1)*0.025,function()
if au.Parent then
ag.Play(au,"Reveal",{ImageTransparency=0},nil,nil,"Reveal")
end
end)
end
end

function ap.SetItems(aq,ar)
ap.Items=al.NormalizeItems(ar or{})
Render()
return ap.Items
end

Render()

return ap.__type,ap
end

return am end function a.ao()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

local an=34

function am.New(ao,ap)
local aq={
__type="Accordion",
Title=ap.Title or"Accordion",
Desc=ap.Desc,
Items=al.NormalizeItems(ap.Items or ap.Sections or{}),
OpenIndex=al.ToFiniteNumber(ap.OpenIndex or ap.DefaultOpen),
Multiple=ap.Multiple==true,
UIElements={},
Rows={},
}

local ar={}
if aq.OpenIndex then
ar[aq.OpenIndex]=true
end

aq.AccordionFrame=a.load'I'{
Title=aq.Title,
Desc=aq.Desc,
Parent=ap.Parent,
TextOffset=0,
Hover=ap.Hover==true,
Tab=ap.Tab,
Index=ap.Index,
Window=ap.Window,
ElementTable=aq,
ParentConfig=ap,
Tags=ap.Tags,
}

aq.UIElements.List=aj("Frame",{
Name="AccordionList",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=aq.AccordionFrame.UIElements.Container,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
})

local function GetOpenHeight(as)
return an+(as.Content.AbsoluteSize.Y/ap.UIScale)+10
end

local function SetRowOpen(as,at,au)
local av=aq.Rows[as]
if not av then
return
end

ar[as]=at or nil
av.Open=at

local aw=UDim2.new(1,0,0,at and GetOpenHeight(av)or an)
if au then
av.Frame.Size=aw
av.Chevron.Rotation=at and 180 or 0
else
ag.Play(av.Frame,"Expand",{Size=aw},nil,nil,"Expand")
ag.Play(av.Chevron,"Expand",{Rotation=at and 180 or 0},nil,nil,"Chevron")
end
end

local function Render()
for as,at in next,aq.Rows do
at.Frame:Destroy()
end
aq.Rows={}

for as,at in next,aq.Items do
local au=al.CreateIcon(aa,at.Icon,ap.Window.Folder,"Accordion",true,"AccordionIcon")
if au then
au.Size=UDim2.new(0,16,0,16)
end

local av=aa.Icon"chevron-down"
local aw=aj("ImageLabel",{
Name="Chevron",
Size=UDim2.new(0,16,0,16),
BackgroundTransparency=1,
Image=av[1],
ImageRectOffset=av[2].ImageRectPosition,
ImageRectSize=av[2].ImageRectSize,
ImageTransparency=0.4,
ThemeTag={
ImageColor3="Icon",
},
})

local ax=aj("TextButton",{
Name="Header",
Size=UDim2.new(1,0,0,an),
BackgroundTransparency=1,
Text="",
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
aj("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
au,
aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,au and-48 or-24,1,0),
BackgroundTransparency=1,
Text=at.Title,
TextSize=14,
TextTruncate="AtEnd",
TextXAlignment="Left",
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
}),
aw,
})

local ay=aj("Frame",{
Name="Content",
Size=UDim2.new(1,-20,0,0),
Position=UDim2.new(0,10,0,an),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
al.CreateText(aj,aa,at.Desc or"",13,Enum.FontWeight.Medium,0.4),
})

local az=aa.NewRoundFrame(12,"Squircle",{
Name="Item",
LayoutOrder=as,
Size=UDim2.new(1,0,0,an),
ClipsDescendants=true,
ImageTransparency=0.94,
ThemeTag={
ImageColor3="AccordionBackground",
},
Parent=aq.UIElements.List,
},{
ax,
ay,
})

aq.Rows[as]={
Frame=az,
Header=ax,
Content=ay,
Chevron=aw,
Open=false,
}

ag.AttachPress(ax,aa,{
Amount=0.985,
})

aa.AddSignal(ax.MouseButton1Click,function()
aq:Toggle(as)
end)

aa.AddSignal(ay:GetPropertyChangedSignal"AbsoluteSize",function()
if aq.Rows[as]and aq.Rows[as].Open then
SetRowOpen(as,true,true)
end
end)
end

for as in next,ar do
SetRowOpen(as,true,true)
end
end

function aq.Open(as,at)
if not aq.Multiple then
for au in next,ar do
if au~=at then
SetRowOpen(au,false)
end
end
end

SetRowOpen(at,true)
end

function aq.Close(as,at)
SetRowOpen(at,false)
end

function aq.Toggle(as,at)
local au=aq.Rows[at]
if not au then
return
end
if au.Open then
aq:Close(at)
else
aq:Open(at)
end
end

function aq.SetItems(as,at)
aq.Items=al.NormalizeItems(at or{})
ar={}
Render()
return aq.Items
end

Render()

return aq.__type,aq
end

return am end function a.ap()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'n'.New

local am={}

function am.New(an,ao)
local ap={
__type="EmptyState",
Title=ao.Title or"Nothing here",
Desc=ao.Desc or ao.Content,
Icon=ao.Icon or"inbox",
Buttons=ao.Buttons or{},
UIElements={},
}

local aq=math.max(tonumber(ao.Height)or 138,96)

ap.UIElements.Main=aa.NewRoundFrame(ao.Window.ElementConfig.UICorner,"Squircle",{
Name="EmptyState",
Size=UDim2.new(1,0,0,aq),
AutomaticSize=#ap.Buttons>0 and"Y"or"None",
ImageTransparency=0.94,
Parent=ao.Parent,
ThemeTag={
ImageColor3="ElementBackground",
},
},{
aj("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
}),
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})

local ar=aa.Image(ap.Icon,ap.Icon,0,ao.Window.Folder,"EmptyState",true,true,"EmptyStateIcon")
ar.Size=UDim2.new(0,tonumber(ao.IconSize)or 34,0,tonumber(ao.IconSize)or 34)
ar.ImageLabel.ImageTransparency=0.2
ar.Parent=ap.UIElements.Main

ap.UIElements.Title=aj("TextLabel",{
Name="Title",
BackgroundTransparency=1,
Text=ap.Title,
TextSize=17,
TextWrapped=true,
TextXAlignment="Center",
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
Parent=ap.UIElements.Main,
ThemeTag={
TextColor3="Text",
},
})

ap.UIElements.Desc=aj("TextLabel",{
Name="Desc",
BackgroundTransparency=1,
Text=ap.Desc or"",
TextSize=14,
TextTransparency=0.4,
TextWrapped=true,
TextXAlignment="Center",
AutomaticSize="Y",
Visible=ap.Desc~=nil,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
Parent=ap.UIElements.Main,
ThemeTag={
TextColor3="Text",
},
})

if#ap.Buttons>0 then
local as=aj("Frame",{
Name="Buttons",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ap.UIElements.Main,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Vertical",
HorizontalAlignment="Center",
}),
})

for at,au in next,ap.Buttons do
local av=al(
au.Title,
au.Icon,
au.Callback,
au.Variant or"White",
as,
nil,
nil,
ao.Window.NewElements and 999 or 10
)
av.Size=UDim2.new(1,0,0,36)
end
end

function ap.SetTitle(as,at)
ap.Title=at
ap.UIElements.Title.Text=at
end

function ap.SetDesc(as,at)
ap.Desc=at
ap.UIElements.Desc.Text=at or""
ap.UIElements.Desc.Visible=at~=nil
end

function ap.Highlight(as)
ag.Play(ap.UIElements.Main,"Highlight",{ImageTransparency=0.9},nil,nil,"Highlight")
task.delay(ag.GetDuration"Highlight",function()
if ap.UIElements.Main.Parent then
ag.Play(ap.UIElements.Main,"Highlight",{ImageTransparency=0.94},nil,nil,"Highlight")
end
end)
end

function ap.Destroy(as)
ap.UIElements.Main:Destroy()
end

return ap.__type,ap
end

return am end function a.aq()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

local an=Color3.fromHex"#5865F2"
local ao=Color3.fromHex"#1E1F2A"

local function Trim(ap)
ap=tostring(ap or"")
ap=string.gsub(ap,"^%s+","")
ap=string.gsub(ap,"%s+$","")
return ap
end

local function GetInviteUrl(ap)
local aq=Trim(ap)
if aq==""then
return"https://discord.gg/"
end

if string.match(aq,"^https?://")then
return aq
end
if string.match(aq,"^discord%.gg/")or string.match(aq,"^discord%.com/invite/")then
return"https://"..aq
end

return"https://discord.gg/"..aq
end

local function CopyText(ap)
if typeof(setclipboard)=="function"then
local aq=pcall(function()
setclipboard(ap)
end)
return aq
end
if typeof(toclipboard)=="function"then
local aq=pcall(function()
toclipboard(ap)
end)
return aq
end
return false
end

local function Notify(ap,aq,ar,as,at)
if ap and ap.Notify then
ap:Notify{
Title=aq,
Content=ar,
Icon=as,
Style=at,
}
end
end

function am.New(ap,aq)
local ar=aq.Url or aq.Invite or aq.InviteCode or aq.Code
local as=GetInviteUrl(ar)
local at={
__type="DiscordCard",
Title=aq.Title or aq.ServerName or"Discord Server",
Desc=aq.Desc or aq.Content or"Join the community and get updates.",
Invite=ar,
Url=as,
Icon=aq.Icon or"message-circle",
Members=aq.Members or aq.MemberCount,
Online=aq.Online or aq.OnlineCount,
Callback=aq.Callback,
UIElements={},
}

local au=math.max(tonumber(aq.Height)or 152,126)

at.UIElements.Main=aa.NewRoundFrame(aq.Window.ElementConfig.UICorner,"Squircle",{
Name="DiscordCard",
Size=UDim2.new(1,0,0,au),
AutomaticSize="Y",
ImageColor3=ao,
ImageTransparency=0,
Parent=aq.Parent,
},{
aj("UIGradient",{
Rotation=22,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,ao),
ColorSequenceKeypoint.new(1,an),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.02),
NumberSequenceKeypoint.new(1,0.18),
},
}),
aj("UIPadding",{
PaddingTop=UDim.new(0,14),
PaddingLeft=UDim.new(0,14),
PaddingRight=UDim.new(0,14),
PaddingBottom=UDim.new(0,14),
}),
aj("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
}),
})

local av=aj("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=at.UIElements.Main,
},{
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
})

local aw=aa.NewRoundFrame(999,"Squircle",{
Size=UDim2.new(0,42,0,42),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=0.9,
Parent=av,
},{
al.CreateIcon(aa,at.Icon,aq.Window.Folder,"DiscordCard",false,nil),
})

local ax=aw:FindFirstChildWhichIsA"Frame"or aw:FindFirstChildWhichIsA"ImageLabel"
if ax then
ax.Size=UDim2.new(0,20,0,20)
ax.Position=UDim2.new(0.5,0,0.5,0)
ax.AnchorPoint=Vector2.new(0.5,0.5)
local ay=al.GetImageTarget(ax)
if ay then
ay.ImageColor3=Color3.new(1,1,1)
ay.ImageTransparency=0
end
end

local ay=aj("Frame",{
Size=UDim2.new(1,-52,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=av,
},{
aj("UIListLayout",{
Padding=UDim.new(0,3),
FillDirection="Vertical",
HorizontalAlignment="Left",
}),
})

at.UIElements.Title=aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=at.Title,
TextSize=18,
TextWrapped=true,
TextXAlignment="Left",
TextColor3=Color3.new(1,1,1),
FontFace=Font.new(aa.Font,Enum.FontWeight.Bold),
Parent=ay,
})

at.UIElements.Desc=aj("TextLabel",{
Name="Desc",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=at.Desc,
TextSize=13,
TextWrapped=true,
TextXAlignment="Left",
TextColor3=Color3.new(1,1,1),
TextTransparency=0.26,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
Parent=ay,
})

local az=aj("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=at.Members~=nil or at.Online~=nil,
Parent=at.UIElements.Main,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Left",
VerticalAlignment="Center",
}),
})

local function CreateStat(aA,aB,aC)
return aa.NewRoundFrame(999,"Squircle",{
Size=UDim2.new(0,0,0,28),
AutomaticSize="X",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=0.9,
Parent=az,
},{
aj("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
aj("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aa.NewRoundFrame(999,"Circle",{
Size=UDim2.new(0,7,0,7),
ImageColor3=aC,
}),
aj("TextLabel",{
BackgroundTransparency=1,
Text=tostring(aB).." "..aA,
TextSize=12,
TextColor3=Color3.new(1,1,1),
TextTransparency=0.08,
AutomaticSize="XY",
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
}),
})
end

if at.Members then
CreateStat("members",at.Members,Color3.fromHex"#B6C2FF")
end
if at.Online then
CreateStat("online",at.Online,Color3.fromHex"#23A55A")
end

local aA=aj("Frame",{
Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,
Parent=at.UIElements.Main,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Center",
}),
})

local function CreateButton(aB,aC,aD,aE)
local aF=aa.NewRoundFrame(999,"Squircle",{
Size=UDim2.new(0.5,-4,1,0),
ImageColor3=aD=="Primary"and Color3.new(1,1,1)or Color3.new(1,1,1),
ImageTransparency=aD=="Primary"and 0.08 or 0.9,
Parent=aA,
},{
aj("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
aj("UIListLayout",{
Padding=UDim.new(0,7),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
al.CreateIcon(aa,aC,aq.Window.Folder,"DiscordCard",false,nil),
aj("TextLabel",{
BackgroundTransparency=1,
Text=aB,
TextSize=13,
TextColor3=aD=="Primary"and Color3.fromHex"#111827"or Color3.new(1,1,1),
TextTransparency=0,
FontFace=Font.new(aa.Font,Enum.FontWeight.Bold),
AutomaticSize="XY",
}),
},true)

local aG=aF:FindFirstChildWhichIsA"Frame"or aF:FindFirstChildWhichIsA"ImageLabel"
local aH=al.GetImageTarget(aG)
if aH then
aH.ImageColor3=aD=="Primary"and Color3.fromHex"#111827"or Color3.new(1,1,1)
aH.ImageTransparency=0
end

ag.AttachPress(aF,aa,{
Amount=0.97,
})

aa.AddSignal(aF.MouseButton1Click,function()
aa.SafeCallback(aE)
end)

return aF
end

local function CopyInvite(aB)
if CopyText(at.Url)then
Notify(aq.WindUI,aB or"Discord link copied",at.Url,"check","Success")
return true
else
Notify(aq.WindUI,"Discord invite",at.Url,"link","Warning")
return false
end
end

CreateButton(aq.CopyTitle or"Copy Link","link","Secondary",function()
CopyInvite"Discord link copied"
end)

CreateButton(aq.JoinTitle or"Join","external-link","Primary",function()
if at.Callback then
aa.SafeCallback(at.Callback,at.Url,at)
end

CopyInvite"Discord invite ready"
end)

function at.SetInvite(aB,aC)
at.Invite=aC
at.Url=GetInviteUrl(aC)
return at.Url
end

function at.GetUrl(aB)
return at.Url
end

function at.Copy(aB)
return CopyInvite"Discord link copied"
end

function at.Open(aB)
if at.Callback then
aa.SafeCallback(at.Callback,at.Url,at)
end
return CopyInvite"Discord invite ready"
end

function at.SetTitle(aB,aC)
at.Title=aC
at.UIElements.Title.Text=aC
end

function at.SetDesc(aB,aC)
at.Desc=aC
at.UIElements.Desc.Text=aC or""
end

function at.Highlight(aB)
ag.Play(at.UIElements.Main,"Highlight",{ImageTransparency=0.08},nil,nil,"Highlight")
task.delay(ag.GetDuration"Highlight",function()
if at.UIElements.Main.Parent then
ag.Play(at.UIElements.Main,"Highlight",{ImageTransparency=0},nil,nil,"Highlight")
end
end)
end

function at.Destroy(aB)
at.UIElements.Main:Destroy()
end

return at.__type,at
end

return am end function a.ar()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

function am.New(an,ao)
local ap={
__type="TabBox",
Title=ao.Title or"Tabs",
Desc=ao.Desc,
Tabs={},
Selected=nil,
SelectedValue=nil,
UIElements={},
}

ap.TabBoxFrame=a.load'I'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=0,
Hover=ao.Hover==true,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

ap.UIElements.Tabs=aj("ScrollingFrame",{
Name="Tabs",
Size=UDim2.new(1,0,0,ao.TabHeight or 36),
BackgroundTransparency=1,
ScrollBarThickness=0,
ScrollingDirection="X",
ScrollingEnabled=true,
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
ElasticBehavior="Never",
Active=true,
Parent=ap.TabBoxFrame.UIElements.Container,
},{
aj("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

ap.UIElements.Pages=aj("Frame",{
Name="Pages",
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=1,
ClipsDescendants=false,
Parent=ap.TabBoxFrame.UIElements.Container,
})

local function UpdateTabVisuals()
for aq,ar in next,ap.Tabs do
local as=ap.Selected==aq
ag.Play(ar.Button,"Switch",{ImageTransparency=as and 0.82 or 0.94},nil,nil,"State")
ag.Play(ar.TitleLabel,"Switch",{TextTransparency=as and 0 or 0.25},nil,nil,"State")
if ar.IconTarget then
ag.Play(ar.IconTarget,"Switch",{ImageTransparency=as and 0 or 0.35},nil,nil,"State")
end
end
end

local function GetPageHeight(aq)
local ar=aq.UIElements.Container.UIListLayout
local as=ao.Window.ElementConfig.UIPadding/2
local at=ar.AbsoluteContentSize.Y/ao.UIScale+as
return math.max(at,as)
end

local function UpdatePageHeight(aq)
if not aq or not aq.UIElements.Container then
return
end

local ar=GetPageHeight(aq)
aq.UIElements.Container.Size=UDim2.new(1,0,0,ar)
ap.UIElements.Pages.Size=UDim2.new(1,0,0,ar)
return ar
end

local function ScrollTabIntoView(aq)
task.defer(function()
if not aq or not aq.Button or not aq.Button.Parent then
return
end

local ar=ap.UIElements.Tabs
local as=ar.AbsoluteSize.X
local at=aq.Button.AbsolutePosition.X-ar.AbsolutePosition.X+ar.CanvasPosition.X
local au=at+aq.Button.AbsoluteSize.X
local av=ar.CanvasPosition.X
local aw=av+as
local ax=av

if at<av then
ax=at
elseif au>aw then
ax=au-as
end

if math.abs(ax-av)>1 then
ar.CanvasPosition=Vector2.new(math.max(ax,0),0)
end
end)
end

local function QueuePageHeightUpdate(aq,ar)
task.defer(function()
if ap.Selected==ar and aq and aq.UIElements.Container.Parent then
UpdatePageHeight(aq)
end
end)
end

function ap.Select(aq,ar)
local as=ap.Tabs[ar]
if not as then
return nil
end

ap.Selected=ar
ap.SelectedValue=as.Value
for at,au in next,ap.Tabs do
local av=at==ar
au.UIElements.Container.Visible=av
au.UIElements.Container.Active=av
au.UIElements.Container.GroupTransparency=1
if av then
au.UIElements.Container.Position=UDim2.new(0,0,0,8)
end
end

UpdatePageHeight(as)
ag.Play(as.UIElements.Container,"Switch",{GroupTransparency=0},nil,nil,"Page")
ag.Play(as.UIElements.Container,"Switch",{Position=UDim2.new(0,0,0,0)},nil,nil,"PageSlide")
QueuePageHeightUpdate(as,ar)
UpdateTabVisuals()
ScrollTabIntoView(as)
return as
end

function ap.GetSelected(aq)
return ap.Selected and ap.Tabs[ap.Selected]or nil
end

function ap.Get(aq)
return ap.SelectedValue
end

function ap.SelectValue(aq,ar)
for as,at in next,ap.Tabs do
if at.Value==ar then
return ap:Select(as)
end
end
return nil
end

function ap.Set(aq,ar)
return ap:SelectValue(ar)
end

function ap.Tab(aq,ar)
ar=ar or{}
local as=#ap.Tabs+1
local at={
__type="TabBoxPage",
Title=ar.Title or("Tab "..tostring(as)),
Value=ar.Value or ar.Id or as,
Icon=ar.Icon,
Elements={},
UIElements={},
Gap=ao.Tab and ao.Tab.Gap or 6,
}

local au=al.CreateIcon(aa,at.Icon,ao.Window.Folder,"TabBox",true,"TabBoxIcon")
if au then
au.Size=UDim2.new(0,15,0,15)
end
local av=al.GetImageTarget(au)
local aw=string.len(at.Title)*(ao.Window.IsPC==false and 6 or 7)
local ax=math.clamp(aw+(au and 40 or 26),ao.MinTabWidth or 68,ao.MaxTabWidth or 154)

local ay=aj("TextLabel",{
Name="Title",
BackgroundTransparency=1,
Text=at.Title,
TextSize=ao.Window.IsPC==false and 12 or 13,
TextTruncate="AtEnd",
Size=UDim2.new(0,math.max(ax-(au and 42 or 20),24),1,0),
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
})

local az=aa.NewRoundFrame(999,"Squircle",{
Name="Tab",
LayoutOrder=as,
Size=UDim2.new(0,ax,0,ao.TabButtonHeight or 30),
ImageTransparency=0.94,
ClipsDescendants=true,
ThemeTag={
ImageColor3="TabBoxTabBackground",
},
Parent=ap.UIElements.Tabs,
},{
aj("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
aj("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
au,
ay,
},true)

local aA=aj("CanvasGroup",{
Name="Page",
LayoutOrder=as,
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
GroupTransparency=1,
Visible=false,
Active=false,
Parent=ap.UIElements.Pages,
},{
aj("UIPadding",{
PaddingTop=UDim.new(0,ao.Window.ElementConfig.UIPadding/2),
}),
aj("UIListLayout",{
Padding=UDim.new(0,at.Gap),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

at.Button=az
at.TitleLabel=ay
at.Icon=au
at.IconTarget=av
at.ElementFrame=aA
at.UIElements.Container=aA
at.UIElements.Title=ay

ao.ElementsModule.Load(
at,
aA,
ao.ElementsModule.Elements,
ao.Window,
ao.WindUI,
function()
QueuePageHeightUpdate(at,as)
end,
ao.ElementsModule,
ao.UIScale,
ao.Tab
)

function at.Select(aB)
return ap:Select(as)
end

function at.Destroy(aB)
az:Destroy()
aA:Destroy()
table.remove(ap.Tabs,as)
if ap.Selected==as then
ap.Selected=nil
if ap.Tabs[1]then
ap:Select(1)
end
end
end

ap.Tabs[as]=at

ag.AttachPress(az,aa,{
Amount=0.97,
})

aa.AddSignal(az.MouseButton1Click,function()
ap:Select(as)
end)

aa.AddSignal(aA.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
QueuePageHeightUpdate(at,as)
end)

if not ap.Selected or ar.Selected==true or ar.Value==ao.Value then
ap:Select(as)
else
UpdateTabVisuals()
end

if typeof(ar.Elements)=="function"then
task.defer(function()
aa.SafeCallback(ar.Elements,at)
end)
end

return at
end

function ap.CreateTab(aq,ar)
return ap:Tab(ar)
end

for aq,ar in next,ao.Tabs or{}do
ap:Tab(ar)
end

return ap.__type,ap
end

return am end function a.as()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

local an={
Vector2.new(0.08,0.72),
Vector2.new(0.28,0.38),
Vector2.new(0.52,0.56),
Vector2.new(0.72,0.24),
Vector2.new(0.92,0.42),
}

local ao=92
local ap=22

local function NormalizePoint(aq)
if typeof(aq)=="Vector2"then
return Vector2.new(math.clamp(aq.X,0,1),math.clamp(aq.Y,0,1))
end

if typeof(aq)=="table"then
local ar=al.ToFiniteNumber(aq.X or aq.x or aq[1])or 0
local as=al.ToFiniteNumber(aq.Y or aq.y or aq[2])or 0
return Vector2.new(math.clamp(ar,0,1),math.clamp(as,0,1))
end

return Vector2.new(0,0)
end

local function NormalizePoints(aq)
local ar={}
local as=typeof(aq)=="table"and aq or an

if#as>0 then
for at=1,#as do
table.insert(ar,NormalizePoint(as[at]))
end
else
for at,au in next,as do
table.insert(ar,NormalizePoint(au))
end
end

if#ar<2 then
ar=an
end

return ar
end

local function PointToUDim2(aq)
return UDim2.new(aq.X,0,aq.Y,0)
end

local function PixelToUDim2(aq)
return UDim2.fromOffset(aq.X,aq.Y)
end

local function GetTweenPoint(aq,ar,as)
return aq:Lerp(ar,math.clamp(as,0,1))
end

local function GetAngle(aq,ar)
if math.atan2 then
return math.atan2(aq,ar)
end

if ar==0 then
return aq>=0 and math.pi/2 or-math.pi/2
end

local as=math.atan(aq/ar)
if ar<0 then
as+=math.pi
end
return as
end

function am.New(aq,ar)
local as={
__type="Path2D",
Title=ar.Title or"Path 2D",
Desc=ar.Desc,
Points=NormalizePoints(ar.Points or ar.Path),
Labels=ar.Labels or{},
Height=math.max(al.ToFiniteNumber(ar.Height)or 156,96),
Thickness=math.max(al.ToFiniteNumber(ar.Thickness)or 4,2),
Padding=math.max(al.ToFiniteNumber(ar.PathPadding or ar.Padding)or 20,0),
DotSize=math.max(al.ToFiniteNumber(ar.DotSize)or 9,5),
MarkerSize=math.max(al.ToFiniteNumber(ar.MarkerSize)or 16,10),
Duration=math.max(al.ToFiniteNumber(ar.Duration)or 1.2,0.18),
StepDelay=math.max(al.ToFiniteNumber(ar.StepDelay)or 0.055,0),
Loop=ar.Loop==true,
AutoPlay=ar.AutoPlay~=false,
Glow=ar.Glow~=false,
UIElements={},
Segments={},
Dots={},
LabelObjects={},
PlayToken=0,
HasRendered=false,
Destroyed=false,
}

as.Path2DFrame=a.load'I'{
Title=as.Title,
Desc=as.Desc,
Parent=ar.Parent,
TextOffset=0,
Hover=ar.Hover==true,
Tab=ar.Tab,
Index=ar.Index,
Window=ar.Window,
ElementTable=as,
ParentConfig=ar,
Tags=ar.Tags,
}

as.UIElements.Canvas=aa.NewRoundFrame(ar.Window.ElementConfig.UICorner,"Squircle",{
Name="Path2DCanvas",
Size=UDim2.new(1,0,0,as.Height),
ClipsDescendants=true,
ImageTransparency=aa.ClampTransparency(ar.BackgroundTransparency,0.92),
Parent=as.Path2DFrame.UIElements.Container,
ThemeTag={
ImageColor3="Path2DBackground",
},
},{
aj("UIGradient",{
Rotation=25,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.08),
NumberSequenceKeypoint.new(1,0.28),
},
}),
})

local function ClearObjects()
for at,au in next,as.Segments do
au.Track:Destroy()
end
for at,au in next,as.Dots do
au:Destroy()
end
for at,au in next,as.LabelObjects do
au:Destroy()
end
if as.UIElements.Marker then
as.UIElements.Marker:Destroy()
as.UIElements.Marker=nil
end

as.Segments={}
as.Dots={}
as.LabelObjects={}
end

local function GetCanvasSize()
local at=as.UIElements.Canvas.AbsoluteSize
return Vector2.new(at.X/ar.UIScale,at.Y/ar.UIScale)
end

local function GetPixelPoint(at,au)
local av=math.min(as.Padding,math.max(au.X,au.Y)/3)
local aw=Vector2.new(
math.max(au.X-(av*2),1),
math.max(au.Y-(av*2),1)
)

return Vector2.new(
av+(at.X*aw.X),
av+(at.Y*aw.Y)
)
end

local function GetLabelPosition(at,au,av)
local aw=math.max(al.ToFiniteNumber(av.Width)or ao,54)
local ax=math.max(al.ToFiniteNumber(av.Height)or ap,18)
local ay=al.ToFiniteNumber(av.OffsetX)or 0
local az=al.ToFiniteNumber(av.OffsetY)
if az==nil then
az=av.Above==false and 18 or-18
end

return Vector2.new(
math.clamp(at.X+ay,(aw/2)+6,math.max((aw/2)+6,au.X-(aw/2)-6)),
math.clamp(at.Y+az,(ax/2)+6,math.max((ax/2)+6,au.Y-(ax/2)-6))
),aw,ax
end

function as.Render(at,au)
local av=GetCanvasSize()
if av.X<=0 or av.Y<=0 then
return
end

local aw=au~=false and as.AutoPlay
as.PlayToken=as.PlayToken+1
as.HasRendered=true
ClearObjects()

for ax=1,#as.Points-1 do
local ay=GetPixelPoint(as.Points[ax],av)
local az=GetPixelPoint(as.Points[ax+1],av)
local aA=az-ay
local aB=aA.Magnitude
local aC=math.deg(GetAngle(aA.Y,aA.X))
local aD=(ay+az)/2

local aE=aa.NewRoundFrame(999,"Squircle",{
Name="Segment"..tostring(ax),
Size=UDim2.new(0,aB,0,as.Thickness),
Position=PixelToUDim2(aD),
AnchorPoint=Vector2.new(0.5,0.5),
Rotation=aC,
ImageTransparency=0.84,
Parent=as.UIElements.Canvas,
ZIndex=2,
ThemeTag={
ImageColor3="Path2DTrack",
},
})

local aF=as.Glow and aa.NewRoundFrame(999,"Squircle",{
Name="Glow",
Size=UDim2.new(0,aw and 0 or aB,0,as.Thickness+8),
Position=UDim2.new(0,0,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=0.84,
ZIndex=2,
Parent=aE,
ThemeTag={
ImageColor3="Path2DLine",
},
})or nil

local aG=aa.NewRoundFrame(999,"Squircle",{
Name="Fill",
Size=UDim2.new(0,aw and 0 or aB,1,0),
ImageTransparency=0,
ZIndex=3,
Parent=aE,
ThemeTag={
ImageColor3="Path2DLine",
},
})

table.insert(as.Segments,{
Track=aE,
Glow=aF,
Fill=aG,
Length=aB,
From=as.Points[ax],
To=as.Points[ax+1],
FromPixel=ay,
ToPixel=az,
FromPosition=PixelToUDim2(ay),
ToPosition=PixelToUDim2(az),
})
end

for ax=1,#as.Points do
local ay=as.Points[ax]
local az=GetPixelPoint(ay,av)
local aA=ax==1 and as.DotSize+3 or as.DotSize
local aB=aa.NewRoundFrame(999,"Circle",{
Name="Point"..tostring(ax),
Size=UDim2.new(0,aA,0,aA),
Position=PixelToUDim2(az),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=aw and 0.54 or 0.12,
Parent=as.UIElements.Canvas,
ZIndex=4,
ThemeTag={
ImageColor3=ax==#as.Points and"Path2DMarker"or"Path2DLine",
},
},{
aa.NewRoundFrame(999,"Circle",{
Name="DotCore",
Size=UDim2.new(0,math.max(aA-5,3),0,math.max(aA-5,3)),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=0.22,
ZIndex=5,
}),
})
table.insert(as.Dots,aB)
end

for ax,ay in next,as.Labels do
if typeof(ay)~="table"then
ay={
Text=tostring(ay),
}
end
local az=math.clamp(math.floor(al.ToFiniteNumber(ay.Point or ay.Index)or 1),1,#as.Points)
local aA=GetPixelPoint(as.Points[az],av)
local aB,aC,aD=GetLabelPosition(aA,av,ay)
local aE=aj("TextLabel",{
Name="PathLabel",
Size=UDim2.new(0,aC,0,aD),
Position=PixelToUDim2(aB),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Text=tostring(ay.Text or ay.Title or az),
TextSize=12,
TextTransparency=0.22,
TextXAlignment="Center",
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
Parent=as.UIElements.Canvas,
ZIndex=6,
ThemeTag={
TextColor3="Path2DLabel",
},
})
table.insert(as.LabelObjects,aE)
end

local ax=aa.NewRoundFrame(999,"Circle",{
Name="Marker",
Size=UDim2.new(0,as.MarkerSize,0,as.MarkerSize),
Position=aw and as.Segments[1]and as.Segments[1].FromPosition
or PixelToUDim2(GetPixelPoint(as.Points[#as.Points],av)),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=0,
Parent=as.UIElements.Canvas,
ZIndex=8,
ThemeTag={
ImageColor3="Path2DMarker",
},
},{
aa.NewRoundFrame(999,"Circle",{
Name="Halo",
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=0.78,
ZIndex=7,
ThemeTag={
ImageColor3="Path2DMarker",
},
}),
aa.NewRoundFrame(999,"Circle",{
Name="Core",
Size=UDim2.new(0,6,0,6),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageColor3=Color3.new(1,1,1),
ZIndex=9,
}),
})
as.UIElements.Marker=ax

if aw then
as:Play()
end
end

function as.Play(at)
as.PlayToken=as.PlayToken+1
local au=as.PlayToken
local av=as.Duration/math.max(#as.Segments,1)

if as.UIElements.Marker then
as.UIElements.Marker.Position=as.Segments[1]and as.Segments[1].FromPosition
or PointToUDim2(as.Points[1])
end
for aw,ax in next,as.Dots do
ax.ImageTransparency=0.72
end
for aw,ax in next,as.Segments do
ax.Fill.Size=UDim2.new(0,0,1,0)
if ax.Glow then
ax.Glow.Size=UDim2.new(0,0,0,as.Thickness+8)
end
end

for aw=1,#as.Segments do
local ax=as.Segments[aw]
local ay=(aw-1)*(av+as.StepDelay)
task.delay(ay,function()
if au~=as.PlayToken or as.Destroyed then
return
end

if as.Dots[aw]then
ag.Play(as.Dots[aw],"Reveal",{ImageTransparency=0.12},nil,nil,"Point")
end
ag.Play(
ax.Fill,
av,
{Size=UDim2.new(0,ax.Length,1,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Draw"
)
if ax.Glow then
ag.Play(
ax.Glow,
av,
{Size=UDim2.new(0,ax.Length,0,as.Thickness+8)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Glow"
)
end
if as.UIElements.Marker then
ag.Play(
as.UIElements.Marker,
av,
{Position=ax.ToPosition},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Path"
)
end
end)
end

local aw=#as.Segments*(av+as.StepDelay)
task.delay(aw,function()
if au~=as.PlayToken or as.Destroyed then
return
end
if as.Dots[#as.Dots]then
ag.Play(as.Dots[#as.Dots],"Reveal",{ImageTransparency=0},nil,nil,"Point")
end
if as.Loop then
task.delay(0.4,function()
if au==as.PlayToken and not as.Destroyed then
as:Play()
end
end)
end
end)
end

function as.Stop(at)
as.PlayToken=as.PlayToken+1
if as.UIElements.Marker then
ag.Cancel(as.UIElements.Marker,"Path")
end
for au,av in next,as.Segments do
ag.Cancel(av.Fill,"Draw")
if av.Glow then
ag.Cancel(av.Glow,"Glow")
end
end
end

function as.SetProgress(at,au)
as:Stop()
local av=math.clamp(al.ToFiniteNumber(au)or 0,0,1)
if#as.Segments==0 then
return av
end

local aw=math.max(#as.Segments,1)
local ax=av*aw

for ay=1,#as.Segments do
local az=as.Segments[ay]
local aA=math.clamp(ax-(ay-1),0,1)
az.Fill.Size=UDim2.new(0,az.Length*aA,1,0)
if az.Glow then
az.Glow.Size=UDim2.new(0,az.Length*aA,0,as.Thickness+8)
end
end

local ay=math.clamp(math.ceil(ax),1,#as.Segments)
local az=as.Segments[ay]
if az and as.UIElements.Marker then
local aA=math.clamp(ax-(ay-1),0,1)
as.UIElements.Marker.Position=PixelToUDim2(
GetTweenPoint(az.FromPixel,az.ToPixel,aA)
)
end

for aA=1,#as.Dots do
local aB=as.Dots[aA]
aB.ImageTransparency=aA<=math.floor(ax)+1 and 0.12 or 0.54
end

return av
end

function as.SetPoints(at,au)
as.Points=NormalizePoints(au)
as:Render(true)
return as.Points
end

function as.Destroy(at)
as.Destroyed=true
as:Stop()
as.Path2DFrame:Destroy()
end

aa.AddSignal(as.UIElements.Canvas:GetPropertyChangedSignal"AbsoluteSize",function()
as:Render(not as.HasRendered)
end)

task.defer(function()
as:Render(true)
end)

return as.__type,as
end

return am end function a.at()

local aa=a.load'd'
local ag=a.load'e'
local aj=aa.New

local al=a.load'af'

local am={}

local function GetText(an,ao)
if an==nil then
return ao
end
return tostring(an)
end

local function GetCardColor(an,ao)
return al.GetColor(an,ao)
end

function am.New(an,ao)
local ap={
__type="Card",
Title=GetText(ao.Title,"Card"),
Desc=ao.Desc or ao.Content,
Icon=ao.Icon,
Image=ao.Image or ao.Background or ao.BackgroundImage,
Callback=ao.Callback,
OpenTab=ao.OpenTab==true or ao.CardTab==true or typeof(ao.Build)=="function",
Elements={},
UIElements={},
ElementFrame=nil,
LinkCorners=ao.LinkCorners,
CornerGroup=ao.CornerGroup or ao.LinkCornerGroup,
CornerBreak=ao.CornerBreak,
CornerBreakBefore=ao.CornerBreakBefore,
CornerBreakAfter=ao.CornerBreakAfter,
}

local aq=ao.Radius or ao.Window.ElementConfig.UICorner
local ar=GetCardColor(ao.Color or ao.Accent,nil)
local as=tonumber(ao.Height)or 0
local at=typeof(ap.Callback)=="function"or ap.OpenTab
local au
local av
local aw

ap.UIElements.Main,au=aa.NewRoundFrame(aq,"Squircle",{
Name="Card",
Size=UDim2.new(1,0,0,as),
AutomaticSize="Y",
ImageTransparency=1,
Parent=ao.Parent,
ClipsDescendants=true,
},{},at)
ap.ElementFrame=ap.UIElements.Main

ap.UIElements.Background=aj("Frame",{
Name="Background",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=aa.ClampTransparency(
ao.Transparency,
ao.Window.LiquidGlass and 0.84 or 0.9
),
BackgroundColor3=ar or nil,
ZIndex=0,
Parent=ap.UIElements.Main,
ThemeTag=ar and nil or{
BackgroundColor3="ElementBackground",
},
},{
aj("UICorner",{
CornerRadius=UDim.new(0,aq),
}),
})
av=ap.UIElements.Background.UICorner

ap.UIElements.Content=aj("Frame",{
Name="Content",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
ZIndex=2,
Parent=ap.UIElements.Main,
},{
aj("UIPadding",{
PaddingTop=UDim.new(0,ao.Padding or 14),
PaddingLeft=UDim.new(0,ao.Padding or 14),
PaddingRight=UDim.new(0,ao.Padding or 14),
PaddingBottom=UDim.new(0,ao.Padding or 14),
}),
aj("UIListLayout",{
Padding=UDim.new(0,ao.Gap or 12),
FillDirection="Vertical",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

if ap.Image then
ap.UIElements.Image=aa.Image(ap.Image,ap.Title.."-card-image",0,ao.Window.Folder,"Card",false,false)
ap.UIElements.Image.Size=UDim2.new(1,0,1,0)
ap.UIElements.Image.Position=UDim2.new(0.5,0,0.5,0)
ap.UIElements.Image.AnchorPoint=Vector2.new(0.5,0.5)
ap.UIElements.Image.Parent=ap.UIElements.Main
ap.UIElements.Image.ZIndex=0

local ax=al.GetImageTarget(ap.UIElements.Image)
if ax then
ax.ZIndex=0
ax.ImageTransparency=ao.ImageTransparency or 0.32
ax.ScaleType=ao.ScaleType or Enum.ScaleType.Crop
aw=aj("UICorner",{
CornerRadius=UDim.new(0,aq),
Parent=ax,
})
end
end

local ax=aj("Frame",{
Name="Header",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
LayoutOrder=1,
Parent=ap.UIElements.Content,
},{
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
})

if ap.Icon then
local ay=al.CreateIcon(aa,ap.Icon,ao.Window.Folder,"Card",true,"CardIcon")
if ay then
ay.Size=UDim2.new(0,22,0,22)
ay.Parent=ax
local az=al.GetImageTarget(ay)
if az and ar then
az.ImageColor3=ar
az.ImageTransparency=0
end
end
end

local ay=aj("Frame",{
Name="Texts",
Size=UDim2.new(1,ap.Icon and-32 or 0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ax,
},{
aj("UIListLayout",{
Padding=UDim.new(0,3),
FillDirection="Vertical",
HorizontalAlignment="Left",
}),
})

ap.UIElements.Title=aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ap.Title,
TextSize=ao.TitleSize or 17,
TextTransparency=0.02,
TextXAlignment="Left",
TextWrapped=true,
FontFace=Font.new(aa.Font,Enum.FontWeight.Bold),
Parent=ay,
ThemeTag={
TextColor3="Text",
},
})

ap.UIElements.Desc=aj("TextLabel",{
Name="Desc",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ap.Desc or"",
TextSize=ao.DescSize or 13,
TextTransparency=0.34,
TextXAlignment="Left",
TextWrapped=true,
Visible=ap.Desc~=nil,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
Parent=ay,
ThemeTag={
TextColor3="Text",
},
})

ap.UIElements.Body=aj("Frame",{
Name="Body",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
LayoutOrder=2,
Parent=ap.UIElements.Content,
},{
aj("UIListLayout",{
Padding=UDim.new(0,ao.BodyGap or(ao.Window.NewElements and 6 or 8)),
FillDirection="Vertical",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

local function EnsureActions()
if ap.UIElements.Actions then
return ap.UIElements.Actions
end

ap.UIElements.Actions=aj("Frame",{
Name="Actions",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
LayoutOrder=3,
Parent=ap.UIElements.Content,
},{
aj("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Vertical",
HorizontalAlignment="Left",
SortOrder="LayoutOrder",
}),
})

return ap.UIElements.Actions
end

local function CreateActionButton(az,aA)
az=az or{}
local aB=GetCardColor(az.Color,ar)
local aC=aa.NewRoundFrame(az.Radius or 14,"Squircle",{
Name=az.Name or"CardButton",
Size=UDim2.new(1,0,0,az.Height or 44),
ImageColor3=aB or nil,
ImageTransparency=az.Transparency or(aB and 0.18 or 0.9),
Parent=EnsureActions(),
ThemeTag=aB and nil or{
ImageColor3="ElementBackground",
},
},{
aj("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
aj("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
al.CreateIcon(aa,az.Icon or"arrow-right",ao.Window.Folder,"Card",not aB,"CardButtonIcon"),
aj("TextLabel",{
Name="Title",
Size=UDim2.new(1,-34,1,0),
BackgroundTransparency=1,
Text=GetText(az.Title or az.Name,"Open"),
TextSize=az.TextSize or 14,
TextTransparency=0.04,
TextXAlignment="Left",
TextTruncate="AtEnd",
FontFace=Font.new(aa.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
}),
},true)

local aD=aC:FindFirstChildWhichIsA"Frame"or aC:FindFirstChildWhichIsA"ImageLabel"
local aE=al.GetImageTarget(aD)
if aE and aB then
aE.ImageColor3=aB
aE.ImageTransparency=0
end

ag.AttachPress(aC,aa,{
Amount=0.975,
})
aa.AddSignal(aC.MouseButton1Click,function()
if aA then
aA()
end
if typeof(az.Callback)=="function"then
aa.SafeCallback(az.Callback,ap)
end
end)

return aC
end

local az
local function CreateCardTab(aA)
aA=aA or{}
local aB=aA.Tab

if typeof(aB)~="table"and aA.CreateTab~=false and ao.Window and ao.Window.Tab then
aB=ao.Window:Tab{
Title=aA.TabTitle or aA.Title or ap.Title,
Desc=aA.TabDesc or aA.Desc,
Icon=aA.TabIcon or aA.Icon or ap.Icon or"panels-top-left",
ShowTabTitle=aA.ShowTabTitle,
Golden=aA.Golden,
Premium=aA.Premium,
LinkCorners=aA.LinkCorners,
Gap=aA.Gap,
}

if typeof(aA.Build)=="function"then
aa.SafeCallback(aA.Build,aB,ap)
end
end

return{
Tab=aB,
Select=function()
if aB and aB.Select then
return aB:Select()
end
end,
}
end

function ap.CardButton(aA,aB)
return CreateActionButton(aB)
end

function ap.CardTab(aA,aB)
aB=aB or{}
local aC=CreateCardTab(aB)

local aD=CreateActionButton({
Title=aB.Title or"Open Card Tab",
Icon=aB.Icon or"panels-top-left",
Color=aB.Color,
Callback=aB.Callback,
},function()
aC.Select()
end)

aC.Button=aD
return aC
end

if ap.OpenTab then
local aA=typeof(ao.CardTab)=="table"and ao.CardTab or{}
az=CreateCardTab{
Tab=ao.TabTarget or ao.Page or aA.Tab,
CreateTab=ao.CreateTab~=false and aA.CreateTab~=false,
Title=ao.TabTitle or ao.PageTitle or aA.Title or ap.Title,
TabTitle=ao.TabTitle or ao.PageTitle or aA.TabTitle or ap.Title,
TabDesc=ao.TabDesc or ao.PageDesc or aA.TabDesc or ap.Desc,
Icon=ao.TabIcon or ao.PageIcon or aA.Icon or ap.Icon,
TabIcon=ao.TabIcon or ao.PageIcon or aA.TabIcon or ap.Icon,
ShowTabTitle=ao.ShowTabTitle or aA.ShowTabTitle,
Golden=ao.Golden or aA.Golden,
Premium=ao.Premium or aA.Premium,
LinkCorners=ao.PageLinkCorners or aA.LinkCorners,
Gap=ao.PageGap or aA.Gap,
Build=ao.Build or aA.Build,
}

ap.Page=az.Tab
ap.PageController=az
end

function ap.Open(aA)
if az then
return az.Select()
end
if typeof(ap.Callback)=="function"then
return aa.SafeCallback(ap.Callback,ap)
end
end

function ap.GetPage(aA)
return az and az.Tab
end

function ap.SetPage(aA,aB)
az={
Tab=aB,
Select=function()
if aB and aB.Select then
return aB:Select()
end
end,
}
ap.Page=aB
ap.PageController=az
return{
Tab=aB,
Select=az.Select,
}
end

if at then
ag.AttachPress(ap.UIElements.Main,aa,{
Amount=0.985,
})
aa.AddSignal(ap.UIElements.Main.MouseButton1Click,function()
if az then
az.Select()
end
if typeof(ap.Callback)=="function"then
aa.SafeCallback(ap.Callback,ap)
end
end)
end

local aA=ao.ElementsModule
aA.Load(
ap,
ap.UIElements.Body,
aA.Elements,
ao.Window,
ao.WindUI,
nil,
aA,
ao.UIScale,
ao.Tab
)

function ap.SetTitle(aB,aC)
ap.Title=tostring(aC or"")
ap.UIElements.Title.Text=ap.Title
end

function ap.SetDesc(aB,aC)
ap.Desc=aC
ap.UIElements.Desc.Text=tostring(aC or"")
ap.UIElements.Desc.Visible=aC~=nil
end

function ap.Highlight(aB)
ag.Play(ap.UIElements.Background,"Highlight",{BackgroundTransparency=0.78},nil,nil,"CardHighlight")
task.delay(ag.GetDuration"Highlight",function()
if ap.UIElements.Main.Parent then
ag.Play(
ap.UIElements.Background,
"Highlight",
{
BackgroundTransparency=aa.ClampTransparency(
ao.Transparency,
ao.Window.LiquidGlass and 0.84 or 0.9
),
},
nil,
nil,
"CardHighlight"
)
end
end)
end

function ap.UpdateShape(aB)
local aC=ao.Window.ElementConfig.LinkCorners
or ap.LinkCorners
or(ao.ParentTable and ao.ParentTable.LinkCorners==true)

local aD={
TopLeft=true,
TopRight=true,
BottomLeft=true,
BottomRight=true,
}
local aE="Squircle"

if aC and aB and aB.Elements then
local aF=ao.ParentConfig
and ao.ParentConfig.ParentTable
and ao.ParentConfig.ParentTable.__type
or ao.ParentType
or(ao.ParentTable and ao.ParentTable.__type)
aE,aD=aa.GetLinkedCornerShape(
aB.Elements,
ap.Index,
aB,
aF,
ao.CornerLink
or(ao.ParentConfig and ao.ParentConfig.CornerLink)
or ao.Window.ElementConfig.CornerLink
)
end

if aE and au then
local aF=(aE=="Squircle-TL-BL"or aE=="Squircle-TR-BR")and"Squircle"
or aE
au:SetType(aF)
end

aa.ApplyCornerRadii(av,UDim.new(0,aq),aD)
aa.ApplyCornerRadii(aw,UDim.new(0,aq),aD)
end

ap.UpdateShape(ao.Tab or ao.ParentTable)

function ap.Destroy(aB)
ap.UIElements.Main:Destroy()
end

return ap.__type,ap
end

return am end function a.au()

local aa=a.load'd'
local ag=aa.New
local aj=aa.Tween

local al={}

function al.New(am,an)
local ao={
__type="Section",
Title=an.Title or"Section",
Desc=an.Desc,
Icon=an.Icon,
IconThemed=an.IconThemed,
TextXAlignment=an.TextXAlignment or"Left",
TextSize=an.TextSize or 19,
DescTextSize=an.DescTextSize or 16,
Box=an.Box or false,
BoxBorder=an.BoxBorder or false,
FontWeight=an.FontWeight or Enum.FontWeight.SemiBold,
DescFontWeight=an.DescFontWeight or Enum.FontWeight.Medium,
TextTransparency=an.TextTransparency or 0.05,
DescTextTransparency=an.DescTextTransparency or 0.4,
Opened=an.Opened or false,
UIElements={},

HeaderSize=48,
IconSize=20,
Padding=10,

Elements={},

Expandable=false,
}

local ap

function ao.SetIcon(aq,ar)
ao.Icon=ar or nil
if ap then
ap:Destroy()
end
if ar then
ap=aa.Image(
ar,
ar..":"..ao.Title,
0,
an.Window.Folder,
ao.__type,
true,
ao.IconThemed,
"SectionIcon"
)
ap.Size=UDim2.new(0,ao.IconSize,0,ao.IconSize)
end
end

local aq=ag("Frame",{
Size=UDim2.new(0,ao.IconSize,0,ao.IconSize),
BackgroundTransparency=1,
Visible=false,
},{
ag("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=aa.Icon"chevron-down"[1],
ImageRectSize=aa.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=aa.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageTransparency="SectionExpandIconTransparency",
ImageColor3="SectionExpandIcon",
},
}),
})

if ao.Icon then
ao:SetIcon(ao.Icon)
end

local ar=ag("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ag("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment=ao.TextXAlignment,
VerticalAlignment="Center",
Padding=UDim.new(0,4),
}),
})

local as,at

local function createTitle(au,av)
return ag("TextLabel",{
BackgroundTransparency=1,
TextXAlignment=ao.TextXAlignment,
AutomaticSize="Y",
TextSize=av=="Title"and ao.TextSize or ao.DescTextSize,
TextTransparency=av=="Title"and ao.TextTransparency or ao.DescTextTransparency,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,av=="Title"and ao.FontWeight or ao.DescFontWeight),


Text=au,
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
Parent=ar,
})
end

as=createTitle(ao.Title,"Title")
if ao.Desc then
at=createTitle(ao.Desc,"Desc")
end

local function UpdateTitleSize()
local au=0
if ap then
au=au-(ao.IconSize+8)
end
if aq.Visible then
au=au-(ao.IconSize+8)
end
ar.Size=UDim2.new(1,au,0,0)
end

local au=aa.NewRoundFrame(an.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Parent=an.Parent,

AutomaticSize="Y",
ThemeTag={
ImageTransparency=ao.Box and"SectionBoxBackgroundTransparency"or nil,
ImageColor3="SectionBoxBackground",
},
ImageTransparency=not ao.Box and 1 or nil,
},{
aa.NewRoundFrame(an.Window.ElementConfig.UICorner-1,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ThemeTag={

ImageColor3="SectionBoxBorder",
},
ImageTransparency=ao.Box and ao.BoxBorder and 0.92 or 1,
Name="Outline",
ClipsDescendants=true,
},{
ag("TextButton",{
Size=UDim2.new(1,0,0,ao.Expandable and 0 or(not at and ao.HeaderSize or 0)),
BackgroundTransparency=1,
AutomaticSize=(not ao.Expandable or at)and"Y"or nil,
Text="",
Name="Top",
},{
ao.Box and ag("UIPadding",{
PaddingTop=UDim.new(
0,
an.Window.ElementConfig.UIPadding+(an.Window.NewElements and 4 or 0)
),
PaddingLeft=UDim.new(
0,
an.Window.ElementConfig.UIPadding+(an.Window.NewElements and 4 or 0)
),
PaddingRight=UDim.new(
0,
an.Window.ElementConfig.UIPadding+(an.Window.NewElements and 4 or 0)
),
PaddingBottom=UDim.new(
0,
an.Window.ElementConfig.UIPadding+(an.Window.NewElements and 4 or 0)
),
})or nil,
ap,
ar,
ag("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
aq,
}),
ag("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=false,
Position=UDim2.new(0,0,0,ao.HeaderSize+10),
},{
ao.Box and ag("UIPadding",{
PaddingLeft=UDim.new(0,an.Window.ElementConfig.UIPadding/1.5),
PaddingRight=UDim.new(0,an.Window.ElementConfig.UIPadding/1.5),
PaddingBottom=UDim.new(0,an.Window.ElementConfig.UIPadding/1.5),
})or nil,
ag("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,an.Tab.Gap),
VerticalAlignment="Top",
}),
}),
}),
})





ao.ElementFrame=au

au.Outline.Top:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
au.Outline.Content.Position=UDim2.new(0,0,0,(au.Outline.Top.AbsoluteSize.Y/an.UIScale)+10)

if ao.Opened then
ao:Open(true)
else
ao.Close(true)
end
end)

local av=an.ElementsModule

av.Load(ao,au.Outline.Content,av.Elements,an.Window,an.WindUI,function()
if not ao.Expandable then
ao.Expandable=true
aq.Visible=true
UpdateTitleSize()
end
end,av,an.UIScale,an.Tab)

UpdateTitleSize()

function ao.SetTitle(aw,ax)
ao.Title=ax
as.Text=ax
end

function ao.SetDesc(aw,ax)
ao.Desc=ax
if not at then
at=createTitle(ax,"Desc")
end
at.Text=ax
end

function ao.Destroy(aw)
for ax,ay in next,ao.Elements do
ay:Destroy()
end








au:Destroy()
end

function ao.Open(aw,ax)
if ao.Expandable then
ao.Opened=true
if ax then
au.Size=UDim2.new(
au.Size.X.Scale,
au.Size.X.Offset,
0,
au.Outline.Top.AbsoluteSize.Y/an.UIScale
+(au.Outline.Content.AbsoluteSize.Y/an.UIScale)
+10
)
aq.ImageLabel.Rotation=180
else
aj(au,0.33,{
Size=UDim2.new(
au.Size.X.Scale,
au.Size.X.Offset,
0,
au.Outline.Top.AbsoluteSize.Y/an.UIScale
+(au.Outline.Content.AbsoluteSize.Y/an.UIScale)
+10
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

aj(
aq.ImageLabel,
0.2,
{Rotation=180},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end
end
function ao.Close(aw,ax)
if ao.Expandable then
ao.Opened=false
if ax then
au.Size=UDim2.new(
au.Size.X.Scale,
au.Size.X.Offset,
0,
(au.Outline.Top.AbsoluteSize.Y/an.UIScale)
)
aq.ImageLabel.Rotation=0
else
aj(au,0.26,{
Size=UDim2.new(
au.Size.X.Scale,
au.Size.X.Offset,
0,
(au.Outline.Top.AbsoluteSize.Y/an.UIScale)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
aj(
aq.ImageLabel,
0.2,
{Rotation=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end
end

aa.AddSignal(au.Outline.Top.MouseButton1Click,function()
if ao.Expandable then
if ao.Opened then
ao:Close()
else
ao:Open()
end
end
end)

aa.AddSignal(au.Outline.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if ao.Opened then
ao:Open(true)
else
ao:Close(true)
end
end)

task.defer(function()
if ao.Expandable then








au.Size=
UDim2.new(au.Size.X.Scale,au.Size.X.Offset,0,au.Outline.Top.AbsoluteSize.Y/an.UIScale)
au.AutomaticSize="None"
au.Outline.Top.Size=UDim2.new(1,0,0,(not at and ao.HeaderSize or 0))
au.Outline.Top.AutomaticSize=(not ao.Expandable or at)and"Y"or"None"
au.Outline.Content.Visible=true
end
if ao.Opened then
ao:Open()
else
ao:Close(true)
end
end)

return ao.__type,ao
end

return al end function a.av()

local aa=a.load'd'
local ag=aa.New

local aj={}

function aj.New(al,am)
local an=ag("Frame",{
Parent=am.Parent,
Size=not table.find({"Group","HStack"},am.ParentType)and UDim2.new(1,-7,0,7*(am.Columns or 1))or UDim2.new(0,7*(am.Columns or 1),0,0),
BackgroundTransparency=1,
})

return"Space",{__type="Space",ElementFrame=an}
end

return aj end function a.aw()
local aa=a.load'd'
local ag=aa.New

local aj={}

local function ParseAspectRatio(al)
if type(al)=="string"then
local am,an=al:match"(%d+):(%d+)"
if am and an then
return tonumber(am)/tonumber(an)
end
elseif type(al)=="number"then
return al
end
return nil
end

function aj.New(al,am)
local an={
__type="Image",
Image=am.Image or"",
AspectRatio=am.AspectRatio or"16:9",
Radius=am.Radius or am.Window.ElementConfig.UICorner,
}
local ao=aa.Image(
an.Image,
an.Image,
an.Radius,
am.Window.Folder,
"Image",
false
)
if ao and ao.Parent then
ao.Parent=am.Parent
ao.Size=UDim2.new(1,0,0,0)
ao.BackgroundTransparency=1












local ap=ParseAspectRatio(an.AspectRatio)
local aq

if ap then
aq=ag("UIAspectRatioConstraint",{
Parent=ao,
AspectRatio=ap,
AspectType="ScaleWithParentSize",
DominantAxis="Width"
})
end

function an.Destroy(ar)
ao:Destroy()
end
end

return an.__type,an
end

return aj end function a.ax()
local aa=a.load'd'
local ag=aa.New

local aj={}

function aj.New(al,am)
local an={
__type="Group",
Elements={},
ElementFrame=nil,
LinkCorners=am.LinkCorners==true,
CornerLink=am.CornerLink,
}

local ao=ag("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=am.Parent,
},{
ag("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6))
}),
})

an.ElementFrame=ao

local ap=am.ElementsModule
ap.Load(
an,
ao,
ap.Elements,
am.Window,
am.WindUI,
function(aq,ar)
local as=am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6)

local at={}
local au=0

for av,aw in next,ar do
if aw.__type=="Space"then
au=au+(aw.ElementFrame.Size.X.Offset or 6)
elseif aw.__type=="Divider"then
au=au+(aw.ElementFrame.Size.X.Offset or 1)
else
table.insert(at,aw)
end
end

local av=#at
if av==0 then return end

local aw=1/av

local ax=as*(av-1)

local ay=-(ax+au)

local az=math.floor(ay/av)
local aA=ay-(az*av)

for aB,aC in next,at do
local aD=az
if aB<=math.abs(aA)then
aD=aD-1
end

if aC.ElementFrame then
aC.ElementFrame.Size=UDim2.new(aw,aD,1,0)
end
end
end,
ap,
am.UIScale,
am.Tab
)



return an.__type,an
end

return aj end function a.ay()

local aa=a.load'd'
local ag=aa.New

local aj={}

function aj.New(al,am)
local an={
__type="HStack",
AutoSpace=am.AutoSpace or false,
Elements={},
ElementFrame=nil,
LinkCorners=am.LinkCorners==true,
CornerLink=am.CornerLink,
MinChildWidth=math.max(tonumber(am.MinChildWidth)or 128,40),
IsStacked=false,
}

local ao=ag("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=am.Parent,
},{
ag("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6)),
}),
})

an.ElementFrame=ao

local ap=am.ElementsModule
local function UpdateLayout(aq)
aq=aq or an.Elements
local ar=am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6)

local as={}
local at=0
local au=ao.AbsoluteSize.X/am.UIScale

for av,aw in next,aq do
if aw.__type=="Space"then
at=at+(aw.ElementFrame.Size.X.Offset or 6)
elseif aw.__type=="Divider"then
at=at+(aw.ElementFrame.Size.X.Offset or 1)
else
table.insert(as,aw)
end
end

local av=#as
if av==0 then
return
end

local aw=ar*(av-1)
local ax=au-aw-at
local ay=au>0 and ax/av<an.MinChildWidth
local az=an.IsStacked~=ay
an.IsStacked=ay
local aA=ay and 1 or(1/av)
local aB=ay and 0 or-(aw+at)
local aC=math.floor(aB/av)
local aD=aB-(aC*av)

ao.UIListLayout.FillDirection=ay and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
ao.UIListLayout.HorizontalAlignment=ay and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center

for aE,aF in next,as do
local aG=ay and 0 or aC
if not ay and aE<=math.abs(aD)then
aG=aG-1
end

if aF.ElementFrame then
local aH=aF.ElementFrame.Size
aF.ElementFrame.Size=UDim2.new(
aA,
aG,
aH.Y.Scale==1 and 0 or aH.Y.Scale,
aH.Y.Scale==1 and 0 or aH.Y.Offset
)
end
end

if az and an.UpdateAllElementShapes then
an:UpdateAllElementShapes(an)
end
end

ap.Load(
an,
ao,
ap.Elements,
am.Window,
am.WindUI,
function(aq,ar)
UpdateLayout(ar)
end,
ap,
am.UIScale,
am.Tab
)

aa.AddSignal(ao:GetPropertyChangedSignal"AbsoluteSize",function()
UpdateLayout()
end)

if an.AutoSpace then
for aq in next,ap.Elements do
if aq~="Space"and aq~="Divider"then
local ar=an[aq]
an[aq]=function(as,at)
if#an.Elements>0 then
an:Space()
end
return ar(as,at)
end
end
end
end

return an.__type,an
end

return aj end function a.az()

local aa=a.load'd'
local ag=aa.New

local aj={}

function aj.New(al,am)
local an={
__type="VStack",
Elements={},
ElementFrame=nil,
LinkCorners=am.LinkCorners==true,
CornerLink=am.CornerLink,
}

local ao=ag("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=am.Parent,
},{
ag("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment="Center",

Padding=UDim.new(0,am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6))
}),
})

an.ElementFrame=ao

local ap=am.ElementsModule
ap.Load(
an,
ao,
ap.Elements,
am.Window,
am.WindUI,







































nil,
ap,
am.UIScale,
am.Tab
)



return an.__type,an
end

return aj end function a.aA()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ag=aa(game:GetService"UserInputService")

local aj=a.load'd'
local al=aj.New

local am={}














function am.New(an,ao:ConfigType__DARKLUA_TYPE_a)
local ap={
__type="Viewport",
Object=ao.Object,
Camera=ao.Camera or Instance.new"Camera",
Interactive=ao.Interactive or false,
Height=ao.Height or 200,
Focused=ao.Focused~=false,
}

local aq=false
local ar=false
local as,at=0

local au=aj.NewRoundFrame(ao.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,ap.Height),
Parent=ao.Parent,
ThemeTag={
ImageColor3="ViewportBackground",
ImageTransparency="ViewportBackgroundTransparency",
},
},{
al("CanvasGroup",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
al("UICorner",{
CornerRadius=UDim.new(0,ao.Window.ElementConfig.UICorner),
}),
al("ViewportFrame",{
Name="Viewport",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
CurrentCamera=ap.Camera,
Active=ap.Interactive,
},{
ap.Object,
}),
}),
})

local function IsTouchInsideViewport(av)
local aw=au.CanvasGroup.Viewport.AbsolutePosition
local ax=au.CanvasGroup.Viewport.AbsoluteSize

return av.X>=aw.X
and av.X<=aw.X+ax.X
and av.Y>=aw.Y
and av.Y<=aw.Y+ax.Y
end

local av=ao.WindUI.GenerateGUID()

aj.AddSignal(au.CanvasGroup.Viewport.MouseEnter,function()
if ap.Interactive then
ao.Tab.UIElements.ContainerFrame.ScrollingEnabled=false
end
end)

aj.AddSignal(au.CanvasGroup.Viewport.InputEnded,function(aw)
if
aw.UserInputType==Enum.UserInputType.MouseMovement
or aw.UserInputType==Enum.UserInputType.Touch
then
ao.Tab.UIElements.ContainerFrame.ScrollingEnabled=true
end
end)

aj.AddSignal(au.CanvasGroup.Viewport.InputBegan,function(aw)
if ap.Interactive then
if
(aw.UserInputType==Enum.UserInputType.MouseButton1)
or(aw.UserInputType==Enum.UserInputType.Touch and not ar)
then
if ao.WindUI.CurrentInput and ao.WindUI.CurrentInput~=av then
return
end

ao.WindUI.CurrentInput=av

aq=true
at=aw.Position
end
end
end)

aj.AddSignal(ag.InputEnded,function(aw)
if ap.Interactive then
if
aw.UserInputType==Enum.UserInputType.MouseButton1
or aw.UserInputType==Enum.UserInputType.Touch
then
if ao.WindUI.CurrentInput and ao.WindUI.CurrentInput~=av then
return
end

ao.WindUI.CurrentInput=nil

aq=false
end
end
end)

aj.AddSignal(ag.InputChanged,function(aw)
if ap.Interactive and aq and not ar then
if
aw.UserInputType==Enum.UserInputType.MouseMovement
or aw.UserInputType==Enum.UserInputType.Touch
then
local ax=aw.Position-at
at=aw.Position

local ay=ap.Object:GetPivot().Position
local az=ap.Camera

local aA=CFrame.fromAxisAngle(Vector3.new(0,1,0),-ax.X*0.02)
az.CFrame=CFrame.new(ay)*aA*CFrame.new(-ay)*az.CFrame

local aB=CFrame.fromAxisAngle(az.CFrame.RightVector,-ax.Y*0.02)
local aC=CFrame.new(ay)*aB*CFrame.new(-ay)*az.CFrame

if aC.UpVector.Y>0.1 then
az.CFrame=aC
end
end
end
end)

aj.AddSignal(au.CanvasGroup.Viewport.InputChanged,function(aw)
if ap.Interactive then
if aw.UserInputType==Enum.UserInputType.MouseWheel then
local ax=aw.Position.Z*2
ap.Camera.CFrame+=ap.Camera.CFrame.LookVector*ax
end
end
end)

aj.AddSignal(ag.TouchPinch,function(aw,ax,ay,az)
if not IsTouchInsideViewport(aw[1])or not IsTouchInsideViewport(aw[2])then
return
end
if ap.Interactive then
if az==Enum.UserInputState.Begin then
ar=true
aq=false
as=(aw[1]-aw[2]).Magnitude
elseif az==Enum.UserInputState.Change then
if ar then
local aA=(aw[1]-aw[2]).Magnitude
local aB=(aA-as)*0.03
as=aA
ap.Camera.CFrame+=ap.Camera.CFrame.LookVector*aB
end
elseif az==Enum.UserInputState.End or az==Enum.UserInputState.Cancel then
ar=false
end
end
end)

local function FocusCamera()
local aw=ap.Object:IsA"BasePart"and ap.Object.Size
or select(2,ap.Object:GetBoundingBox(0))
local ax=math.max(aw.X,aw.Y,aw.Z)
local ay=ax*2
local az=ap.Object:GetPivot().Position

ap.Camera.CFrame=
CFrame.new(az+Vector3.new(0,ax/2,ay),az)
end

if ap.Focused then
FocusCamera()
end

function ap.SetObject(aw,ax,ay)
if ay then
ax=ax:Clone()
end
if ap.Object then
ap.Object:Destroy()
end

ap.Object=ax
ap.Object.Parent=au.CanvasGroup.Viewport
end

function ap.SetHeight(aw,ax)
au.Size=UDim2.new(1,0,0,ax)
end

function ap.Focus(aw)
if ap.Object then
FocusCamera()
end
end

function ap.SetCamera(aw,ax)
ap.Camera=ax
au.CanvasGroup.Viewport.CurrentCamera=ax
end

function ap.SetInteractive(aw,ax)
ap.Interactive=ax
au.CanvasGroup.Viewport.Active=ax
end

ap.Main=au

return ap.__type,ap
end

return am end function a.aB()



local aa=a.load'd'
local ag=aa.New

local aj={}

local function ParseAspectRatio(al)
if type(al)=="string"then
local am,an=al:match"(%d+):(%d+)"
if am and an then
return tonumber(am)/tonumber(an)
end
elseif type(al)=="number"then
return al
end
return nil
end


function aj.New(al,am)
local an={
__type="Video",
Video=am.Video or"",
AspectRatio=am.AspectRatio or"16:9",
Radius=am.Radius or am.Window.ElementConfig.UICorner,
ElementFrame=nil,
}

local ao

if an.Video then
local ap
if string.find(an.Video,"http")then
local aq=am.Window.Folder or"Temp"
if makefolder and isfolder then
if not isfolder(aq)then
makefolder(aq)
end
if not isfolder(aq.."/assets")then
makefolder(aq.."/assets")
end
end
local ar=aq.."/assets/."..aa.SanitizeFilename(an.Video)..".webm"
if not isfile or not isfile(ar)then
local as,at=pcall(function()
local as=game.HttpGet and game:HttpGet(an.Video)or nil
if not as and aa.Request then
local at=aa.Request{
Url=an.Video,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}
as=at and at.Body
end
if as and writefile then
writefile(ar,as)
end
end)
if not as then
warn("[ Window.Background ] Failed to download video: "..tostring(at))
return
end
end

local as,at=pcall(function()
return typeof(getcustomasset)=="function"and getcustomasset(ar)or ar
end)
if not as then
warn("[ WindUI.Video ] Failed to load custom asset: "..tostring(at))
end
ap=at
else
ap=an.Video
end

ao=ag("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=ap,
Looped=false,
Volume=0,
Parent=am.Parent
},{
ag("UICorner",{
CornerRadius=UDim.new(0,an.Radius)
}),
})
an.ElementFrame=ao
ao:Play()


local aq=ParseAspectRatio(an.AspectRatio)
local ar

if aq then
ar=ag("UIAspectRatioConstraint",{
Parent=ao,
AspectRatio=aq,
AspectType="ScaleWithParentSize",
DominantAxis="Width"
})
end
end


function an.Destroy(ap)
if ao then ao:Destroy()end
end

return an.__type,an
end

return aj end function a.aC()

return{
Elements={
Paragraph=a.load'J',
Button=a.load'K',
Toggle=a.load'N',
Slider=a.load'O',
ProgressBar=a.load'P',
Keybind=a.load'Q',
Input=a.load'R',
Dropdown=a.load'U',
Code=a.load'X',
Colorpicker=a.load'Y',
RadioGroup=a.load'_',
CheckboxGroup=a.load'aa',
SegmentedControl=a.load'ab',
TextArea=a.load'ac',
Stepper=a.load'ad',
Callout=a.load'ae',
Badge=a.load'ag',
StatusCard=a.load'ah',
StatCard=a.load'ai',
KeyValue=a.load'aj',
ChipList=a.load'ak',
ActionList=a.load'al',
MeterGroup=a.load'am',
Timeline=a.load'an',
Accordion=a.load'ao',
EmptyState=a.load'ap',
DiscordCard=a.load'aq',
TabBox=a.load'ar',
Path2D=a.load'as',
Card=a.load'at',
Section=a.load'au',
Divider=a.load'S',
Space=a.load'av',
Image=a.load'aw',
Group=a.load'ax',
HStack=a.load'ay',
VStack=a.load'az',
Viewport=a.load'aA',
Video=a.load'aB',
},
Load=function(aa,ag,aj,al,am,an,ao,ap,aq)
for ar,as in next,aj do
aa[ar]=function(at,au)
au=au or{}
au.Tab=aq or aa
au.ParentType=aa.__type
au.ParentTable=aa
au.Index=#aa.Elements+1
au.GlobalIndex=#al.AllElements+1
if au.LinkCorners==nil then
au.LinkCorners=aa.LinkCorners==true or(aq and aq.LinkCorners==true)
end
au.Parent=ag
au.Window=al
au.WindUI=am
au.UIScale=ap
au.ElementsModule=ao local

av, aw=as:New(au)

if au.Flag and typeof(au.Flag)=="string"then
if al.CurrentConfig then
al.CurrentConfig:Register(au.Flag,aw)

if al.PendingConfigData and al.PendingConfigData[au.Flag]then
local ax=al.PendingConfigData[au.Flag]

local ay=al.ConfigManager
if typeof(ax)=="table"and ay.Parser[ax.__type]then
task.defer(function()
local az,aA=pcall(function()
ay.Parser[ax.__type].Load(aw,ax)
end)

if az then
al.PendingConfigData[au.Flag]=nil
else
warn(
"[ WindUI ] Failed to apply pending config for '"
..au.Flag
.."': "
..tostring(aA)
)
end
end)
end
end
else
al.PendingFlags=al.PendingFlags or{}
al.PendingFlags[au.Flag]=aw
end
end

local ax
for ay,az in next,aw do
if typeof(az)=="table"and ay~="ElementFrame"and ay:match"Frame$"then
ax=az
break
end
end

if ax then
aw.ElementFrame=ax.UIElements.Main
function aw.SetTitle(ay,az)
return ax.SetTitle and ax:SetTitle(az)
end
function aw.SetDesc(ay,az)
return ax.SetDesc and ax:SetDesc(az)
end
function aw.SetImage(ay,az,aA)
return ax.SetImage and ax:SetImage(az,aA)
end
function aw.SetThumbnail(ay,az,aA)
return ax.SetThumbnail and ax:SetThumbnail(az,aA)
end
function aw.SetTransparency(ay,az)
return ax.SetTransparency and ax:SetTransparency(az)
end
function aw.SetLiquidGlass(ay,az)
return ax.SetLiquidGlass and ax:SetLiquidGlass(az)
end
function aw.Highlight(ay)
ax:Highlight()
end
function aw.Destroy(ay)
ax:Destroy()

table.remove(al.AllElements,au.GlobalIndex)
table.remove(aa.Elements,au.Index)
table.remove(aq.Elements,au.Index)
aa:UpdateAllElementShapes(aa)
end
end

al.AllElements[au.GlobalIndex]=aw
aa.Elements[au.Index]=aw
if aq then
aq.Elements[au.Index]=aw
end

if al.NewElements then
aa:UpdateAllElementShapes(aa)
end

if an then
an(aw,aa.Elements)
end
return aw
end
end
function aa.UpdateAllElementShapes(ar,as)
for at,au in next,as.Elements do
local av
for aw,ax in pairs(au)do
if typeof(ax)=="table"and aw:match"Frame$"then
av=ax
break
end
end

if not av and au.UpdateShape then
av=au
end

if av then

av.Index=at
if av.UpdateShape then

av.UpdateShape(as)
end
end
end
end
end,
}end function a.aD()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ag=game:GetService"Players"
local aj=game:GetService"TweenService"

aa(game:GetService"UserInputService")
local al=ag.LocalPlayer:GetMouse()

local am=a.load'd'
local an=a.load'e'
local ao=am.New

local ap=a.load'G'.New
local aq=a.load'z'.New



local ar={


Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(ar)end,
}

local function GetImageTarget(as)
if typeof(as)~="Instance"then
return nil
end

if as:IsA"ImageLabel"or as:IsA"ImageButton"then
return as
end

return as:FindFirstChildWhichIsA("ImageLabel",true)or as:FindFirstChildWhichIsA("ImageButton",true)
end

function ar.Init(as,at,au,av)
Window=as
WindUI=at
ar.ToolTipParent=au
ar.TabHighlight=av
return ar
end

function ar.New(as,at)
local au={
__type="Tab",
Title=as.Title or"Tab",
Desc=as.Desc,
Icon=as.Icon,
Golden=as.Golden==true or as.Premium==true,
Premium=as.Premium==true or as.Golden==true,
IconColor=as.IconColor
or((as.Golden==true or as.Premium==true)and Color3.fromRGB(255,222,105)or nil),
IconShape=as.IconShape,
IconThemed=as.IconThemed,
Locked=as.Locked,
ShowTabTitle=as.ShowTabTitle,
TabTitleAlign=as.TabTitleAlign or"Left",
CustomEmptyPage=(as.CustomEmptyPage and next(as.CustomEmptyPage)~=nil)and as.CustomEmptyPage
or{Icon="lucide:frown",IconSize=48,Title="This tab is Empty",Desc=nil},
Border=as.Border,
Selected=false,
Index=nil,
Parent=as.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=Window.UICorner-(Window.UIPadding/2),
LinkCorners=as.LinkCorners==true,

Gap=as.Gap or as.ElementGap or Window.ElementGap or(Window.NewElements and(Window.LiquidGlass and 6 or 1)or 6),

TabPaddingX=4+(Window.UIPadding/2),
TabPaddingY=3+(Window.UIPadding/2),
TitlePaddingY=0,
}









if au.IconShape then
au.TabPaddingX=2+(Window.UIPadding/4)
au.TabPaddingY=2+(Window.UIPadding/4)
au.TitlePaddingY=2+(Window.UIPadding/4)
end

ar.TabCount=ar.TabCount+1

local av=ar.TabCount
au.Index=av

au.UIElements.Main=am.NewRoundFrame(au.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=as.Parent,
ThemeTag={
ImageColor3="TabBackground",
},
ImageTransparency=1,
},{
am.NewRoundFrame(au.UICorner-1,"Glass-1.4",{
Size=UDim2.new(1,1,1,1),
ThemeTag={
ImageColor3="TabBorder",
},
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=1,
Name="Outline",
},{













}),
am.NewRoundFrame(999,"Squircle",{
Name="ActiveRail",
Size=UDim2.new(0,3,0,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,2,0.5,0),
ImageTransparency=1,
ThemeTag={
ImageColor3="Primary",
},
}),
am.NewRoundFrame(au.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
ao("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,2+(Window.UIPadding/2)),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ao("TextLabel",{
Text=au.Title,
ThemeTag=not au.Golden and{
TextColor3="TabTitle",
}or nil,
TextColor3=au.Golden and Color3.fromRGB(255,232,144)or nil,
TextTransparency=not au.Locked and(au.Golden and 0.12 or 0.4)or 0.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(am.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
},{
ao("UIPadding",{
PaddingTop=UDim.new(0,au.TitlePaddingY),


PaddingBottom=UDim.new(0,au.TitlePaddingY),
}),
}),
ao("UIPadding",{
PaddingTop=UDim.new(0,au.TabPaddingY),
PaddingLeft=UDim.new(0,au.TabPaddingX),
PaddingRight=UDim.new(0,au.TabPaddingX),
PaddingBottom=UDim.new(0,au.TabPaddingY),
}),
}),
},true)

if au.Golden then
au.UIElements.Main.Frame.ImageColor3=Color3.fromRGB(64,49,18)
au.UIElements.Main.Frame.ImageTransparency=0.88
au.UIElements.Main.Outline.ImageColor3=Color3.fromRGB(255,214,92)
au.UIElements.Main.Outline.ImageTransparency=0.78
au.UIElements.GoldenShine=ao("UIGradient",{
Rotation=18,
Offset=Vector2.new(-1,0),
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,185,56)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,244,184)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(154,94,18)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.88),
NumberSequenceKeypoint.new(0.48,0.72),
NumberSequenceKeypoint.new(0.55,0.18),
NumberSequenceKeypoint.new(0.64,0.74),
NumberSequenceKeypoint.new(1,0.9),
},
Parent=au.UIElements.Main.Frame,
})

if an:IsEnabled()and not an.Reduced then
task.spawn(function()
while au.UIElements.Main and au.UIElements.Main.Parent and au.UIElements.GoldenShine do
au.UIElements.GoldenShine.Offset=Vector2.new(-1,0)
local aw=aj:Create(
au.UIElements.GoldenShine,
TweenInfo.new(1.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{Offset=Vector2.new(1,0)}
)
aw:Play()
aw.Completed:Wait()
task.wait(1.1)
end
end)
end
end

local aw=0
local ax
local ay

if au.Icon then
ax=am.Image(
au.Icon,
au.Icon..":"..au.Title,
0,
Window.Folder,
au.__type,
au.IconColor and false or true,
au.IconThemed,
"TabIcon"
)
ax.Size=UDim2.new(0,16,0,16)
local az=GetImageTarget(ax)
if au.IconColor and az then
az.ImageColor3=au.IconColor
end
if not au.IconShape then
ax.Parent=au.UIElements.Main.Frame
au.UIElements.Icon=ax
if az then
az.ImageTransparency=not au.Locked and 0 or 0.7
end
aw=-18-(Window.UIPadding/2)
au.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,aw,0,0)
elseif au.IconColor then
am.NewRoundFrame(
au.IconShape~="Circle"and(au.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Squircle",
{
Size=UDim2.new(0,26,0,26),
ImageColor3=au.IconColor,
Parent=au.UIElements.Main.Frame,
},
{
ax,
am.NewRoundFrame(
au.IconShape~="Circle"and(au.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Glass-1.4",
{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=0,
Name="Outline",
},
{













}
),
}
)
ax.AnchorPoint=Vector2.new(0.5,0.5)
ax.Position=UDim2.new(0.5,0,0.5,0)
if az then
az.ImageTransparency=0
az.ImageColor3=am.GetTextColorForHSB(au.IconColor,0.68)
end
aw=-28-(Window.UIPadding/2)
au.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,aw,0,0)
end

ay=
am.Image(au.Icon,au.Icon..":"..au.Title,0,Window.Folder,au.__type,true,au.IconThemed)
ay.Size=UDim2.new(0,16,0,16)
local aA=GetImageTarget(ay)
if aA then
aA.ImageTransparency=not au.Locked and 0 or 0.7
end
aw=-30




end

au.UIElements.ContainerFrame=ao("ScrollingFrame",{
Size=UDim2.new(1,0,1,au.ShowTabTitle and-((Window.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
ao("UIPadding",{
PaddingTop=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingLeft=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingRight=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingBottom=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
}),
ao("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,au.Gap),
HorizontalAlignment="Center",
}),
})





au.UIElements.ContainerFrameCanvas=ao("CanvasGroup",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
GroupTransparency=1,
Visible=false,
Parent=Window.UIElements.MainBar,
ZIndex=5,
},{
au.UIElements.ContainerFrame,
ao("Frame",{
Size=UDim2.new(1,-14,1,-14),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Name="ScrollSliderHolder",
}),
ao("Frame",{
Size=UDim2.new(1,0,0,((Window.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=au.ShowTabTitle or false,
Name="TabTitle",
},{
ay,
ao("TextLabel",{
Text=au.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=20,
TextTransparency=0.1,
Size=UDim2.new(0,0,1,0),
FontFace=Font.new(am.Font,Enum.FontWeight.SemiBold),

RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
AutomaticSize="X",
}),
ao("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
ao("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=au.TabTitleAlign,
}),
}),
ao("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
Position=UDim2.new(0,0,0,((Window.UIPadding*2.4)+12)),
Visible=au.ShowTabTitle or false,
}),
})

ar.Containers[av]=au.UIElements.ContainerFrameCanvas
ar.Tabs[av]=au

au.ContainerFrame=au.UIElements.ContainerFrameCanvas

am.AddSignal(au.UIElements.Main.MouseButton1Click,function()
if not au.Locked then
ar:SelectTab(av)
end
end)

an.AttachPress(au.UIElements.Main,am,{
Amount=0.985,
})

if Window.ScrollBarEnabled then
aq(
au.UIElements.ContainerFrame,
au.UIElements.ContainerFrameCanvas.ScrollSliderHolder,
Window,
4,
WindUI
)
end

local az
local aA
local aB
local aC=false


if au.Desc then
am.AddSignal(au.UIElements.Main.InputBegan,function()
aC=true
aA=task.spawn(function()
task.wait(0.35)
if aC and not az then
az=ap(au.Desc,ar.ToolTipParent,true)
az.Container.AnchorPoint=Vector2.new(0.5,0.5)

local function updatePosition()
if az then
az.Container.Position=UDim2.new(0,al.X,0,al.Y-4)
end
end

updatePosition()
aB=al.Move:Connect(updatePosition)
az:Open()
end
end)
end)
end

am.AddSignal(au.UIElements.Main.MouseEnter,function()
if not au.Locked and not au.Selected then
am.SetThemeTag(au.UIElements.Main.Frame,{
ImageTransparency="TabBackgroundHoverTransparency",
ImageColor3="TabBackgroundHover",
},0.1)
end
end)
am.AddSignal(au.UIElements.Main.MouseLeave,function()
if not au.Locked and not au.Selected then
an.Play(au.UIElements.Main.Frame,"Hover",{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"TabHover")
end
end)
am.AddSignal(au.UIElements.Main.InputEnded,function()
if au.Desc then
aC=false
if aA then
task.cancel(aA)
aA=nil
end
if aB then
aB:Disconnect()
aB=nil
end
if az then
az:Close()
az=nil
end
end

if not au.Locked and not au.Selected then
an.Play(au.UIElements.Main.Frame,"Hover",{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"TabHover")
end
end)

function au.ScrollToTheElement(aD,aE)
au.UIElements.ContainerFrame.ScrollingEnabled=false

an.Play(au.UIElements.ContainerFrame,"Resize",{
CanvasPosition=Vector2.new(
0,
au.Elements[aE].ElementFrame.AbsolutePosition.Y
-au.UIElements.ContainerFrame.AbsolutePosition.Y
-au.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"ScrollToElement")

task.spawn(function()
task.wait(an.GetDuration"Resize"+0.03)

if au.Elements[aE].Highlight then
au.Elements[aE]:Highlight()
end
au.UIElements.ContainerFrame.ScrollingEnabled=true
end)

return au
end



local aD=a.load'aC'

aD.Load(
au,
au.UIElements.ContainerFrame,
aD.Elements,
Window,
WindUI,
nil,
aD,
at,
au
)

function au.LockAll(aE)

for aF,aG in next,Window.AllElements do
if aG.Tab and aG.Tab.Index and aG.Tab.Index==au.Index and aG.Lock then
aG:Lock()
end
end
end
function au.UnlockAll(aE)
for aF,aG in next,Window.AllElements do
if aG.Tab and aG.Tab.Index and aG.Tab.Index==au.Index and aG.Unlock then
aG:Unlock()
end
end
end
function au.GetLocked(aE)
local aF={}

for aG,aH in next,Window.AllElements do
if aH.Tab and aH.Tab.Index and aH.Tab.Index==au.Index and aH.Locked==true then
table.insert(aF,aH)
end
end

return aF
end
function au.GetUnlocked(aE)
local aF={}

for aG,aH in next,Window.AllElements do
if aH.Tab and aH.Tab.Index and aH.Tab.Index==au.Index and aH.Locked==false then
table.insert(aF,aH)
end
end

return aF
end

function au.Select(aE)
return ar:SelectTab(au.Index)
end

task.spawn(function()
local aE
if au.CustomEmptyPage.Icon then
aE=
am.Image(au.CustomEmptyPage.Icon,au.CustomEmptyPage.Icon,0,"Temp","EmptyPage",true)
aE.Size=
UDim2.fromOffset(au.CustomEmptyPage.IconSize or 48,au.CustomEmptyPage.IconSize or 48)
end

local aF=ao("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=au.UIElements.ContainerFrame,
},{
ao("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),











aE,
au.CustomEmptyPage.Title and ao("TextLabel",{
AutomaticSize="XY",
Text=au.CustomEmptyPage.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
TextTransparency=0.5,
BackgroundTransparency=1,
FontFace=Font.new(am.Font,Enum.FontWeight.Medium),
})or nil,
au.CustomEmptyPage.Desc and ao("TextLabel",{
AutomaticSize="XY",
Text=au.CustomEmptyPage.Desc,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.65,
BackgroundTransparency=1,
FontFace=Font.new(am.Font,Enum.FontWeight.Regular),
})or nil,
})





local aG
aG=am.AddSignal(au.UIElements.ContainerFrame.ChildAdded,function()
aF.Visible=false
aG:Disconnect()
end)
end)

return au
end

function ar.OnChange(as,at)
ar.OnChangeFunc=at
end

local function ApplyGoldenTabVisual(as,at)
if not as or not as.Golden then
return
end

local au=as.UIElements
and as.UIElements.Main
and as.UIElements.Main.Frame
and as.UIElements.Main.Frame.TextLabel
if au then
au.TextColor3=at and Color3.fromRGB(255,244,184)or Color3.fromRGB(255,224,120)
au.TextTransparency=at and 0 or 0.12
end

local av=as.UIElements and as.UIElements.Icon and GetImageTarget(as.UIElements.Icon)
if av then
av.ImageColor3=as.IconColor or Color3.fromRGB(255,222,105)
av.ImageTransparency=at and 0 or 0.08
end

local aw=as.UIElements and as.UIElements.Main and as.UIElements.Main.Outline
if aw then
aw.ImageColor3=at and Color3.fromRGB(255,232,132)or Color3.fromRGB(255,214,92)
aw.ImageTransparency=at and 0.58 or 0.78
end
end

local function ApplyTabMotionVisual(as,at)
if not as or not as.UIElements or not as.UIElements.Main then
return
end

local au=as.UIElements.Main.ActiveRail
if au then
if as.Golden then
au.ImageColor3=at and Color3.fromRGB(255,232,132)or Color3.fromRGB(255,214,92)
end

an.Play(au,"Switch",{
Size=at and UDim2.new(0,3,1,-12)or UDim2.new(0,3,0,0),
ImageTransparency=at and 0.08 or 1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"TabRail")
end

if not at and as.UIElements.Main.Frame then
an.Play(as.UIElements.Main.Frame,"Hover",{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"TabHover")
end
end

function ar.SelectTab(as,at)
local au=ar.Tabs[at]
if au and not au.Locked and ar.SelectedTab~=at then
ar.SelectedTab=at

for av,aw in next,ar.Tabs do
if not aw.Locked then
am.SetThemeTag(aw.UIElements.Main,{
ImageTransparency="TabBorderTransparency",
},0.15)
if aw.Border then
am.SetThemeTag(aw.UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparency",
},0.15)
end
am.SetThemeTag(aw.UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparency",
},0.15)
local ax=aw.UIElements.Icon and GetImageTarget(aw.UIElements.Icon)
if ax and not aw.IconColor then
am.SetThemeTag(ax,{
ImageTransparency="TabIconTransparency",
},0.15)
end
aw.Selected=false
ApplyGoldenTabVisual(aw,false)
ApplyTabMotionVisual(aw,false)
end
end
am.SetThemeTag(au.UIElements.Main,{
ImageColor3="TabBackgroundActive",
ImageTransparency="TabBackgroundActiveTransparency",
},0.15)
if au.Border then
am.SetThemeTag(au.UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparencyActive",
},0.15)
end
am.SetThemeTag(au.UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparencyActive",
},0.15)
local av=au.UIElements.Icon and GetImageTarget(au.UIElements.Icon)
if av and not au.IconColor then
am.SetThemeTag(av,{
ImageTransparency="TabIconTransparencyActive",
},0.15)
end
au.Selected=true
ApplyGoldenTabVisual(au,true)
ApplyTabMotionVisual(au,true)

task.spawn(function()
local aw=ar.Containers[at]
for ax,ay in next,ar.Containers do
if ay~=aw then
ay.AnchorPoint=Vector2.new(0,0.035)
ay.GroupTransparency=1
ay.Visible=false
end
end
aw.AnchorPoint=Vector2.new(0,0.035)
aw.GroupTransparency=1
aw.Visible=true
an.Play(aw,"Switch",{
AnchorPoint=Vector2.new(0,0),
GroupTransparency=0,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out,"Select")
end)

ar.OnChangeFunc(at)
end
end

return ar end function a.aE()

local aa={}


local ag=a.load'd'
local aj=ag.New
local al=ag.Tween

local am=a.load'aD'

function aa.New(an,ao,ap,aq,ar)
local as={
Title=an.Title or"Section",
Icon=an.Icon,
IconThemed=an.IconThemed,
Opened=an.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local at
if as.Icon then
at=ag.Image(
as.Icon,
as.Icon,
0,
ap,
"Section",
true,
as.IconThemed,
"TabSectionIcon"
)

at.Size=UDim2.new(0,as.IconSize,0,as.IconSize)
at.ImageLabel.ImageTransparency=.25
end

local au=aj("Frame",{
Size=UDim2.new(0,as.IconSize,0,as.IconSize),
BackgroundTransparency=1,
Visible=false
},{
aj("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=ag.Icon"chevron-down"[1],
ImageRectSize=ag.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=ag.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local av=aj("Frame",{
Size=UDim2.new(1,0,0,as.HeaderSize),
BackgroundTransparency=1,
Parent=ao,
ClipsDescendants=true,
},{
aj("TextButton",{
Size=UDim2.new(1,0,0,as.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
at,
aj("TextLabel",{
Text=as.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
at and(-as.IconSize-10)*2
or(-as.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ag.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
aj("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
au,
aj("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
aj("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,as.HeaderSize)
},{
aj("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ar.Gap),
VerticalAlignment="Bottom",
}),
})
})


function as.Tab(aw,ax)
if not as.Expandable then
as.Expandable=true
au.Visible=true
end
ax.Parent=av.Content
return am.New(ax,aq)
end

function as.Open(aw)
if as.Expandable then
as.Opened=true
al(av,0.33,{
Size=UDim2.new(1,0,0,as.HeaderSize+(av.Content.AbsoluteSize.Y/aq))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

al(au.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function as.Close(aw)
if as.Expandable then
as.Opened=false
al(av,0.26,{
Size=UDim2.new(1,0,0,as.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
al(au.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

ag.AddSignal(av.TextButton.MouseButton1Click,function()
if as.Expandable then
if as.Opened then
as:Close()
else
as:Open()
end
end
end)

ag.AddSignal(av.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if as.Opened then
as:Open()
end
end)

if as.Opened then
task.spawn(function()
task.wait()
as:Open()
end)
end



return as
end


return aa end function a.aF()
return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.aG()
local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")

local ag={
Margin=8,
Padding=9,
}

local aj=a.load'd'
local al=aj.New
local am=aj.Tween

function ag.new(an,ao,ap)
local aq={
IconSize=18,
Padding=14,
Radius=22,
Width=400,
MaxHeight=380,

Icons=a.load'aF',
}

local ar=al("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(1,-((aq.IconSize*2)+(aq.Padding*2)),0,0),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(aj.Font,Enum.FontWeight.Regular),
TextSize=18,
})

local as=al("ImageLabel",{
Image=aj.Icon"x"[1],
ImageRectSize=aj.Icon"x"[2].ImageRectSize,
ImageRectOffset=aj.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
},{
al("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
}),
})

local at=al("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false,
},{
al("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
al("UIPadding",{
PaddingTop=UDim.new(0,aq.Padding),
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
PaddingBottom=UDim.new(0,aq.Padding),
}),
})

local au=aj.NewRoundFrame(aq.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="WindowSearchBarBackground",
},
ImageTransparency=0,
},{
aj.NewRoundFrame(aq.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Frame",
},{
al("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








al("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
al("ImageLabel",{
Image=aj.Icon"search"[1],
ImageRectSize=aj.Icon"search"[2].ImageRectSize,
ImageRectOffset=aj.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
}),
ar,
as,
al("UIListLayout",{
Padding=UDim.new(0,aq.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
al("UIPadding",{
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
}),
}),
}),
al("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
al("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=0.9,
Visible=false,
}),
at,
al("UISizeConstraint",{
MaxSize=Vector2.new(aq.Width,aq.MaxHeight),
}),
}),
al("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
})

local av=al("Frame",{
Size=UDim2.new(0,aq.Width,0,0),
AutomaticSize="Y",
Parent=ao,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
al("UIScale",{
Scale=0.9,
}),
au,















})

local function CreateSearchTab(aw,ax,ay,az,aA,aB)
local aC=al("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=az or nil,
},{
aj.NewRoundFrame(aq.Radius-11,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main",
},{
aj.NewRoundFrame(aq.Radius-11,"Glass-1",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Outline",
},{








al("UIPadding",{
PaddingTop=UDim.new(0,aq.Padding-2),
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
PaddingBottom=UDim.new(0,aq.Padding-2),
}),
al("ImageLabel",{
Image=aj.Icon(ay)[1],
ImageRectSize=aj.Icon(ay)[2].ImageRectSize,
ImageRectOffset=aj.Icon(ay)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
}),
al("Frame",{
Size=UDim2.new(1,-aq.IconSize-aq.Padding,0,0),
BackgroundTransparency=1,
},{
al("TextLabel",{
Text=aw,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(aj.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title",
}),
al("TextLabel",{
Text=ax or"",
Visible=ax and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.3,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(aj.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc",
})or nil,
al("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
}),
}),
al("UIListLayout",{
Padding=UDim.new(0,aq.Padding),
FillDirection="Horizontal",
}),
}),
},true),
al("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-aq.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=aA,

},{
aj.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.9,
}),
al("Frame",{
Size=UDim2.new(1,-aq.Padding-2,0,0),
Position=UDim2.new(0,aq.Padding+2,0,0),
BackgroundTransparency=1,
},{
al("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
al("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right",
}),
})



aC.Main.Size=UDim2.new(
1,
0,
0,
aC.Main.Outline.Frame.Desc.Visible
and(((aq.Padding-2)*2)+aC.Main.Outline.Frame.Title.TextBounds.Y+6+aC.Main.Outline.Frame.Desc.TextBounds.Y)
or(((aq.Padding-2)*2)+aC.Main.Outline.Frame.Title.TextBounds.Y)
)

aj.AddSignal(aC.Main.MouseEnter,function()
am(aC.Main,0.04,{ImageTransparency=0.95}):Play()

end)
aj.AddSignal(aC.Main.InputEnded,function()
am(aC.Main,0.08,{ImageTransparency=1}):Play()

end)
aj.AddSignal(aC.Main.MouseButton1Click,function()
if aB then
aB()
end
end)

return aC
end

local function ContainsText(aw,ax)
if not ax or ax==""then
return false
end

if not aw or aw==""then
return false
end

local ay=string.lower(aw)
local az=string.lower(ax)

return string.find(ay,az,1,true)~=nil
end

local function Search(aw)
if not aw or aw==""then
return{}
end

local ax={}
for ay,az in next,an.Tabs do
local aA=ContainsText(az.Title or"",aw)
local aB={}

for aC,aD in next,az.Elements do
if aD.__type~="Section"then
local aE=ContainsText(aD.Title or"",aw)
local aF=ContainsText(aD.Desc or"",aw)

if aE or aF then
aB[aC]={
Title=aD.Title,
Desc=aD.Desc,
Original=aD,
__type=aD.__type,
Index=aC,
}
end
end
end

if aA or next(aB)~=nil then
ax[ay]={
Tab=az,
Title=az.Title,
Icon=az.Icon,
Elements=aB,
}
end
end
return ax
end

aj.AddSignal(at.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

am(at,0.06,{
Size=UDim2.new(
1,
0,
0,
math.clamp(
at.UIListLayout.AbsoluteContentSize.Y+(aq.Padding*2),
0,
aq.MaxHeight
)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function aq.Open(aw)
task.spawn(function()
au.Frame.Visible=true
av.Visible=true
am(av.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function aq.Close(aw,ax)
task.spawn(function()
ap()
au.Frame.Visible=false
am(av.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(0.12)
av.Visible=false
if ax then
av:Destroy()
end
end)
end

aj.AddSignal(as.TextButton.MouseButton1Click,function()
aq:Close(true)
end)

aq:Open()

function aq.Search(aw,ax)
ax=ax or""

local ay=Search(ax)

at.Visible=true
au.Frame.Results.Frame.Visible=true
for az,aA in next,at:GetChildren()do
if aA.ClassName~="UIListLayout"and aA.ClassName~="UIPadding"then
aA:Destroy()
end
end

if ay and next(ay)~=nil then
for az,aA in next,ay do
local aB=aq.Icons.Tab
local aC=CreateSearchTab(aA.Title,nil,aB,at,true,function()
aq:Close()
an:SelectTab(az)
end)
if aA.Elements and next(aA.Elements)~=nil then
for aD,aE in next,aA.Elements do
local aF=aq.Icons[aE.__type]
CreateSearchTab(
aE.Title,
aE.Desc,
aF,
aC:FindFirstChild"ParentContainer"and aC.ParentContainer.Frame
or nil,
false,
function()
aq:Close()
an:SelectTab(az)
if aA.Tab.ScrollToTheElement then

aA.Tab:ScrollToTheElement(aE.Index)
end

end
)

end
end
end
elseif ax~=""then
al("TextLabel",{
Size=UDim2.new(1,0,0,70),
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.2,
BackgroundTransparency=1,
FontFace=Font.new(aj.Font,Enum.FontWeight.Medium),
Parent=at,
Name="NotFound",
})
else
at.Visible=false
au.Frame.Results.Frame.Visible=false
end
end

aj.AddSignal(ar:GetPropertyChangedSignal"Text",function()
aq:Search(ar.Text)
end)

return aq
end

return ag end function a.aH()



local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ag=aa(game:GetService"UserInputService")
local aj=aa(game:GetService"RunService")
local al=aa(game:GetService"Players")

local am=workspace.CurrentCamera

local an=a.load'v'

local ao=a.load'd'
local ap=a.load'e'
local aq=ao.New
local ar=ao.Tween


local as=a.load'y'.New
local at=a.load'n'.New
local au=a.load'z'.New
local av=a.load'A'

local aw=a.load'B'



return function(ax)
local ay=ax.Default==true or ax.Preset=="Default"or ax.Preset=="Obsidian"
local function Pick(az,aA)
if az~=nil then
return az
end
return aA
end
local function PickAlias(az,aA,aB)
if az~=nil then
return az
end
if aA~=nil then
return aA
end
return aB
end

if ay then
ax.NewElements=Pick(ax.NewElements,true)
ax.LiquidGlass=PickAlias(ax.LiquidGlass,ax.GlassLiquid,true)
ax.HideSearchBar=Pick(ax.HideSearchBar,false)
ax.LinkElementCorners=PickAlias(ax.LinkElementCorners,ax.ElementsLinkCorners,true)
ax.CornerLink=ax.CornerLink
or ax.LinkedCornerOptions
or(typeof(ax.LinkElementCorners)=="table"and ax.LinkElementCorners)
or(typeof(ax.ElementsLinkCorners)=="table"and ax.ElementsLinkCorners)
or{
InnerRadius=6,
BridgeHidden=true,
}
ax.ElementGap=PickAlias(ax.ElementGap,ax.ElementsGap,8)
ax.ElementTransparency=PickAlias(ax.ElementTransparency,ax.ElementsTransparency,0.18)
ax.BackgroundOverlayTransparency=Pick(ax.BackgroundOverlayTransparency,0.5)
ax.BackgroundColor=Pick(ax.BackgroundColor,Color3.fromHex"#101821")
ax.Radius=Pick(ax.Radius,20)
ax.SideBarWidth=Pick(ax.SideBarWidth,210)
ax.Topbar=ax.Topbar or{
Height=48,
ButtonsType="Mac",
}
end

local az={
Title=ax.Title or"UI Library",
Author=ax.Author,
Icon=ax.Icon,
IconSize=ax.IconSize or 22,
IconThemed=ax.IconThemed,
IconRadius=ax.IconRadius or 0,
Folder=ax.Folder,
Resizable=ax.Resizable~=false,
Background=ax.Background or ax.BackgroundImage,
BackgroundColor=ax.BackgroundColor,
BackgroundGradient=ax.BackgroundGradient,
BackgroundImageTransparency=ax.BackgroundImageTransparency or 0,
BackgroundOverlayTransparency=ax.BackgroundOverlayTransparency or 0.62,
BackgroundScaleType=ax.BackgroundScaleType or"Crop",
ShadowTransparency=ax.ShadowTransparency or 0.6,
User=ax.User or{},
Footer=ax.Footer or{},
Topbar=ax.Topbar or{Height=52,ButtonsType="Default"},

Size=ax.Size,

MinSize=ax.MinSize or Vector2.new(560,350),
MaxSize=ax.MaxSize or Vector2.new(850,560),

TopBarButtonIconSize=ax.TopBarButtonIconSize,

ToggleKey=ax.ToggleKey,
ElementsRadius=ax.ElementsRadius,
Radius=ax.Radius or 16,
Transparent=ax.Transparent or false,
ElementTransparency=ax.ElementTransparency or ax.ElementsTransparency,
ElementGlassTransparency=ax.ElementGlassTransparency or ax.GlassTransparency,
LiquidGlass=ax.LiquidGlass or ax.GlassLiquid or ax.ElementGlass or false,
ElementCornerStyle=ax.ElementCornerStyle or ax.ElementsCornerStyle or ax.CornerStyle,
ElementGap=ax.ElementGap or ax.ElementsGap,
LinkElementCorners=ax.LinkElementCorners==true
or ax.ElementsLinkCorners==true
or typeof(ax.LinkElementCorners)=="table"
or typeof(ax.ElementsLinkCorners)=="table",
ElementCornerLink=ax.CornerLink
or ax.LinkedCornerOptions
or(typeof(ax.LinkElementCorners)=="table"and ax.LinkElementCorners)
or(typeof(ax.ElementsLinkCorners)=="table"and ax.ElementsLinkCorners),
Watermark=ax.Watermark~=nil and ax.Watermark or ax.WaterMark,
KeyBindMenu=ax.KeyBindMenu==false and false or(ax.KeyBindMenu or{}),
HideSearchBar=ax.HideSearchBar~=false,
ScrollBarEnabled=ax.ScrollBarEnabled or false,
SideBarWidth=ax.SideBarWidth or 200,
Acrylic=ax.Acrylic or false,
NewElements=ax.NewElements or false,
Motion=ax.Motion,
Settings=ax.Settings==false and false or(ax.Settings or{}),
IgnoreAlerts=ax.IgnoreAlerts or false,
HidePanelBackground=ax.HidePanelBackground or false,
AutoScale=ax.AutoScale~=false,
OpenButton=ax.OpenButton,
DragFrameSize=160,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=ax.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=ax.Resizable~=false,
IsOpenButtonEnabled=true,

CurrentConfig=nil,
ConfigManager=nil,
AcrylicPaint=nil,
CurrentTab=nil,
TabModule=nil,

OnOpenCallback=nil,
OnCloseCallback=nil,
OnDestroyCallback=nil,

IsPC=false,

Gap=5,

TopBarButtons={},
AllElements={},

ElementConfig={},

PendingFlags={},

IsToggleDragging=false,
}

az.UICorner=az.Radius

az.TopBarButtonIconSize=az.TopBarButtonIconSize or(az.Topbar.ButtonsType=="Mac"and 11 or 16)

az.ElementConfig={
UIPadding=(az.NewElements and 10 or 13),
UICorner=az.ElementsRadius or(az.NewElements and 23 or 16),
Transparency=az.ElementTransparency,
GlassTransparency=az.ElementGlassTransparency or 0.24,
LiquidGlass=az.LiquidGlass,
CornerStyle=az.ElementCornerStyle or(az.NewElements and"Native"or"Shape"),
LinkCorners=az.LinkElementCorners,
CornerLink=az.ElementCornerLink,
}

local aA=az.Size or UDim2.new(0,580,0,460)
az.Size=UDim2.new(
aA.X.Scale,
math.clamp(aA.X.Offset,az.MinSize.X,az.MaxSize.X),
aA.Y.Scale,
math.clamp(aA.Y.Offset,az.MinSize.Y,az.MaxSize.Y)
)

if az.Topbar=={}then
az.Topbar={Height=52,ButtonsType="Default"}
end

if not aj:IsStudio()and az.Folder and writefile then
if not isfolder("WindUI/"..az.Folder)then
makefolder("WindUI/"..az.Folder)
end
if not isfolder("WindUI/"..az.Folder.."/assets")then
makefolder("WindUI/"..az.Folder.."/assets")
end
if not isfolder(az.Folder)then
makefolder(az.Folder)
end
if not isfolder(az.Folder.."/assets")then
makefolder(az.Folder.."/assets")
end
end

local aB=aq("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
})

if az.Folder then
az.ConfigManager=aw:Init(az)
end

if az.Acrylic then local
aC=an.AcrylicPaint{UseAcrylic=az.Acrylic}

az.AcrylicPaint=aC
end

local aC=aq("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true,
},{
aq("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})
local aD=ao.NewRoundFrame(az.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
aq("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=ao.Icon"expand"[1],
ImageRectOffset=ao.Icon"expand"[2].ImageRectPosition,
ImageRectSize=ao.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local aE=ao.NewRoundFrame(az.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})









az.UIElements.SideBar=aq("ScrollingFrame",{
Size=UDim2.new(
1,
az.ScrollBarEnabled and-3-(az.UIPadding/2)or 0,
1,
not az.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
aq("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
aq("UIPadding",{



PaddingBottom=UDim.new(0,az.UIPadding/2),
}),
aq("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,az.Gap),
}),
}),
aq("UIPadding",{

PaddingLeft=UDim.new(0,az.UIPadding/2),
PaddingRight=UDim.new(0,az.UIPadding/2),
PaddingBottom=UDim.new(0,az.UIPadding/2),
}),

})

az.UIElements.SideBarContainer=aq("Frame",{
Size=UDim2.new(
0,
az.SideBarWidth,
1,
az.User.Enabled and-az.Topbar.Height-42-(az.UIPadding*2)or-az.Topbar.Height
),
Position=UDim2.new(0,0,0,az.Topbar.Height),
BackgroundTransparency=1,
Visible=true,
},{
aq("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,not az.HideSearchBar and-45-az.UIPadding or-az.UIPadding/2),
Position=UDim2.new(0,0,1,-az.UIPadding/2),
AnchorPoint=Vector2.new(0,1),
}),
az.UIElements.SideBar,
})

if az.ScrollBarEnabled then
au(
az.UIElements.SideBar,
az.UIElements.SideBarContainer.Content,
az,
3,
ax.WindUI
)
end

az.UIElements.MainBar=aq("Frame",{
Size=UDim2.new(1,-az.UIElements.SideBarContainer.AbsoluteSize.X,1,-az.Topbar.Height),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
ao.NewRoundFrame(az.UICorner-(az.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="PanelBackground",
ImageTransparency="PanelBackgroundTransparency",
},


ZIndex=3,
Name="Background",
Visible=not az.HidePanelBackground,
}),
aq("UIPadding",{

PaddingLeft=UDim.new(0,az.UIPadding/2),
PaddingRight=UDim.new(0,az.UIPadding/2),
PaddingBottom=UDim.new(0,az.UIPadding/2),
}),
})

local aF=aq("ImageLabel",{
Image="rbxassetid://8992230677",
ThemeTag={
ImageColor3="WindowShadow",

},
ImageTransparency=1,
Size=UDim2.new(1,100,1,100),
Position=UDim2.new(0,-50,0,-50),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

if ag.TouchEnabled and not ag.KeyboardEnabled then
az.IsPC=false
elseif ag.KeyboardEnabled then
az.IsPC=true
else
az.IsPC=nil
end







local aG
if az.User then
local function GetUserThumb()local
aH=al:GetUserThumbnailAsync(
az.User.Anonymous and 1 or al.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
return aH
end

aG=aq("TextButton",{
Size=UDim2.new(
0,
az.UIElements.SideBarContainer.AbsoluteSize.X-(az.UIPadding/2),
0,
42+az.UIPadding
),
Position=UDim2.new(0,az.UIPadding/2,1,-(az.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
Visible=az.User.Enabled or false,
},{
ao.NewRoundFrame(az.UICorner-(az.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline",
},{
aq("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),
ao.NewRoundFrame(az.UICorner-(az.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
aq("ImageLabel",{
Image=GetUserThumb(),
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=0.93,
},{
aq("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
aq("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
aq("TextLabel",{
Text=az.User.Anonymous and"Anonymous"or al.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ao.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="DisplayName",
}),
aq("TextLabel",{
Text=az.User.Anonymous and"anonymous"or al.LocalPlayer.Name,
TextSize=15,
TextTransparency=0.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ao.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="UserName",
}),
aq("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
}),
}),
aq("UIListLayout",{
Padding=UDim.new(0,az.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aq("UIPadding",{
PaddingLeft=UDim.new(0,az.UIPadding/2),
PaddingRight=UDim.new(0,az.UIPadding/2),
}),
}),
})

function az.User.Enable(aH)
az.User.Enabled=true
ar(
az.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,az.SideBarWidth,1,-az.Topbar.Height-42-(az.UIPadding*2))},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aG.Visible=true
end
function az.User.Disable(aH)
az.User.Enabled=false
ar(
az.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,az.SideBarWidth,1,-az.Topbar.Height)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aG.Visible=false
end
function az.User.SetAnonymous(aH,aI)
if aI~=false then
aI=true
end
az.User.Anonymous=aI
aG.UserIcon.ImageLabel.Image=GetUserThumb()
aG.UserIcon.Frame.DisplayName.Text=aI and"Anonymous"or al.LocalPlayer.DisplayName
aG.UserIcon.Frame.UserName.Text=aI and"anonymous"or al.LocalPlayer.Name
end

if az.User.Enabled then
az.User:Enable()
else
az.User:Disable()
end

if az.User.Callback then
ao.AddSignal(aG.MouseButton1Click,function()
az.User.Callback()
end)
ao.AddSignal(aG.MouseEnter,function()
ar(aG.UserIcon,0.04,{ImageTransparency=0.95}):Play()
ar(aG.Outline,0.04,{ImageTransparency=0.85}):Play()
end)
ao.AddSignal(aG.InputEnded,function()
ar(aG.UserIcon,0.04,{ImageTransparency=1}):Play()
ar(aG.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local aH
local aI

local aJ=false
local aK

local function GetTransparencyValue(aL,aM)
local aN=tonumber(aL)
if aN==nil then
return aM
end
return math.clamp(math.floor(aN*100+0.5)/100,0,1)
end

local function ParseColorValue(aL)
if typeof(aL)=="Color3"then
return aL
end
if typeof(aL)=="string"and string.sub(aL,1,1)=="#"then
local aM,aN=pcall(function()
return Color3.fromHex(aL)
end)
return aM and aN or nil
end
return nil
end

local function GetUrlExtension(aL,aM)
if not aL or typeof(aL)~="string"then
return aM or".png"
end
local aN=aL:match"^([^?#]+)"or aL
local aO=aN:match"%.(%w+)$"
if aO then
aO=aO:lower()
if aO=="jpg"or aO=="jpeg"or aO=="png"or aO=="webp"or aO=="webm"then
return"."..aO
end
end
return aM or".png"
end

local function EnsureAssetFolder()
if aj:IsStudio()or not makefolder or not isfolder then
return
end

local aL=az.Folder or"Temp"
if not isfolder(aL)then
makefolder(aL)
end
if not isfolder(aL.."/assets")then
makefolder(aL.."/assets")
end
end

local function ReadHttp(aL)
if game.HttpGet then
return game:HttpGet(aL)
end
if ao.Request then
local aM=ao.Request{
Url=aL,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}
return aM and aM.Body
end
return nil
end

local function GetCustomAsset(aL)
if typeof(getcustomasset)~="function"then
return aL
end

local aM,aN=pcall(function()
return getcustomasset(aL)
end)
if aM then
return aN
end

warn("[ WindUI.Window.Background ] Failed to load custom asset: "..tostring(aN))
return aL
end

local function CacheHttpAsset(aL,aM)
if not writefile then
return aL
end

EnsureAssetFolder()
local aN=(az.Folder or"Temp")
.."/assets/."
..ao.SanitizeFilename(aL)
..GetUrlExtension(aL,aM)

if not isfile or not isfile(aN)then
local aO,aP=pcall(function()
local aO=ReadHttp(aL)
if aO then
writefile(aN,aO)
end
end)

if not aO then
warn("[ WindUI.Window.Background ] Failed to download asset: "..tostring(aP))
return aL
end
end

return GetCustomAsset(aN)
end

local function ResolveBackgroundAsset(aL,aM)
if typeof(aL)~="string"then
return""
end

local aN=string.match(aL,"^video:(.+)")
if aN then
aL=aN
aM="Video"
end

local aO=string.match(aL,"^customasset:(.+)")
or string.match(aL,"^getcustomasset:(.+)")
or string.match(aL,"^file:(.+)")
if aO then
return GetCustomAsset(aO)
end

if isfile and isfile(aL)then
return GetCustomAsset(aL)
end

if string.match(aL,"^https?://")then
return CacheHttpAsset(aL,aM=="Video"and".webm"or".png")
end

return aL
end

local function GetBackgroundKind(aL)
if aL==nil or aL==false then
return nil,nil,{}
end

if typeof(aL)=="table"then
local aM=aL.Type or aL.Kind or aL.Mode
if aL.Video or aM=="Video"or aM=="video"then
return"Video",aL.Video or aL.Url or aL.URL or aL.Source or aL.Asset or aL.Path,aL
end
if aL.Image or aL.Url or aL.URL or aL.Asset or aL.Path or aM=="Image"or aM=="image"then
return"Image",aL.Image or aL.Url or aL.URL or aL.Asset or aL.Path or aL.Source,aL
end
if aL.Color or aM=="Color"or aM=="color"then
return"Color",aL.Color or aL.Value,aL
end
return"Gradient",aL.Gradient or aL,aL
end

local aM=ParseColorValue(aL)
if aM then
return"Color",aM,{}
end

if typeof(aL)=="string"then
local aN=string.match(aL,"^video:(.+)")
local aO=aL:match"^([^?#]+)"or aL
if aN or string.match(aO:lower(),"%.webm$")then
return"Video",aN or aL,{}
end
return"Image",aL,{}
end

return nil,nil,{}
end

local function CreateDetachedMediaBackground(aL,aM,aN)
if aL=="Image"then
az.BackgroundScaleType=aN.ScaleType or az.BackgroundScaleType
az.BackgroundImageTransparency=GetTransparencyValue(
aN.Transparency or aN.ImageTransparency,
az.BackgroundImageTransparency
)
return aq("ImageLabel",{
Name="BackgroundImage",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=ResolveBackgroundAsset(aM,"Image"),
ImageTransparency=az.BackgroundImageTransparency,
ScaleType=az.BackgroundScaleType,
ZIndex=-10,
},{
aq("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
})
end

if aL=="Video"then
local aO=aq("VideoFrame",{
Name="BackgroundVideo",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=ResolveBackgroundAsset(aM,"Video"),
Looped=aN.Looped~=false,
Volume=math.clamp(tonumber(aN.Volume)or 0,0,1),
ZIndex=-10,
},{
aq("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
})
aO:Play()
return aO
end

return nil
end

local aL,aM,aN=GetBackgroundKind(az.Background)
aJ=aL=="Video"
aK=CreateDetachedMediaBackground(aL,aM,aN)

local aO=ao.NewRoundFrame(99,"Squircle",{
ImageTransparency=0.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
aq("TextButton",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
Name="Frame",
}),
})

function createAuthor(aP)
return aq("TextLabel",{
Text=aP,
FontFace=Font.new(ao.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.35,
AutomaticSize="XY",
Parent=az.UIElements.Main and az.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="WindowTopbarAuthor",
},
Name="Author",
})
end

local aP
local aQ

if az.Author then
aP=createAuthor(az.Author)
end

local aR=aq("TextLabel",{
Text=az.Title,
FontFace=Font.new(ao.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="WindowTopbarTitle",
},
})

az.UIElements.Main=aq("Frame",{
Size=UDim2.new(az.Size.X.Scale,az.Size.X.Offset,0,0),
Position=az.Position,
BackgroundTransparency=1,
Parent=ax.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,

},{
ax.WindUI.UIScaleObj,
az.AcrylicPaint and az.AcrylicPaint.Frame or nil,
aF,
ao.NewRoundFrame(az.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="WindowBackground",
},

},{
aK,
aO,
aC,
}),




aB,
aD,
aE,
aq("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
aq("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
az.UIElements.SideBarContainer,
az.UIElements.MainBar,

aG,

aI,
aq("Frame",{
Size=UDim2.new(1,0,0,az.Topbar.Height),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar",
},{
aH,






aq("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left",
},{
aq("UIListLayout",{
Padding=UDim.new(0,az.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aq("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
aq("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Center",
}),
aR,
aP,
}),
aq("UIPadding",{
PaddingLeft=UDim.new(0,4),
}),
}),
aq("CanvasGroup",{
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Center",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
AutomaticSize="Y",
Visible=false,
},{



aq("ScrollingFrame",{
Name="Holder",
BackgroundTransparency=1,
AutomaticSize="Y",
ScrollBarThickness=0,
ScrollingDirection="X",
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
Size=UDim2.new(1,0,1,0),


},{

aq("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,az.UIPadding/2),
}),
}),
}),
aq("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(az.Topbar.ButtonsType=="Default"and 1 or 0,0,0.5,0),
AnchorPoint=Vector2.new(az.Topbar.ButtonsType=="Default"and 1 or 0,0.5),
Name="Right",
},{
aq("UIListLayout",{
Padding=UDim.new(0,az.Topbar.ButtonsType=="Default"and 9 or 0),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),
}),
aq("UIPadding",{
PaddingTop=UDim.new(0,az.UIPadding),
PaddingLeft=UDim.new(
0,
az.Topbar.ButtonsType=="Default"and az.UIPadding or az.UIPadding-2
),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,az.UIPadding),
}),
}),
}),
})

ao.AddSignal(az.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
local aS=0
local aT=az.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
/ax.WindUI.UIScale

aS=az.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X/ax.WindUI.UIScale
if az.Topbar.ButtonsType~="Default"then
aS=aS+aT+az.UIPadding-4
end

az.UIElements.Main.Main.Topbar.Center.Position=
UDim2.new(0,aS+(az.UIPadding/ax.WindUI.UIScale),0.5,0)
az.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-aS
-(az.UIPadding/ax.WindUI.UIScale)
-(az.Topbar.ButtonsType=="Default"and aT+az.UIPadding or 0),
1,
0
)
end)

if az.Topbar.ButtonsType~="Default"then
ao.AddSignal(az.UIElements.Main.Main.Topbar.Right:GetPropertyChangedSignal"AbsoluteSize",function()
az.UIElements.Main.Main.Topbar.Left.Position=UDim2.new(
0,
(az.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X/ax.WindUI.UIScale)+az.UIPadding-4,
0,
0
)
end)
end

local function GetImageTarget(aS)
if typeof(aS)~="Instance"then
return nil
end

if aS:IsA"ImageLabel"or aS:IsA"ImageButton"then
return aS
end

return aS:FindFirstChildWhichIsA"ImageLabel"or aS:FindFirstChildWhichIsA"ImageButton"
end

function az.CreateTopbarButton(aS,aT,aU,aV,b,d,e,f,g)
local h=b or 999
g=g or{}
local i=g.ForceIcon==true
local j=az.Topbar.ButtonsType=="Default"or i
local m=az.Topbar.ButtonsType~="Default"and not i
local p=ao.Image(
aU,
aU,
0,
az.Folder,
"WindowTopbarIcon",
j,
d,
"WindowTopbarButtonIcon"
)
p.Size=j
and UDim2.new(0,f or az.TopBarButtonIconSize,0,f or az.TopBarButtonIconSize)
or UDim2.new(0,0,0,0)
p.AnchorPoint=Vector2.new(0.5,0.5)
p.Position=UDim2.new(0.5,0,0.5,0)
local r=GetImageTarget(p)
if r then
r.ImageTransparency=j and 0 or 1
end

if m and r then
r.ImageColor3=ao.GetTextColorForHSB(e or Color3.fromHex"#ff3030")
end

local u=ao.NewRoundFrame(
j and az.UICorner-(az.UIPadding/2)or 999,
"Squircle",
{
Size=j
and UDim2.new(0,az.Topbar.Height-16,0,az.Topbar.Height-16)
or UDim2.new(0,14,0,14),
LayoutOrder=h,


ZIndex=9999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=m and(e or Color3.fromHex"#ff3030")or nil,
ThemeTag=j and{
ImageColor3="Text",
}or nil,
ImageTransparency=j and 1 or 0,
},
{












p,
aq("UIScale",{
Scale=1,
}),
},
true
)

local v=aq("Frame",{
Size=m and UDim2.new(0,24,0,24)
or UDim2.new(0,az.Topbar.Height-16,0,az.Topbar.Height-16),
BackgroundTransparency=1,
Parent=az.UIElements.Main.Main.Topbar.Right,
LayoutOrder=h,
},{
u,
})



az.TopBarButtons[100-h]={
Name=aT,
Object=v,
}

ao.AddSignal(u.MouseButton1Click,function()
if aV then
aV()
end
end)
ao.AddSignal(u.MouseEnter,function()
if j then
ap.Play(u,"Hover",{ImageTransparency=0.93},nil,nil,"Hover")


else

ap.Play(
r,
"Hover",
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
ap.Play(p,"Hover",{
Size=UDim2.new(
0,
f or az.TopBarButtonIconSize,
0,
f or az.TopBarButtonIconSize
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Hover")
end
end)

ao.AddSignal(u.MouseButton1Down,function()
ap.Play(u.UIScale,"Press",{Scale=0.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Press")
end)

ao.AddSignal(u.MouseLeave,function()
if j then
ap.Play(u,"Hover",{ImageTransparency=1},nil,nil,"Hover")


else

ap.Play(
r,
"Hover",
{ImageTransparency=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
ap.Play(
p,
"Hover",
{Size=UDim2.new(0,0,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Hover"
)
end
end)

ao.AddSignal(u.InputEnded,function()
ap.Play(u.UIScale,"Press",{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Press")
end)

return u
end

function az.Topbar.Button(aS,aT:{
Name:string,
Icon:string,
Callback:any,
LayoutOrder:number,
IconThemed:boolean,
Color:Color3,
IconSize:number,
Options:table,
})
return az:CreateTopbarButton(
aT.Name,
aT.Icon,
aT.Callback,
aT.LayoutOrder or 0,
aT.IconThemed,
aT.Color,
aT.IconSize,
aT.Options
)
end



local aS=ao.Drag(
az.UIElements.Main,
{az.UIElements.Main.Main.Topbar,aO.Frame},
function(aS,aT)
if not az.Closed then
if aS and aT==aO.Frame then
ar(aO,0.1,{ImageTransparency=0.35}):Play()
else
ar(aO,0.2,{ImageTransparency=0.8}):Play()
end
az.Position=az.UIElements.Main.Position
az.Dragging=aS
end
end
)

local function ParseBackgroundColor(aT)
return ParseColorValue(aT)
end

local function ApplyBackgroundColor(aT)
local aU=ParseBackgroundColor(aT)
if aU then
az.BackgroundColor=aT
ap.Play(
az.UIElements.Main.Background,
"Background",
{ImageColor3=aU},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"BackgroundColor"
)
end
return aU
end

local function SetBackgroundGradientObject(aT,aU)
if az.UIElements.BackgroundGradient then
az.UIElements.BackgroundGradient:Destroy()
az.UIElements.BackgroundGradient=nil
end

if typeof(aT)~="table"then
return nil
end

local aV=aT.Color~=nil
or aT.Transparency~=nil
or aT.Rotation~=nil
or aT.Offset~=nil
if not aV then
return nil
end

local b=aq"UIGradient"
for d,e in next,aT do
if d=="Transparency"and typeof(e)=="number"then
continue
end
pcall(function()
b[d]=e
end)
end

local d=ao.NewRoundFrame(az.UICorner,"Squircle",{
Name="BackgroundGradient",
Size=UDim2.new(1,0,1,0),
Parent=az.UIElements.Main.Background,
ImageTransparency=aU or az.BackgroundOverlayTransparency,
ZIndex=-9,
},{
b,
})

az.UIElements.BackgroundGradient=d
return d
end

local function ClearDetachedBackgroundMedia(aT)
if aT~="Image"and aK and aK:IsA"ImageLabel"then
aK:Destroy()
aK=nil
elseif aT~="Video"and aK and aK:IsA"VideoFrame"then
aK:Destroy()
aK=nil
end

if aT~="Gradient"and az.UIElements.BackgroundGradient then
az.UIElements.BackgroundGradient:Destroy()
az.UIElements.BackgroundGradient=nil
end
end

local function CreateImageBackground()
ClearDetachedBackgroundMedia"Image"

if aK and aK:IsA"ImageLabel"then
return aK
end

if aK then
aK:Destroy()
end

aK=aq("ImageLabel",{
Name="BackgroundImage",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ScaleType=az.BackgroundScaleType,
ZIndex=-10,
Parent=az.UIElements.Main.Background,
},{
aq("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
})

return aK
end

local function CreateVideoBackground()
ClearDetachedBackgroundMedia"Video"

if aK then
aK:Destroy()
end

aK=aq("VideoFrame",{
Name="BackgroundVideo",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Looped=true,
Volume=0,
ZIndex=-10,
Parent=az.UIElements.Main.Background,
},{
aq("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
})

return aK
end

if az.BackgroundColor then
ApplyBackgroundColor(az.BackgroundColor)
elseif aL=="Color"then
ApplyBackgroundColor(aM)
end

local aT=az.BackgroundGradient
or(aL=="Gradient"and aM or nil)
if aT then
local aU=az.BackgroundGradient and az.BackgroundOverlayTransparency
or(az.Transparent and ax.WindUI.TransparencyValue or 0)
SetBackgroundGradientObject(aT,aU)
end














az.OpenButtonMain=a.load'C'.New(az)
az.OpenButtonController=az.OpenButtonMain
az.WatermarkMain=a.load'D'.New(az,ax.WindUI)

function az.SetWatermark(aU,aV)
az.Watermark=aV
return az.WatermarkMain:Edit(aV)
end

function az.ToggleWatermark(aU,aV)
if az.WatermarkMain then
az.WatermarkMain:Visible(aV)
end
end

if az.Watermark~=nil and az.Watermark~=false then
az:SetWatermark(az.Watermark)
end

task.spawn(function()
if az.Icon then
local aU=aq("Frame",{
Size=UDim2.new(0,22,0,22),
BackgroundTransparency=1,
Parent=az.UIElements.Main.Main.Topbar.Left,
})

aQ=ao.Image(
az.Icon,
az.Title,
az.IconRadius,
az.Folder,
"Window",
true,
az.IconThemed,
"WindowTopbarIcon"
)
aQ.Parent=aU
aQ.Size=UDim2.new(0,az.IconSize,0,az.IconSize)
aQ.Position=UDim2.new(0.5,0,0.5,0)
aQ.AnchorPoint=Vector2.new(0.5,0.5)

az.OpenButtonMain:SetIcon(az.Icon)











else
az.OpenButtonMain:SetIcon(az.Icon)

end
end)

function az.SetToggleKey(aU,aV)
az.ToggleKey=aV
end

function az.SetTitle(aU,aV)
az.Title=aV
aR.Text=aV
end

function az.SetAuthor(aU,aV)
az.Author=aV
if not aP then
aP=createAuthor(az.Author)
end

aP.Text=aV
end

function az.SetSize(aU,aV)
if typeof(aV)=="UDim2"then
az.Size=aV

ar(az.UIElements.Main,0.08,{Size=aV},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

local function GetBackgroundTransparency(aU,aV)
return GetTransparencyValue(aU,aV)
end

function az.SetBackgroundImage(aU,aV,b)
b=typeof(b)=="table"and b or{Transparency=b}
ClearDetachedBackgroundMedia"Image"
local d=CreateImageBackground()
az.Background=aV
az.BackgroundGradient=nil
az.BackgroundScaleType=b.ScaleType or az.BackgroundScaleType
az.BackgroundImageTransparency=GetBackgroundTransparency(
b.Transparency or b.ImageTransparency,
az.BackgroundImageTransparency
)
d.ScaleType=az.BackgroundScaleType
d.Image=ResolveBackgroundAsset(aV,"Image")
d.ImageTransparency=1
ap.Play(
d,
"Background",
{ImageTransparency=az.BackgroundImageTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"BackgroundImage"
)
return d
end

function az.SetBackgroundVideo(aU,aV,b)
b=typeof(b)=="table"and b or{}
ClearDetachedBackgroundMedia"Video"
local d=CreateVideoBackground()
az.Background="video:"..tostring(aV or"")
az.BackgroundGradient=nil
d.Video=ResolveBackgroundAsset(aV,"Video")
d.Visible=true
d.Looped=b.Looped~=false
d.Volume=math.clamp(tonumber(b.Volume)or d.Volume or 0,0,1)
d:Play()
return d
end

function az.SetBackgroundGradient(aU,aV,b)
ClearDetachedBackgroundMedia"Gradient"
az.BackgroundGradient=aV
az.Background=nil
az.BackgroundOverlayTransparency=GetBackgroundTransparency(b,az.BackgroundOverlayTransparency)
local d=SetBackgroundGradientObject(aV,1)
if d then
ap.Play(
d,
"Background",
{ImageTransparency=az.BackgroundOverlayTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"BackgroundGradient"
)
end
return d
end

function az.SetBackgroundColor(aU,aV)
return ApplyBackgroundColor(aV)
end

function az.SetBackgroundOverlayTransparency(aU,aV)
az.BackgroundOverlayTransparency=GetBackgroundTransparency(aV,az.BackgroundOverlayTransparency)
if az.UIElements.BackgroundGradient then
ap.Play(
az.UIElements.BackgroundGradient,
"Background",
{ImageTransparency=az.BackgroundOverlayTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"BackgroundGradient"
)
end
return az.BackgroundOverlayTransparency
end

function az.SetBackground(aU,aV,b)
if aV==nil or aV==false then
az.Background=nil
az.BackgroundGradient=nil
if aK then
aK:Destroy()
aK=nil
end
if az.UIElements.BackgroundGradient then
az.UIElements.BackgroundGradient:Destroy()
az.UIElements.BackgroundGradient=nil
end
return nil
end

local d,e,f=GetBackgroundKind(aV)
local g={}
if typeof(f)=="table"then
for h,i in next,f do
g[h]=i
end
end
if typeof(b)=="table"then
for h,i in next,b do
g[h]=i
end
elseif b~=nil then
g.Transparency=b
end

if d=="Gradient"then
return az:SetBackgroundGradient(e,g.Transparency or g.OverlayTransparency)
elseif d=="Color"then
return az:SetBackgroundColor(e)
elseif d=="Video"then
return az:SetBackgroundVideo(e,g)
elseif d=="Image"then
return az:SetBackgroundImage(e,g)
end

return nil
end

function az.SetBackgroundImageTransparency(aU,aV)
az.BackgroundImageTransparency=GetBackgroundTransparency(aV,az.BackgroundImageTransparency)
if aK and aK:IsA"ImageLabel"then
ap.Play(
aK,
"Background",
{ImageTransparency=az.BackgroundImageTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"BackgroundImage"
)
end
end

function az.SetBackgroundTransparency(aU,aV)
local b=math.floor(tonumber(aV)*10+0.5)/10
ax.WindUI.TransparencyValue=b
az:ToggleTransparency(b>0)
end

function az.SetElementTransparency(aU,aV)
local b=math.floor(ao.ClampTransparency(aV,az.ElementConfig.Transparency or 0)*100+0.5)
/100

az.ElementTransparency=b
az.ElementConfig.Transparency=b

for d,e in next,az.AllElements do
if e and e.SetTransparency then
e:SetTransparency(b)
end
end

return b
end

function az.SetLiquidGlass(aU,aV)
az.LiquidGlass=aV==true
az.ElementConfig.LiquidGlass=az.LiquidGlass

for b,d in next,az.AllElements do
if d and d.SetLiquidGlass then
d:SetLiquidGlass(az.LiquidGlass)
end
end
end

local aU
local aV
ao.Icon"minimize"
ao.Icon"maximize"

if az.Settings~=false and az.Topbar.Settings~=false then
local b=a.load'E'.New(az,ax.WindUI,ax)
local d=az:CreateTopbarButton(
"Settings",
"settings",
function()
b:Toggle()
end,
az.Topbar.ButtonsType=="Default"and 997 or 1000,
true,
Color3.fromHex"#9B87F5",
nil,
{
ForceIcon=true,
}
)
b:SetButton(d)
az.SettingsMenu=b
end

if az.KeyBindMenu~=false and az.Topbar.KeyBindMenu~=false then
local b=a.load'F'.New(az,ax.WindUI,ax)
local d=az:CreateTopbarButton(
"KeyBind",
"keyboard",
function()
b:Toggle()
end,
az.Topbar.ButtonsType=="Default"and 996 or 1001,
true,
Color3.fromHex"#38BDF8",
nil,
{
ForceIcon=true,
}
)
b:SetButton(d)
az.KeyBindMenuMain=b

function az.ToggleKeyBindMenu(e)
return b:Toggle()
end

function az.OpenKeyBindMenu(e)
return b:OpenMenu()
end
end

az:CreateTopbarButton(
"Fullscreen",
az.Topbar.ButtonsType=="Mac"and"rbxassetid://127426072704909"or"maximize",
function()
az:ToggleFullscreen()
end,
(az.Topbar.ButtonsType=="Default"and 998 or 999),
true,
Color3.fromHex"#60C762",
az.Topbar.ButtonsType=="Mac"and 9 or nil
)

local function SetSize(b)
ap.Play(az.UIElements.Main,"Resize",{
Size=not az.IsFullscreen and aV or UDim2.new(
0,
(ax.WindUI.ScreenGui.AbsoluteSize.X-20)/ax.WindUI.UIScale,
0,
(ax.WindUI.ScreenGui.AbsoluteSize.Y-20-52)/ax.WindUI.UIScale
),
Position=not az.IsFullscreen and aU or UDim2.new(0.5,0,0.5,26),
},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Fullscreen"
)
end

function az.ToggleFullscreen(b)
local d=az.IsFullscreen

aS:Set(d)

if not d then
aU=az.UIElements.Main.Position
aV=az.UIElements.Main.Size

az.CanResize=false
else
if az.Resizable then
az.CanResize=true
end
end

az.IsFullscreen=not d

SetSize(true)
end

ao.AddSignal(ax.WindUI.ScreenGui:GetPropertyChangedSignal"AbsoluteSize",function()
if az.IsFullscreen then
SetSize()
end
end)

az:CreateTopbarButton("Minimize","minus",function()
if az.Close then
az:Close()
end






















end,(az.Topbar.ButtonsType=="Default"and 997 or 998),nil,Color3.fromHex"#F4C948")

function az.OnOpen(b,d)
az.OnOpenCallback=d
end
function az.OnClose(b,d)
az.OnCloseCallback=d
end
function az.OnDestroy(b,d)
az.OnDestroyCallback=d
end

if ax.WindUI.UseAcrylic then
az.AcrylicPaint.AddParent(az.UIElements.Main)
end

function az.SetIconSize(b,d)
local e
if typeof(d)=="number"then
e=UDim2.new(0,d,0,d)
az.IconSize=d
elseif typeof(d)=="UDim2"then
e=d
az.IconSize=d.X.Offset
end

if aQ then
aQ.Size=e
end
end

function az.Open(b)
if az.Destroyed then
return
end
task.spawn(function()
if az.OnOpenCallback then
task.spawn(function()
ao.SafeCallback(az.OnOpenCallback)
end)
end

task.wait(0.06)
az.Closed=false

az.UIElements.Main.Size=UDim2.new(az.Size.X.Scale,az.Size.X.Offset,0,100)

ap.Play(az.UIElements.Main,"WindowOpen",{

Size=az.Size,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Window")

if az.UIElements.BackgroundGradient then
ap.Play(az.UIElements.BackgroundGradient,"Focus",{
ImageTransparency=az.BackgroundGradient and az.BackgroundOverlayTransparency or 0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Window")
end

az.UIElements.Main.Background.ImageTransparency=1
ap.Play(az.UIElements.Main.Background,"WindowOpen",{

ImageTransparency=az.Transparent and ax.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,"WindowBackground")

if aK then
if aK:IsA"VideoFrame"then
aK.Visible=true
else
ap.Play(aK,"Focus",{
ImageTransparency=az.BackgroundImageTransparency,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Window")
end
end

if az.OpenButtonMain and az.IsOpenButtonEnabled then
az.OpenButtonMain:Visible(false)
end









ap.Play(
aF,
"WindowOpen",
{ImageTransparency=az.ShadowTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out,
"Window"
)




ap.Play(
aO,
"WindowOpen",
{Size=UDim2.new(0,az.DragFrameSize,0,4),ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out,
"Window"
)
aS:Set(true)

if az.Resizable then
ap.Play(
aC.ImageLabel,
"WindowOpen",
{ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out,
"Window"
)
az.CanResize=true
end

az.CanDropdown=true
az.UIElements.Main.Visible=true



az.UIElements.Main:WaitForChild"Main".Visible=true

ax.WindUI:ToggleAcrylic(true)

end)
end
function az.Close(b)
if az.Destroyed then
return
end

local d={}

if az.OnCloseCallback then
task.spawn(function()
ao.SafeCallback(az.OnCloseCallback)
end)
end

ax.WindUI:ToggleAcrylic(false)

if az.UIElements.Main and az.UIElements.Main:WaitForChild"Main"then
az.UIElements.Main.Main.Visible=false
end

az.CanDropdown=false
az.Closed=true

ap.Play(az.UIElements.Main,"WindowClose",{

Size=UDim2.new(az.Size.X.Scale,az.Size.X.Offset,0,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Window")
if az.UIElements.BackgroundGradient then
ap.Play(az.UIElements.BackgroundGradient,"Fast",{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Window")
end

ap.Play(az.UIElements.Main.Background,"WindowClose",{

ImageTransparency=1,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,"WindowBackground")








if aK then
if aK:IsA"VideoFrame"then
aK.Visible=false
else
ap.Play(aK,"WindowClose",{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Window")
end
end
ap.Play(aF,"WindowClose",{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out,"Window")




ap.Play(
aO,
"WindowClose",
{Size=UDim2.new(0,0,0,4),ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out,
"Window"
)
ap.Play(
aC.ImageLabel,
"WindowClose",
{ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out,
"Window"
)
aS:Set(false)
az.CanResize=false

task.spawn(function()
task.wait(ap.GetDuration"WindowClose"+0.05)

if not az.Closed then
return
end

az.UIElements.Main.Visible=false

if az.OpenButtonMain and not az.Destroyed and not az.IsPC and az.IsOpenButtonEnabled then
az.OpenButtonMain:Visible(true)
end
end)

function d.Destroy(e)
task.spawn(function()
if az.OnDestroyCallback then
task.spawn(function()
ao.SafeCallback(az.OnDestroyCallback)
end)
end

if az.AcrylicPaint and az.AcrylicPaint.Model then
az.AcrylicPaint.Model:Destroy()
end

az.Destroyed=true

task.wait(0.4)

ax.WindUI.ScreenGui:Destroy()
ax.WindUI.NotificationGui:Destroy()
ax.WindUI.DropdownGui:Destroy()
ax.WindUI.TooltipGui:Destroy()

ao.DisconnectAll()

return
end)
end

return d
end
function az.Destroy(b)
return az:Close():Destroy()
end
function az.Toggle(b)
if az.Closed then
az:Open()
else
az:Close()
end
end

function az.ToggleTransparency(b,d)

az.Transparent=d
ax.WindUI.Transparent=d

az.UIElements.Main.Background.ImageTransparency=d and ax.WindUI.TransparencyValue or 0
if az.UIElements.BackgroundGradient then
az.UIElements.BackgroundGradient.ImageTransparency=d and ax.WindUI.TransparencyValue
or az.BackgroundOverlayTransparency
end


end

function az.LockAll(b)
for d,e in next,az.AllElements do
if e.Lock then
e:Lock()
end
end
end
function az.UnlockAll(b)
for d,e in next,az.AllElements do
if e.Unlock then
e:Unlock()
end
end
end
function az.GetLocked(b)
local d={}

for e,f in next,az.AllElements do
if f.Locked then
table.insert(d,f)
end
end

return d
end
function az.GetUnlocked(b)
local d={}

for e,f in next,az.AllElements do
if f.Locked==false then
table.insert(d,f)
end
end

return d
end

function az.GetUIScale(b,d)
return ax.WindUI.UIScale
end

function az.SetUIScale(b,d)
ax.WindUI.UIScale=d
ar(ax.WindUI.UIScaleObj,0.2,{Scale=d},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
return az
end

function az.SetToTheCenter(b)
ar(
az.UIElements.Main,
0.45,
{Position=UDim2.new(0.5,0,0.5,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
return az
end

function az.SetCurrentConfig(b,d)
az.CurrentConfig=d
end

do
local b=40
local d=am.ViewportSize
local e=Vector2.new(az.Size.X.Offset,az.Size.Y.Offset)

if not az.IsFullscreen and az.AutoScale then
local f=d.X-(b*2)
local g=d.Y-(b*2)

local h=f/e.X
local i=g/e.Y

local j=math.min(h,i)

local m=0.3
local p=1.0

local r=math.clamp(j,m,p)

local u=az:GetUIScale()or 1
local v=0.05

if math.abs(r-u)>v then
az:SetUIScale(r)
end
end
end

if az.OpenButtonMain and az.OpenButtonMain.Button then
ao.AddSignal(az.OpenButtonMain.Button.TextButton.MouseButton1Click,function()


az:Open()
end)
end

ao.AddSignal(ag.InputBegan,function(b,d)
if d then
return
end

if az.ToggleKey then
if b.KeyCode==az.ToggleKey then
az:Toggle()
end
end
end)

task.spawn(function()

az:Open()
end)

function az.EditOpenButton(b,d)
return az.OpenButtonMain:Edit(d)
end

function az.GetOpenButton(b)
return az.OpenButtonMain
end

function az.SetOpenButtonState(b,d,e,f)
return az.OpenButtonMain:SetState(d,e,f)
end

function az.ExpandOpenButton(b,d,e)
return az.OpenButtonMain:Expand(d,e)
end

function az.CollapseOpenButton(b,d)
return az.OpenButtonMain:Collapse(d)
end

function az.CompactOpenButton(b,d)
return az.OpenButtonMain:Compact(d)
end

function az.PushOpenButton(b,d,e)
return az.OpenButtonMain:Push(d,e)
end

if az.OpenButton and typeof(az.OpenButton)=="table"then
az:EditOpenButton(az.OpenButton)
end

local b=a.load'aD'
local d=a.load'aE'
local e=b.Init(az,ax.WindUI,ax.WindUI.TooltipGui)
e:OnChange(function(f)
az.CurrentTab=f
end)

az.TabModule=e

function az.Tab(f,g)
g.Parent=az.UIElements.SideBar.Frame
return e.New(g,ax.WindUI.UIScale)
end

function az.SelectTab(f,g)
e:SelectTab(g)
end

function az.Section(f,g)
return d.New(
g,
az.UIElements.SideBar.Frame,
az.Folder,
ax.WindUI.UIScale,
az
)
end

function az.IsResizable(f,g)
az.Resizable=g
az.CanResize=g
end

function az.SetPanelBackground(f,g)
if typeof(g)=="boolean"then
az.HidePanelBackground=g

az.UIElements.MainBar.Background.Visible=g

if e then
for h,i in next,e.Containers do
i.ScrollingFrame.UIPadding.PaddingTop=UDim.new(0,az.HidePanelBackground and 20 or 10)
i.ScrollingFrame.UIPadding.PaddingLeft=
UDim.new(0,az.HidePanelBackground and 20 or 10)
i.ScrollingFrame.UIPadding.PaddingRight=
UDim.new(0,az.HidePanelBackground and 20 or 10)
i.ScrollingFrame.UIPadding.PaddingBottom=
UDim.new(0,az.HidePanelBackground and 20 or 10)
end
end
end
end

function az.Divider(f)
local g=aq("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
})
local h=aq("Frame",{
Parent=az.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
g,
})

return h
end

local f=a.load'p'
function az.Dialog(g,h)
local i={
Title=h.Title or"Dialog",
Width=h.Width or 320,
Content=h.Content,
Buttons=h.Buttons or{},

TextPadding=14,
}
local j=f.Create(false,"Dialog",az,ax.WindUI,az.UIElements.Main.Main)

j.UIElements.Main.Size=UDim2.new(0,i.Width,0,0)

local m=aq("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=j.UIElements.Main,
},{
aq("UIListLayout",{
FillDirection="Vertical",

Padding=UDim.new(0,j.UIPadding),
}),
})

local p=aq("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=m,
},{
aq("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,j.UIPadding),
VerticalAlignment="Center",
}),
aq("UIPadding",{
PaddingTop=UDim.new(0,i.TextPadding/2),
PaddingLeft=UDim.new(0,i.TextPadding/2),
PaddingRight=UDim.new(0,i.TextPadding/2),
}),
})

local r
if h.Icon then
r=ao.Image(
h.Icon,
i.Title..":"..h.Icon,
0,
az,
"Dialog",
true,
h.IconThemed
)
r.Size=UDim2.new(0,22,0,22)
r.Parent=p
end

j.UIElements.UIListLayout=aq("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
VerticalFlex="SpaceBetween",
Parent=j.UIElements.Main,
})

aq("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=j.UIElements.Main,
})

j.UIElements.Title=aq("TextLabel",{
Text=i.Title,
TextSize=20,
FontFace=Font.new(ao.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,r and-26-j.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=p,
})
if i.Content then
aq("TextLabel",{
Text=i.Content,
TextSize=18,
TextTransparency=0.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(ao.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=m,
},{
aq("UIPadding",{
PaddingLeft=UDim.new(0,i.TextPadding/2),
PaddingRight=UDim.new(0,i.TextPadding/2),
PaddingBottom=UDim.new(0,i.TextPadding/2),
}),
})
end

local u=aq("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Center",
HorizontalFlex="Fill",
})

local v=aq("Frame",{
Size=UDim2.new(1,0,0,36),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=j.UIElements.Main,
LayoutOrder=4,
},{
u,






})

local x={}

for z,A in next,i.Buttons do
local B=
at(A.Title,A.Icon,A.Callback,A.Variant,v,j,true)
table.insert(x,B)
B.Size=UDim2.new(1,0,1,0)
end





















































j:Open()

return j
end

local g=false

az:CreateTopbarButton("Close","x",function()
if not g then
if not az.IgnoreAlerts then
g=true

az:Dialog{

Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()
g=false
end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()
g=false
az:Destroy()
end,
Variant="Primary",
},
},
}
else
az:Destroy()
end
end
end,(az.Topbar.ButtonsType=="Default"and 999 or 997),nil,Color3.fromHex"#F4695F")

function az.Tag(h,i)
if az.UIElements.Main.Main.Topbar.Center.Visible==false then
az.UIElements.Main.Main.Topbar.Center.Visible=true
end
i.Window=az
return av:New(i,az.UIElements.Main.Main.Topbar.Center.Holder)
end

local h=ax.WindUI.GenerateGUID()

local function startResizing(i)
if az.CanResize then
isResizing=true
aD.Active=true
initialSize=az.UIElements.Main.Size
initialInputPosition=i.Position


ar(aC.ImageLabel,0.1,{ImageTransparency=0.35}):Play()

ao.AddSignal(i.Changed,function()
if i.UserInputState==Enum.UserInputState.End then
if ax.WindUI.CurrentInput and ax.WindUI.CurrentInput~=h then
return
end

ax.WindUI.CurrentInput=nil

isResizing=false
aD.Active=false


ar(aC.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)
end
end

ao.AddSignal(aC.InputBegan,function(i)
if
i.UserInputType==Enum.UserInputType.MouseButton1
or i.UserInputType==Enum.UserInputType.Touch
then
if ax.WindUI.CurrentInput and ax.WindUI.CurrentInput~=h then
return
end
ax.WindUI.CurrentInput=h

if az.CanResize then
startResizing(i)
end
end
end)

ao.AddSignal(ag.InputChanged,function(i)
if
i.UserInputType==Enum.UserInputType.MouseMovement
or i.UserInputType==Enum.UserInputType.Touch
then
if isResizing and az.CanResize then
local j=i.Position-initialInputPosition
local m=UDim2.new(0,initialSize.X.Offset+j.X*2,0,initialSize.Y.Offset+j.Y*2)

m=UDim2.new(
m.X.Scale,
math.clamp(m.X.Offset,az.MinSize.X,az.MaxSize.X),
m.Y.Scale,
math.clamp(m.Y.Offset,az.MinSize.Y,az.MaxSize.Y)
)

ar(az.UIElements.Main,0.08,{
Size=m,
},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()

az.Size=m
end
end
end)

ao.AddSignal(aC.MouseEnter,function()
if ax.WindUI.CurrentInput and ax.WindUI.CurrentInput~=h then
return
end
if not isResizing then
ar(aC.ImageLabel,0.1,{ImageTransparency=0.35}):Play()
end
end)
ao.AddSignal(aC.MouseLeave,function()
if ax.WindUI.CurrentInput and ax.WindUI.CurrentInput~=h then
return
end
if not isResizing then
ar(aC.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)



local i=0
local j=0.4
local m
local p=0

function onDoubleClick()
az:SetToTheCenter()
end

ao.AddSignal(aO.Frame.MouseButton1Up,function()
local r=tick()
local u=az.Position

p=p+1

if p==1 then
i=r
m=u

task.spawn(function()
task.wait(j)
if p==1 then
p=0
m=nil
end
end)
elseif p==2 then
if r-i<=j and u==m then
onDoubleClick()
end

p=0
m=nil
i=0
else
p=1
i=r
m=u
end
end)



if not az.HideSearchBar then
local r=a.load'aG'
local u=false





















local v=as("Search","search",az.UIElements.SideBarContainer,true)
v.Size=UDim2.new(1,-az.UIPadding/2,0,39)
v.Position=UDim2.new(0,az.UIPadding/2,0,0)

ao.AddSignal(v.MouseButton1Click,function()
if u then
return
end

r.new(az.TabModule,az.UIElements.Main,function()

u=false
if az.Resizable then
az.CanResize=true
end

ar(aE,0.1,{ImageTransparency=1}):Play()
aE.Active=false
end)
ar(aE,0.1,{ImageTransparency=0.65}):Play()
aE.Active=true

u=true
az.CanResize=false
end)
end



function az.DisableTopbarButtons(r,u)
for v,x in next,u do
for z,A in next,az.TopBarButtons do
if A.Name==x then
A.Object.Visible=false
end
end
end
end



























return az
end end end

local aa={
Window=nil,
Theme=nil,
Creator=a.load'd',
Motion=a.load'e',
LocalizationModule=a.load'f',
NotificationModule=a.load'g',
Themes=nil,
Transparent=false,

TransparencyValue=0.15,

UIScale=1,

ConfigManager=nil,
Version="0.0.0",

Services=a.load'l',

OnThemeChangeFunction=nil,

cloneref=nil,
UIScaleObj=nil,

CreateWindow=nil,

CurrentInput=nil,
}

aa.IconAdapterVersion=aa.Creator.IconAdapterVersion

local ag=(cloneref or clonereference or function(ag)
return ag
end)

aa.cloneref=ag

local aj=ag(game:GetService"HttpService")
local al=ag(game:GetService"Players")
local am=ag(game:GetService"CoreGui")
local an=ag(game:GetService"RunService")
local ao=ag(game:GetService"UserInputService")

function aa.GenerateGUID()
return aj:GenerateGUID(false)
end

local ap=aa.GenerateGUID()

ao.InputBegan:Connect(function(aq,ar)




task.defer(function()
if
aq.UserInputType==Enum.UserInputType.MouseButton1
or aq.UserInputType==Enum.UserInputType.Touch
then
if aa.CurrentInput and aa.CurrentInput~=ap then
return
end

aa.CurrentInput=ap


end
end)
end)
ao.InputEnded:Connect(function(aq,ar)
if aq.UserInputType==Enum.UserInputType.MouseButton1 or aq.UserInputType==Enum.UserInputType.Touch then
if aa.CurrentInput and aa.CurrentInput~=ap then
return
end

aa.CurrentInput=nil
end
end)

local aq=al.LocalPlayer or nil

local ar=aj:JSONDecode(a.load'm')
if ar then
aa.Version=ar.version
end

local as=a.load'q'
local at=a.load'r'

local au=aa.Creator

local av=au.New




local aw=a.load'v'

local ax=protectgui or(syn and syn.protect_gui)or function()end

local ay=gethui and gethui()or(am or aq:WaitForChild"PlayerGui")

local az=av("UIScale",{
Scale=aa.UIScale,
})

aa.UIScaleObj=az

aa.ScreenGui=av("ScreenGui",{
Name="WindUI",
Parent=ay,
IgnoreGuiInset=true,
ScreenInsets="None",
DisplayOrder=-99999,
},{

av("Folder",{
Name="Window",
}),






av("Folder",{
Name="KeySystem",
}),
av("Folder",{
Name="Popups",
}),
av("Folder",{
Name="ToolTips",
}),
})

aa.NotificationGui=av("ScreenGui",{
Name="WindUI/Notifications",
Parent=ay,
IgnoreGuiInset=true,
ScreenInsets="None",
ResetOnSpawn=false,
DisplayOrder=999999,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
})
aa.DropdownGui=av("ScreenGui",{
Name="WindUI/Dropdowns",
Parent=ay,
IgnoreGuiInset=true,
})
aa.TooltipGui=av("ScreenGui",{
Name="WindUI/Tooltips",
Parent=ay,
IgnoreGuiInset=true,
})
ax(aa.ScreenGui)
ax(aa.NotificationGui)
ax(aa.DropdownGui)
ax(aa.TooltipGui)

au.Init(aa)

function aa.SetParent(aA,aB)
if aa.ScreenGui then
aa.ScreenGui.Parent=aB
end
if aa.NotificationGui then
aa.NotificationGui.Parent=aB
end
if aa.DropdownGui then
aa.DropdownGui.Parent=aB
end
if aa.TooltipGui then
aa.TooltipGui.Parent=aB
end
end
math.clamp(aa.TransparencyValue,0,1)

local aA=aa.NotificationModule.Init(aa.NotificationGui)

function aa.Notify(aB,aC)
aC.Holder=aA.Frame
aC.Window=aa.Window

return aa.NotificationModule.New(aC)
end

function aa.SetNotificationLower(aB,aC)
aA.SetLower(aC)
end

function aa.RegisterIconSource(aB,aC,aD,aE)
return au.RegisterIconSource(aC,aD,aE)
end

function aa.RegisterIconPack(aB,aC,aD)
return au.RegisterIconPack(aC,aD)
end

aa.AddIconSource=aa.RegisterIconSource
aa.AddIcons=aa.RegisterIconPack

function aa.AddIcon(aB,aC,aD,aE)
return au.AddIcon(aC,aD,aE)
end

function aa.AddIconSourceAlias(aB,aC,aD)
return au.AddIconSourceAlias(aC,aD)
end

function aa.SetIconSource(aB,aC)
return au.SetIconSource(aC)
end

function aa.GetIconSources(aB)
return au.GetIconSources()
end

function aa.HasIcon(aB,aC,aD)
return au.HasIcon(aC,aD)
end

function aa.LoadingScreen(aB,aC)
return at.new(aa,aC)
end

function aa.LoadingCreate(aB,aC)
if aa.ActiveLoading and not aa.ActiveLoading.Closed then
aa.ActiveLoading:Close(0)
end

aa.ActiveLoading=at.new(aa,aC)
return aa.ActiveLoading
end

function aa.LoadingSet(aB,aC,aD)
local aE=aa.ActiveLoading
if not aE or aE.Closed then
aE=aa:LoadingCreate{}
end

if typeof(aC)=="table"then
if aC.Status or aC.Text or aC.Title then
aE:SetStatus(aC.Status or aC.Text or aC.Title)
end
if aC.Progress~=nil or aC.Value~=nil then
aE:SetProgress(aC.Progress~=nil and aC.Progress or aC.Value)
end
if aC.Step then
aE:Step(aC.Step,aC.Status or aC.Text)
end
if aC.Close then
aE:Close(aC.Delay or aC.CloseDelay or 0)
end
return aE
end

if typeof(aC)=="number"then
aE:SetProgress(aC)
if aD then
aE:SetStatus(aD)
end
elseif aC~=nil then
aE:SetStatus(aC)
if typeof(aD)=="number"then
aE:SetProgress(aD)
end
end

return aE
end

function aa.SetFont(aB,aC)
au.UpdateFont(aC)
end

function aa.SetMotionPreset(aB,aC)
return aa.Motion:SetPreset(aC)
end

function aa.SetReducedMotion(aB,aC)
return aa.Motion:SetReducedMotion(aC)
end

function aa.OnThemeChange(aB,aC)
aa.OnThemeChangeFunction=aC
end

function aa.AddTheme(aB,aC)
aa.Themes[aC.Name]=aC
return aC
end

function aa.SetTheme(aB,aC)
if aa.Themes[aC]then
aa.Theme=aa.Themes[aC]
au.SetTheme(aa.Themes[aC])

if aa.OnThemeChangeFunction then
aa.OnThemeChangeFunction(aC)
end

return aa.Themes[aC]
end
return nil
end

function aa.GetThemes(aB)
return aa.Themes
end
function aa.GetCurrentTheme(aB)
return aa.Theme.Name
end
function aa.GetTransparency(aB)
return aa.Transparent or false
end
function aa.GetWindowSize(aB)
return aa.Window.UIElements.Main.Size
end
function aa.Localization(aB,aC)
return aa.LocalizationModule:New(aC,au)
end

function aa.SetLanguage(aB,aC)
if au.Localization then
return au.SetLanguage(aC)
end
return false
end

function aa.ToggleAcrylic(aB,aC)
if aa.Window and aa.Window.AcrylicPaint and aa.Window.AcrylicPaint.Model then
aa.Window.Acrylic=aC
aa.Window.AcrylicPaint.Model.Transparency=aC and 0.98 or 1
if aC then
aw.Enable()
else
aw.Disable()
end
end
end

function aa.Gradient(aB,aC,aD)
local aE={}
local aF={}

for aG,aH in next,aC do
local aI=tonumber(aG)
if aI then
aI=math.clamp(aI/100,0,1)

local aJ=aH.Color
if typeof(aJ)=="string"and string.sub(aJ,1,1)=="#"then
aJ=Color3.fromHex(aJ)
end

local aK=aH.Transparency or 0

table.insert(aE,ColorSequenceKeypoint.new(aI,aJ))
table.insert(aF,NumberSequenceKeypoint.new(aI,aK))
end
end

table.sort(aE,function(aG,aH)
return aG.Time<aH.Time
end)
table.sort(aF,function(aG,aH)
return aG.Time<aH.Time
end)

if#aE<2 then
table.insert(aE,ColorSequenceKeypoint.new(1,aE[1].Value))
table.insert(aF,NumberSequenceKeypoint.new(1,aF[1].Value))
end

local aG={
Color=ColorSequence.new(aE),
Transparency=NumberSequence.new(aF),
}

if aD then
for aH,aI in pairs(aD)do
aG[aH]=aI
end
end

return aG
end

function aa.Popup(aB,aC)
aC.WindUI=aa
return a.load'w'.new(aC,aa.ScreenGui.Popups)
end

aa.Themes=a.load'x'(aa,au)

au.Themes=aa.Themes

aa:SetTheme"Dark"
aa:SetLanguage(au.Language)

function aa.CreateWindow(aB,aC)
local aD=a.load'aH'

if not an:IsStudio()and writefile then
if not isfolder"WindUI"then
makefolder"WindUI"
end
if aC.Folder then
makefolder(aC.Folder)
else
makefolder(aC.Title)
end
end

aC.WindUI=aa
aC.Window=aa.Window
aC.Parent=aa.ScreenGui.Window

if aa.Window then
warn"You cannot create more than one window"
return
end

aa.Motion:Configure(aC.Motion)

local aE=true
local aF=aC.LoadingScreen or aC.Loader or aC.Loading
local aG

local function OpenLoader(aH,aI)
if aF==nil or aF==false then
return nil
end

if not aG then
local aJ={}
if typeof(aF)=="table"then
for aK,aL in next,aF do
aJ[aK]=aL
end
end

aJ.Title=aJ.Title or aC.Title or"WindUI"
aJ.Desc=aJ.Desc or"Loading interface"
aJ.Icon=aJ.Icon or aC.Icon or"sparkles"
aJ.Folder=aJ.Folder or aC.Folder
aG=at.new(aa,aJ)
end

if aH then
aG:SetStatus(aH)
end
if aI then
aG:SetProgress(aI)
end

return aG
end

if not aC.KeySystem then
OpenLoader("Preparing interface",0.16)
end

local aH=aC.Theme or"Dark"
local aI
if typeof(aH)=="table"then
aI=aH
elseif typeof(aH)=="string"then
aI=aa.Themes[aH]
end

aI=aI or aa.Theme or aa.Themes.Dark
aa.Theme=aI
au.SetTheme(aI)

local aJ=gethwid or function()
return al.LocalPlayer.UserId
end

local aK=aJ()

local function PickField(aL,aM)
for aN,aO in next,aM do
if aL[aO]~=nil then
return aL[aO]
end
end
return nil
end

local function NormalizeServiceType(aL)
local aM=string.lower(tostring(aL or""))
aM=string.gsub(aM,"%s+","")
aM=string.gsub(aM,"[_%-%./]","")

local aN={
luarmor="luarmor",
platoboost="platoboost",
plato="platoboost",
panda="pandadevelopment",
pandadev="pandadevelopment",
pandadevelopment="pandadevelopment",
junkie="junkiedevelopment",
junkiedev="junkiedevelopment",
junkiedevelopment="junkiedevelopment",
}

return aN[aM]or aM
end

local function NormalizeKeySystemAPI()
if not aC.KeySystem or typeof(aC.KeySystem.API)~="table"then
return
end

local aL=aC.KeySystem.API
local aM=aL
if aL.Type or aL.type or aL.Service or aL.service then
aM={aL}
end

local aN={}
for aO,aP in next,aM do
if typeof(aP)=="table"then
local aQ={}
for aR,aS in next,aP do
aQ[aR]=aS
end

aQ.Type=NormalizeServiceType(PickField(aP,{
"Type",
"type",
"Service",
"service",
"Provider",
"provider",
}))

aQ.ScriptId=PickField(aP,{
"ScriptId",
"ScriptID",
"scriptId",
"scriptID",
"script_id",
"Script",
"script",
"Id",
"ID",
"id",
})or aQ.ScriptId

aQ.ServiceId=PickField(aP,{
"ServiceId",
"ServiceID",
"serviceId",
"serviceID",
"service_id",
"Service",
"service",
"Id",
"ID",
"id",
})or aQ.ServiceId

aQ.Discord=PickField(aP,{
"Discord",
"discord",
"DiscordURL",
"DiscordUrl",
"discordUrl",
"discord_url",
"Invite",
"invite",
"URL",
"Url",
"url",
})or aQ.Discord

aQ.Secret=PickField(aP,{
"Secret",
"secret",
"ApiSecret",
"APISecret",
"apiSecret",
"api_secret",
})or aQ.Secret

aQ.ApiKey=PickField(aP,{
"ApiKey",
"APIKey",
"apiKey",
"api_key",
"Key",
"key",
})or aQ.ApiKey

if aQ.Type and aQ.Type~=""then
table.insert(aN,aQ)
end
end
end

aC.KeySystem.API=aN
end

NormalizeKeySystemAPI()

if aC.KeySystem then
aE=false

local function loadKeysystem()
as.new(aC,aK,function(aL)
aE=aL
end)
end

local aL=(aC.Folder or"Temp").."/"..aK..".key"

if aC.KeySystem.KeyValidator then
if aC.KeySystem.SaveKey and isfile(aL)then
local aM=readfile(aL)
local aN,aO=pcall(aC.KeySystem.KeyValidator,aM)

if aN and aO then
aE=true
else
loadKeysystem()
end
else
loadKeysystem()
end
elseif not aC.KeySystem.API then
if aC.KeySystem.SaveKey and isfile(aL)then
local aM=readfile(aL)
local aN=(type(aC.KeySystem.Key)=="table")and table.find(aC.KeySystem.Key,aM)
or tostring(aC.KeySystem.Key)==tostring(aM)

if aN then
aE=true
else
loadKeysystem()
end
else
loadKeysystem()
end
else
if isfile(aL)then
local aM=readfile(aL)
local aN=false

for aO,aP in next,aC.KeySystem.API do
local aQ=aa.Services[aP.Type]
if aQ then
local aR={}
for aS,aT in next,aQ.Args do
table.insert(aR,aP[aT])
end

local aS,aT=pcall(function()
return aQ.New(table.unpack(aR))
end)
local aU,aV=false,false
if aS and aT and type(aT.Verify)=="function"then
aU,aV=pcall(aT.Verify,aM)
end
if aU and aV then
aN=true
break
end
end
end

aE=aN
if not aN then
loadKeysystem()
end
else
loadKeysystem()
end
end

repeat
task.wait()
until aE

OpenLoader("Access granted",0.42)
end

OpenLoader("Building window",0.72)
local aL=aD(aC)

aa.Transparent=aC.Transparent
aa.Window=aL

if aC.Acrylic then
aw.init()
end

if aG then
aG:SetStatus"Ready"
aG:SetProgress(1)
aG:Close((typeof(aF)=="table"and aF.CloseDelay)or 0.18)
end













return aL
end

return aa