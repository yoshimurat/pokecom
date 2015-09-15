10 CLEAR:RANDOMIZE
20 R=1,S=0,MX=133,MY=40,PX=0,PY=0
30 DIM B$(6):DIM GX(6):DIM GY(6)
40 *LD1
50 FOR I=1 TO 6:READ GX(I):NEXT
60 FOR I=1 to 6:read gy(i):next
70 *INIT
80 cls:f=0,m=0,vx=0,vy=0,a=3
90 if r=1 gosub *r1
100 if r=2 gosub *r2
110 if r=3 gosub *r3
120 if r=4 gosub *r4
130 if r>4 gosub *r5
140 locate 14,5:print s:locate 19,5:print t:locate 22,0:print r
150 gosub *ld2
160 circle (gx(r)*8+9,gy(r)*8+4),3,,,,,5:pset(x,y)
170 *ti
180 if m=1 goto *m1
190 if m=2 goto *m2
200 if px>=0 let px=px+2:if px>40 let px=px-40:px=-px:line(4,43)-(84,43),r
210 if px<0 let px=px-2:if px<-40 let px=px+40:px=-px:line(4,43)-(84,43),r
220 line(44,43)-(44+px,43)
230 if inkey$="1" let vx=px:m=1
240 goto *cmn
250 *m1
260 py=py+2:if py>30 let py=py-30:line(2,2)-(2,42-py)
270 if inkey$="2" let vy=py:m=2:t=t-50
280 goto *cmn
290 *m2
300 vy=vy-g:nx=x+vx*.05:ny=y-vy*.075
310 if point(nx,ny) gosub *chk
320 if not(int(nx)=int(x)) let s=s+1
330 if not(int(ny)=int(y)) let s=s+2
340 line(nx,ny)-(x,y):x=nx:y=ny
350 *cmn
360 t=t-1:locate 14,5:print s:locate 19,5:print t:locate 22,0:print r
370 if t=0 goto *exp else goto *ti
380 *chk
390 if nx>gx(r)*8+5 and nx<gx(r)*8+13 and ny>gy(r)*8 and ny<gy(r)*8+8 goto *land
400 if nx<4 or nx>mx or ny<0 or ny>my goto *exp
410 sx=int((nx-5)/8):sy=int(ny/8):rx=int((x-5)/8):ry=int(y/8)
420 if mid$(b$(sy+1),sx+1,1)="0" return
430 fx=0
440 if rx>sx let nx=2*((sx+1)*8+5)-nx
450 if rx<sx let nx=2+(sx*8+5)-nx
460 if ry>sy let ny=2*8*(sy+1)-ny:vy=-vy:fx=1
470 if ry<sy let ny=sy*8-1:vx=0:vy=:m=0
480 if fx=0 and not(rx=sx) let vx=-vx
490 return
500 *EXP
510 FOR I=0 TO 40:LINE(NX,NY)-(RND(MX),RND(MY)),X:NEXT
520 OUT &H40,&HA7
530 LOCATE 1,4:PRINT "AMAI..":CALL 48381:OUT &H40,&HA6:R=1,S=0:RESTORE:GOTO *LD1
540 *LAND
550 LOCATE 5,4:PRINT " WELL DONE..":CALL 48381:R=R+1,S=S+T,D=0:GOTO *INIT
560 *LD2
570 FOR I=1 TO 5:READ B0:GOSUB *D2BIN
580 FOR J=1 TO 16
590 IF MID$(B$(I),J,1)="1" LINE((J-1)*8+5,(I-1)*8)-(J*8+5,I*8),BF
600 NEXT:NEXT:RETURN
610 *D2BIN
620 B$(I)=""
630 *D2B
640 B1=INT(B0/2):B2=B0-2*B1
650 B$(I)=CHR$(B2+48)+B$(I)
660 IF B1>0 LET B0=B1:GOTO *D2B
670 WHILE LEN(B$(I))<16:B$(I)="0"+B$(I):WEND
680 RETURN
690 *R1
700 G=1,T=999,X=36,Y=MY-9:RETURN
710 *R2
720 G=1,T=999,X=MX-12,Y=MY-9:RETURN
730 *R3
740 G=1,T=999,X=9,Y=MY-9:RETURN
750 *R4
760 G=1,T=999,X=20,Y=MY-9:RETURN
770 *R5
780 G=1,T=1500,X=9,Y=MY-9:RETURN
790 DATA 8,0,13,0,10,10
800 DATA 3,2,2,0,1,1
810 DATA 65535,32769,32769,32785,65535
820 DATA 256,0,0,256,65535
830 DATA 0,128,896,0,65535
840 DATA 0,0,33664,32768,63551
850 DATA 65535,8257,46717,34305,61439
860 DATA 0,0,384,32770,6144



