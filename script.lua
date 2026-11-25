if makefolder and isfolder and not isfolder("MorphOrb") then makefolder("MorphOrb") end
local path="MorphOrb/gul.mp3"
if writefile and isfile and not isfile(path) then pcall(function() writefile(path, game:HttpGet("https://githubusercontent.com")) end) end
local snd=(isfile and isfile(path) and getcustomasset) and getcustomasset(path) or ""
game:GetService("StarterGui"):SetCoreGuiEnabled("Backpack",true)
local P,R,T=game:GetService("Players"),game:GetService("RunService"),game:GetService("TweenService")
local plr,cam=P.LocalPlayer,workspace.CurrentCamera
local bp,pg=plr:WaitForChild("Backpack"),plr:WaitForChild("PlayerGui")
for _,v in ipairs({bp:FindFirstChild("MorphOrb"),plr.Character and plr.Character:FindFirstChild("MorphOrb"),pg:FindFirstChild("OrbGui"),workspace:FindFirstChild("InfVis"),workspace:FindFirstChild("OrbCarBall")}) do if v then v:Destroy() end end
if _G.OrbData and _G.OrbData.tool then _G.OrbData.tool:Destroy() end

if makefolder and isfolder and not isfolder("MorphOrb") then makefolder("MorphOrb") end
local path="MorphOrb/gul.mp3"
local snd=(isfile and isfile(path) and getcustomasset) and getcustomasset(path) or ""

local c0=Color3.fromRGB(0,220,255)
local function mk(c,pr,pa) local o=Instance.new(c) for k,v in pairs(pr) do o[k]=v end o.Parent=pa return o end
local tool=mk("Tool",{Name="???",CanBeDropped=false,Grip=CFrame.new(0,-.6,0)},bp)
local hdl=mk("Part",{Name="Handle",Size=Vector3.new(.5,.5,.5),Transparency=1,CanCollide=false,Massless=true},tool)
local vis=mk("Model",{Name="InfVis"},nil)
local arm=mk("Part",{Size=Vector3.new(.65,1.8,.65),Color=Color3.fromRGB(235,190,155),Material="SmoothPlastic",Anchored=true,CanCollide=false,CastShadow=false},vis)
local lArm=mk("Part",{Size=Vector3.new(.62,1.8,.62),Color=arm.Color,Material="SmoothPlastic",Anchored=true,CanCollide=false,CastShadow=false,Transparency=1},vis)
local tip=mk("Part",{Size=Vector3.new(.1,.1,.1),Transparency=1,Anchored=true,CanCollide=false},vis)
local lgt=mk("PointLight",{Color=c0,Brightness=4,Range=20,Shadows=true},tip)
local spot=mk("SpotLight",{Color=c0,Brightness=22,Range=60,Angle=65,Face="Front",Shadows=true,Enabled=false},tip)
local gui=mk("ScreenGui",{Name="OrbGui",ResetOnSpawn=false},pg)
local sT=mk("Sound",{SoundId="",Volume=0},gui)
local sP=mk("Sound",{SoundId="",Volume=0},gui)
local trl=mk("Trail",{Attachment0=mk("Attachment",{Position=Vector3.new(0,.22,0)},tip),Attachment1=mk("Attachment",{Position=Vector3.new(0,.66,0)},tip),Color=ColorSequence.new(c0),Lifetime=.35,MinLength=.05,LightEmission=1,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,.25),NumberSequenceKeypoint.new(1,1)}),Enabled=false},tip)
local mTps={Enum.MeshType.Sphere,Enum.MeshType.Brick,Enum.MeshType.Cylinder,Enum.MeshType.Wedge}
local mScl={Vector3.new(1,1,1),Vector3.new(.85,.85,.85),Vector3.new(.85,.85,.85),Vector3.new(.85,1.05,.85)}
local bds,msh={},{}
for i=1,4 do
	local p=mk("Part",{Size=Vector3.new(.72,.72,.72),Material="Neon",Color=c0,Anchored=true,CanCollide=false,CastShadow=false,Transparency=i==1 and 0 or 1},vis)
	table.insert(msh,mk("SpecialMesh",{MeshType=mTps[i],Scale=mScl[i]},p)); table.insert(bds,p)
end
local car=mk("Part",{Name="OrbCarBall",Shape="Ball",Size=Vector3.new(1.4,1.4,1.4),Material="Neon",Color=c0,Transparency=0,CanCollide=true,Anchored=true,CustomPhysicalProperties=PhysicalProperties.new(.6,.9,0,1,1)},nil)
local sHum=mk("Sound",{SoundId=snd,Volume=2.991,Pitch=.85,Looped=true,RollOffMaxDistance=120},car)
local carLgt=mk("PointLight",{Color=c0,Brightness=3,Range=16,Shadows=true},car)
local spk=mk("ParticleEmitter",{Color=ColorSequence.new(c0),Size=NumberSequence.new({NumberSequenceKeypoint.new(0,.15),NumberSequenceKeypoint.new(1,0)}),Lifetime=NumberRange.new(.25,.55),Rate=22,Speed=NumberRange.new(1.5,3.5),SpreadAngle=Vector2.new(180,180)},mk("Attachment",{Position=Vector3.new(0,.44,0)},tip))
local pSpk=mk("Sparkles",{SparkleColor=c0,Enabled=false},tip)
local function btn(y,tx) local b=mk("TextButton",{Size=UDim2.new(0,52,0,52),Position=UDim2.new(.84,0,y,0),BackgroundColor3=Color3.fromRGB(30,30,38),BackgroundTransparency=.15,Text=tx,TextColor3=Color3.new(1,1,1),TextSize=23,Font="GothamBold",Visible=false},gui) mk("UICorner",{CornerRadius=UDim.new(1,0)},b) return b end
local D={tool=tool,hdl=hdl,vis=vis,arm=arm,lArm=lArm,tip=tip,lgt=lgt,spot=spot,gui=gui,sT=sT,sP=sP,sHum=sHum,trl=trl,bds=bds,msh=msh,mScl=mScl,spk=spk,pSpk=pSpk,car=car,carLgt=carLgt,bToss=btn(.18,"⬆"),bPet=btn(.30,"🖐"),bRel=btn(.42,"🕊"),bFl=btn(.54,"🔦"),bCar=btn(.66,"🏎")}
_G.OrbData=D

local cols={Color3.fromRGB(0,220,255),Color3.fromRGB(255,50,50),Color3.fromRGB(50,255,100),Color3.fromRGB(180,60,255),Color3.fromRGB(255,220,40),Color3.fromRGB(255,255,255)}
local idx,hT=1,0
local chars="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%&*?!"
local savedCF,retPos,retA,petP=nil,nil,0,nil
local eq,rel,fl,carM,fp,rgb,spin,bob,toss,petT,eqA,flA,ft,mT,hue,nmT=false,false,false,false,false,false,0,0,0,0,0,0,0,0,0,0

local function setC(c,ins)
	D.lgt.Color,D.spot.Color,D.spk.Color,D.pSpk.SparkleColor,D.trl.Color,D.carLgt.Color=c,c,ColorSequence.new(c),c,ColorSequence.new(c),c
	D.car.Color=ins and c or Color3.new(1,1,1); if not ins then T:Create(D.car,TweenInfo.new(.3),{Color=c}):Play() end
	for _,b in ipairs(D.bds) do b.Color=ins and c or Color3.new(1,1,1); if not ins then T:Create(b,TweenInfo.new(.3),{Color=c}):Play() end end
end
local function chg()
	rgb=false; D.bToss.Text,D.bToss.BackgroundColor3="⬆",Color3.fromRGB(30,30,38); idx=(idx%#cols)+1
	setC(cols[idx],false); D.lgt.Brightness,D.lgt.Range=40,42; T:Create(D.lgt,TweenInfo.new(.55,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Brightness=4,Range=20}):Play()
	D.spk:Emit(20); toss=1
end
local function toggleCar(st)
	carM=st; local ch=plr.Character; local hrp,hum=ch and ch:FindFirstChild("HumanoidRootPart"),ch and ch:FindFirstChildOfClass("Humanoid")
	D.bCar.BackgroundColor3=carM and Color3.fromRGB(40,180,100) or Color3.fromRGB(30,30,38)
	if carM and hrp then
		retA=0; savedCF=hrp.CFrame; hrp.Anchored=true
		local f=Vector3.new(cam.CFrame.LookVector.X,0,cam.CFrame.LookVector.Z)
		local dir=f.Magnitude>.05 and f.Unit or Vector3.new(hrp.CFrame.LookVector.X,0,hrp.CFrame.LookVector.Z).Unit
		D.car.CFrame=CFrame.new(hrp.Position+dir*2.5-Vector3.new(0,1.8,0)); D.car.AssemblyLinearVelocity,D.car.AssemblyAngularVelocity=Vector3.zero,Vector3.zero; D.car.Anchored=false; D.car.Parent=workspace
		cam.CameraSubject=D.car; if D.sHum then D.sHum:Play() end
	else
		if D.car.Parent then retPos=D.car.Position; retA=1; petP=retPos end
		if D.sHum then D.sHum:Stop() end; D.car.Parent=nil; D.car.Anchored=true
		if hrp then hrp.Anchored=false; if savedCF then hrp.CFrame=savedCF end; hrp.AssemblyLinearVelocity=Vector3.zero end
		if hum then cam.CameraSubject=hum end
	end
end
D.bCar.MouseButton1Click:Connect(function() if eq or rel or carM then toggleCar(not carM) end end)
D.bToss.MouseButton1Down:Connect(function() if carM or rel or (eq and fp) then hT=tick() end end)
D.bToss.MouseButton1Up:Connect(function()
	if hT==0 then return end; local d=tick()-hT; hT=0; if not (carM or rel or (eq and fp)) then return end
	if d>=.45 then rgb=not rgb; D.bToss.Text=rgb and "🌈" or "⬆"; D.bToss.BackgroundColor3=rgb and Color3.fromRGB(130,60,210) or Color3.fromRGB(30,30,38) else chg() end
end)
D.tool.Activated:Connect(function() if not carM and not rel and eq and fp then chg() end end)
D.bPet.MouseButton1Click:Connect(function() if not carM and not rel and not fl and eq and fp then petT=1; task.delay(.6,function() if petT>0 then D.spk:Emit(18); D.lgt.Brightness=14; T:Create(D.lgt,TweenInfo.new(.5),{Brightness=4}):Play() end end) end end)
D.bRel.MouseButton1Click:Connect(function() if carM then toggleCar(false) end; rel=not rel; D.bRel.Text=rel and "🧲" or "🕊"; D.bRel.BackgroundColor3=rel and Color3.fromRGB(45,110,180) or Color3.fromRGB(30,30,38); petP=rel and D.tip.Position or nil; if not rel then eqA=0 else petT=0 end end)
D.bFl.MouseButton1Click:Connect(function() fl=not fl; D.spot.Enabled=fl; D.bFl.BackgroundColor3=fl and Color3.fromRGB(210,165,35) or Color3.fromRGB(30,30,38); if fl then petT=0 end end)
D.tool.Equipped:Connect(function() eq,eqA=true,0; local bc=plr.Character and plr.Character:FindFirstChildOfClass("BodyColors") if bc then D.arm.Color,D.lArm.Color=bc.RightArmColor3,bc.LeftArmColor3 end end)
D.tool.Unequipped:Connect(function() eq=false end)

local function draw(cf)
	D.tip.CFrame=cf; local s1=math.floor(mT)%4+1; local s2=s1%4+1; local f=mT-math.floor(mT); local a=math.clamp((f-.45)/.55,0,1); a=a*a*(3-2*a)
	for i=1,4 do
		local b,m=D.bds[i],D.msh[i]; b.CFrame=cf*CFrame.new(0,.44,0)
		if fl then b.Transparency=(i==2) and 0 or 1; if i==2 then m.Scale=Vector3.new(.85,.85,.85) end
		elseif i==s1 then local sc=1-a; b.Transparency=sc<.02 and 1 or 0; m.Scale=D.mScl[i]*sc
		elseif i==s2 then b.Transparency=a<.02 and 1 or 0; m.Scale=D.mScl[i]*a
		else b.Transparency=1 end
	end
end

local cn; cn=R.RenderStepped:Connect(function(dt)
	if not pg.Parent or not D.gui.Parent then cn:Disconnect() return end
	nmT=nmT+dt; if nmT>=.07 then nmT=0; local s="" for k=1,7 do local r=math.random(1,#chars); s=s..chars:sub(r,r) end D.tool.Name=s end
	local ch=plr.Character; local hd,hrp,hum=ch and ch:FindFirstChild("Head"),ch and ch:FindFirstChild("HumanoidRootPart"),ch and ch:FindFirstChildOfClass("Humanoid")
	if not eq and not rel and not carM then D.vis.Parent,D.bToss.Visible,D.bPet.Visible,D.bRel.Visible,D.bFl.Visible,D.bCar.Visible,D.lArm.Transparency,D.pSpk.Enabled,D.spot.Enabled,D.trl.Enabled=nil,false,false,false,false,false,1,false,false,false return end
	if rgb then hue=(hue+dt*.22)%1; setC(Color3.fromHSV(hue,.85,1),true) end
	if carM then
		D.vis.Parent,D.bToss.Visible,D.bPet.Visible,D.bRel.Visible,D.bFl.Visible,D.bCar.Visible=nil,true,false,false,false,true
		if hrp and hum and D.car.Parent then
			if savedCF then hrp.CFrame=savedCF; hrp.AssemblyLinearVelocity=Vector3.zero end
			local md=hum.MoveDirection; local v=D.car.AssemblyLinearVelocity; local maxSpd=36
			local targetVel=md.Magnitude>.05 and (md.Unit*maxSpd) or Vector3.zero
			local accel=md.Magnitude>.05 and 7 or 4.5
			local curHoriz=Vector3.new(v.X,0,v.Z):Lerp(targetVel,math.clamp(dt*accel,0,1))
			D.car.AssemblyLinearVelocity=Vector3.new(curHoriz.X,v.Y,curHoriz.Z)
			D.car.AssemblyAngularVelocity=Vector3.new(curHoriz.Z*1.4,0,-curHoriz.X*1.4)
			if D.sHum then D.sHum.Pitch=.75+(curHoriz.Magnitude/maxSpd)*.65 end
			if hum.Jump and math.abs(v.Y)<1.5 then D.car.AssemblyLinearVelocity=Vector3.new(curHoriz.X,40,curHoriz.Z) end
		else toggleCar(false) end
		return
	end
	if retA>0 then retA=math.max(0,retA-dt*1.35) end
	D.vis.Parent,D.bRel.Visible,D.bFl.Visible,D.bCar.Visible=workspace,true,true,true; D.spot.Enabled=fl
	local spd=hrp and Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z).Magnitude or 0
	D.trl.Enabled=(spd>9 or toss>0 or rel or retA>0)
	ft=ft+dt*2.5; toss=math.max(0,toss-dt*1.25); flA=math.clamp(flA+(fl and dt*4 or -dt*4),0,1); if not fl then mT=(mT+dt*.28)%4 end
	if rel then
		D.arm.Transparency,D.lArm.Transparency,D.spk.Enabled,D.pSpk.Enabled,D.bToss.Visible,D.bPet.Visible,petT=1,1,true,false,true,false,0; spin=spin+dt*(3.5+spd*.25+toss*14)
		if hrp then
			local tp=(hrp.CFrame*CFrame.new(Vector3.new(1.8+math.cos(ft*.7)*.15,1.3+math.sin(ft)*.25,1.4):Lerp(Vector3.new(1.55,2.45,1.6),flA)+Vector3.new(0,math.sin(toss*math.pi)*1.2,0))).Position
			petP=(petP or tp):Lerp(tp,math.clamp(dt*6.5,0,1)); draw(CFrame.new(petP)*(fl and (cam.CFrame-cam.CFrame.Position) or CFrame.Angles(math.sin(ft*.8)*.1+(1-toss)*math.pi*2*(toss>0 and 1 or 0),spin,math.cos(ft*.8)*.08)))
		end return
	end
	if petT>0 then petT=math.max(0,petT-dt*.75) end; D.pSpk.Enabled=(petT>0 and petT<.55)
	local wig,pull=math.sin(petT*math.pi*4)*math.sin(petT*math.pi)*.22,math.sin(petT*math.pi)
	fp=hd~=nil and (cam.CFrame.Position-hd.Position).Magnitude<2.5
	if fp then
		D.arm.Transparency,D.spk.Enabled,D.bToss.Visible,D.bPet.Visible=0,true,true,not fl; local mv=spd>1.5
		bob=bob+dt*(mv and math.clamp(spd*.65,6,13) or 2.2); eqA=math.min(1,eqA+dt*5); spin=spin+dt*(5+spd*.3+toss*14+retA*12)
		local jk=math.sin(math.clamp((toss-.72)/.28,0,1)*math.pi)*.22
		local hx,hy,hz=1.05+math.cos(bob*.5)*(mv and .08 or .015)-pull*.65,-.45+math.abs(math.sin(bob))*(mv and .09 or .02)+(1-eqA)*-1.4+jk-pull*.08+flA*.55,-2.15+pull*.05
		D.arm.CFrame=cam.CFrame*CFrame.new(hx+.15-pull*.1,hy-.9,hz+.35)*CFrame.Angles(math.rad(-25+jk*40),math.rad(-10+pull*12),math.rad(12-pull*10))
		D.lArm.Transparency=pull>.02 and 0 or 1
		if pull>.02 then local st=math.sin(petT*math.pi*4)*.3; D.lArm.CFrame=cam.CFrame*CFrame.new(-1.05+pull*1.0,-.95+pull*1.2+st*.18,-2.1+st*.38)*CFrame.Angles(math.rad(-52+st*45),math.rad(18),math.rad(-36)) end
		local ia=toss>0 and 1 or 0; local wb=(1-ia)*.08*(1-flA); local ps=CFrame.new(0,.44*ia,0)
		local handPos=(cam.CFrame*CFrame.new(hx,hy,hz)).Position+Vector3.new(0,math.sin(toss*math.pi)*1.45,0)
		if retA>0 and retPos then local t=1-retA; t=t*t*(3-2*t); handPos=retPos:Lerp(handPos,t)+Vector3.new(0,math.sin(retA*math.pi)*1.6,0) end
		draw(CFrame.new(handPos)*ps*(cam.CFrame-cam.CFrame.Position)*CFrame.Angles(math.sin(spin*.5)*wb+(1-toss)*math.pi*2*ia,spin,math.cos(spin*.5)*wb+wig)*ps:Inverse())
	else
		D.arm.Transparency,D.lArm.Transparency,D.spk.Enabled,D.pSpk.Enabled,D.bToss.Visible,D.bPet.Visible,toss,petT=1,1,false,false,false,false,0,0; D.trl.Enabled=retA>0; spin=spin+dt*(3+spd*.2+retA*12)
		local rh,ra,fwd=ch and ch:FindFirstChild("RightHand"),ch and ch:FindFirstChild("Right Arm"),hrp and hrp.CFrame.LookVector or Vector3.new(0,0,-1)
		local wp=rh and ((rh.CFrame*CFrame.new(0,-.15,-.25)).Position+fwd*.25+Vector3.new(0,.25+math.sin(ft)*.16+flA*.75,0)) or (ra and ((ra.CFrame*CFrame.new(0,-1.05,0)).Position+fwd*.2+Vector3.new(0,.25+math.sin(ft)*.16+flA*.75,0)) or D.hdl.Position)
		if retA>0 and retPos then local t=1-retA; t=t*t*(3-2*t); wp=retPos:Lerp(wp,t)+Vector3.new(0,math.sin(retA*math.pi)*1.6,0) end
		draw(CFrame.new(wp)*(fl and (hrp and (hrp.CFrame-hrp.CFrame.Position) or CFrame.new()) or CFrame.Angles(0,spin,0)))
	end
end)
