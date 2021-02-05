


;从喝药宏改来的，几个前置条件有用没用的都放上了
 
#SingleInstance force
#NoEnv
#Warn
#Persistent
 
;刀雨施法时间，毫秒
BF := 570
;刀爆施法时间，毫秒
BB := 410
;重置延迟。延迟允许范围内内，刀雨-爆刀-刀雨-爆刀 。。。循环不被破坏，可以有限中断一建宏穿插走位；超过延迟限制则从刀雨循环起。默认350。
Delay := 350
 
Time := A_TickCount
 
BBRdy := false
Script := false
HoldRightClick := false

Loop {
	if (Script) {
		if (HoldRightClick) {
			Gosub, BFBB
		}
	}
}
 
F3::
	Script := not Script
	return
 
RButton::
	HoldRightClick := true
	return
 
RButton up::
	HoldRightClick := false
	return

BFBB:
	if (HoldRightClick & (A_TickCount - Time < BF + Delay) & BBRdy) 
	{
		Send, W
		Sleep, %BB%
		BBRdy := false
	}
	if (HoldRightClick) 
	{
		Click, right
		Sleep, %BF%
		Time := A_TickCount
		BBRdy := True
 
	}
	return

f::
Send {2}
Send {3}
Send {4}
Send {5}
Return

F5::Suspend
return
