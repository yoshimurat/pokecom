10 CLEAR:RANDOMIZE
20 R=1,S=0,MX=133,MY=40,PX=0,PY=0
30 DIM B$(6):DIM GX(6):DIM GY(6)
40 *LD1
50 for I=1 to 6:read gx(i):next
60 for I=1 to 6:read gy(i):next
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
500 *exp
510 for i=0 to 40:line(nx,ny)-(rnd(mx),rnd(my)),x:next
520



