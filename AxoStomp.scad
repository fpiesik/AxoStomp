$fs=1;

t=0.5;

Ya=50;
Yb=50;
Y=Ya+Yb;

//Z=32;
frontX=167; //can't be changed
frontZ=30; //can't be changed
frontY=2; //can't be changed
pcbX=160;
pcbY=50;
pcbZu=3.5;
pcbZ=1.5;

//frontSpZ=1;
frontSp=1.5;
X=frontX+frontSp*2;
//Za=frontZ+frontSpZ*2;
Zb=15;
bottomZ=3;
pcb2frontBtm=5;
pcb2bottom=bottomZ+pcbZu;
//bottomZ=pcb2frontBtm+frontSpZ-pcbZu;
scrwDia=3.3;
scrwXsp=3.5;
scrwYsp=10;

nutADia=6.5;
nutBDia=8.2;
scrwBdist=4;
scrwBDia=4.2;
pcb2frontBtm=5;
topZ=2.5;

frameW=(X-pcbX)/2-1;

arcBtnD=30;
arcBtnDist=40;

potDia= 2.5;
potX=9;
potY=45.2;
potTrvl=40;
potZ=1;
potSp=1.5;

dcYpos=16;
dcY=9.5;
dcZ=11.5;

module frontStl() {
translate([(X-frontX)/2,0,-pcb2frontBtm])rotate([-90,0,0])import("./AxoStomp-front.stl", convexity=10);
//import("./front_fixed.stl", convexity=10);
}


module baseStl() {

translate([0,0,-pcb2bottom]){
difference(){
translate([0,-frontY,0])cube([X,frontY,bottomZ]);
translate([(X-frontX)/2,-frontY,pcb2bottom-pcb2frontBtm])cube([frontX,frontY,bottomZ]);}
difference(){
union(){
cube([X,Y,bottomZ+0.0001]);
translate([(X-pcbX)/2+scrwXsp,scrwYsp,0])cylinder(d=scrwDia*2.5, h=pcb2bottom,$fn=12);
translate([X-((X-pcbX)/2+scrwXsp),scrwYsp,0])cylinder(d=scrwDia*2.5, h=pcb2bottom,$fn=12);
translate([(X-pcbX)/2+scrwXsp,pcbY-scrwYsp,0])cylinder(d=scrwDia*2.5, h=pcb2bottom,$fn=12);
translate([X-((X-pcbX)/2+scrwXsp),pcbY-scrwYsp,0])cylinder(d=scrwDia*2.5, h=pcb2bottom,$fn=12);


translate([X-((X-pcbX)/2+scrwXsp+50.5),scrwYsp,0])cylinder(d=scrwDia*3, h=pcb2bottom,$fn=12);
translate([(X-pcbX)/2+scrwXsp+40.5,pcbY-scrwYsp,0])cylinder(d=scrwDia*3, h=pcb2bottom,$fn=12);
translate([X-((X-pcbX)/2+scrwXsp+50.5),pcbY-scrwYsp,0])cylinder(d=scrwDia*3, h=pcb2bottom,$fn=12);
}
translate([(X-pcbX)/2+scrwXsp,scrwYsp,0])cylinder(d=scrwDia, h=pcb2bottom,$fn=12);
translate([X-((X-pcbX)/2+scrwXsp),scrwYsp,0])cylinder(d=scrwDia, h=pcb2bottom,$fn=12);
translate([(X-pcbX)/2+scrwXsp,pcbY-scrwYsp,0])cylinder(d=scrwDia, h=pcb2bottom,$fn=12);
translate([X-((X-pcbX)/2+scrwXsp),pcbY-scrwYsp,0])cylinder(d=scrwDia, h=pcb2bottom,$fn=12);


translate([X-((X-pcbX)/2+scrwXsp+50.5),scrwYsp,0])cylinder(d=scrwDia, h=pcb2bottom,$fn=12);
translate([(X-pcbX)/2+scrwXsp+40.5,pcbY-scrwYsp,0])cylinder(d=scrwDia, h=pcb2bottom,$fn=12);
translate([X-((X-pcbX)/2+scrwXsp+50.5),pcbY-scrwYsp,0])cylinder(d=scrwDia, h=pcb2bottom,$fn=12);

//translate([0,0,20])cube([frontX,frontY,10]);
}
}}




module topA(subtract,print){
y=Ya;
ySp=frameW*4;
zPos=frontZ-pcb2frontBtm-frontSp;
potSpZ=2.5;


rotate([print*180,0,0]){
if(subtract==0 && print < 2){
difference(){
union(){
translate([0,0,zPos])cube([X,y,topZ]);
translate([X/2,(y-potY)/4,zPos-potZ/2])cube([X-frameW*2,(y-potY)/2,potZ],center=true);
translate([frameW/2+(X/2-frameW)/2,y-(y-potY)/4,zPos-potZ/2])cube([X/2-frameW*2,(y-potY)/2,potZ],center=true);
translate([(frameW/2+(X/2-frameW)/2)+X/2,y-(y-potY)/4,zPos-potZ/2])cube([X/2-frameW*2,(y-potY)/2,potZ],center=true);
       }


for (a = [ 0 : 1: 7 ]){
        translate([ySp+(X-ySp*2)/7*a,y/2,zPos+topZ/2])cube([potDia,potTrvl,topZ], center=true);
        translate([ySp+(X-ySp*2)/7*a,y/2,zPos-potZ/2+1])cube([potX,potY,potZ],center=true);}

for (a = [ 0 : 1: 6 ]){
       translate([ySp+(X-ySp*2)/7*a+(X-ySp*2)/14,y*1/2,zPos+topZ/2])cylinder(d=scrwDia, h=topZ, center=true);

  
}
}

for (a = [ 0 : 1: 7 ])
        difference(){
        translate([ySp+(X-ySp*2)/7*a,y/2,zPos-potZ/2])cube([potX+potSp*2,y,potZ],center=true);
        translate([ySp+(X-ySp*2)/7*a,y/2,zPos-potZ/2])cube([potX,potY,potZ],center=true);}


difference(){
translate([0,-frontY,zPos])cube([X,frontY,topZ]);
translate([(X-frontX)/2,-frontY,zPos-topZ+frontSp])cube([frontX,frontY,topZ]);}
}

if(print==2 && subtract == 0){
difference(){

translate([(ySp-potX/2)+((X-ySp*2)+potX)/2,y*1/2,0])cube([(X-ySp*2)+potX,9,potSpZ],center=true);

for (a = [ 0 : 1: 6 ]){
    translate([ySp+(X-ySp*2)/7*a+(X-ySp*2)/14,y*1/2,0*(zPos+potSpZ/2)])cylinder(d=scrwDia, h=potSpZ, center=true);
    translate([ySp+(X-ySp*2)/7*a+(X-ySp*2)/14,y*1/2,0*(zPos+potSpZ/2)+potSpZ/2])cylinder(d=nutADia, h=potSpZ, center=true,$fn=6);


}}
}


if (print <= 1)translate([0,0,zPos])topMount(y,subtract);


}
}

module topB(subtract,print){
zPos=frontZ-pcb2frontBtm-frontSp;

a=Y-Ya;
b=frontZ-(pcb2frontBtm-pcbZu)-frontSp-(Zb-bottomZ);
//b=frontZ-(bottomZ-frontSpZ)-frontSpZ-Zb+bottomZ;
c=sqrt(pow(a,2)+pow(b,2));
y=c;
echo (c);
w= acos(a/c)*((print-1)*-1)-(print)*180;
echo (w); 

translate([0,Ya,zPos])rotate([-w,0,0]){
if(subtract==0){
difference(){
cube([X,c,topZ]);
translate([(X-3*arcBtnDist-arcBtnD)/2,0,0]){
translate([arcBtnD/2,c/2,0])cylinder(d=arcBtnD,h=topZ);
translate([arcBtnD/2+arcBtnDist,c/2,0])cylinder(d=arcBtnD,h=topZ);
translate([arcBtnD/2+2*arcBtnDist,c/2,0])cylinder(d=arcBtnD,h=topZ);
translate([arcBtnD/2+3*arcBtnDist,c/2,0])cylinder(d=arcBtnD,h=topZ);}

translate([X/2,c*3/4,0])cylinder(d=scrwDia,h=topZ);
translate([X/2,c*1/4,0])cylinder(d=scrwDia,h=topZ);
}
}
if(subtract==1){
translate([X/2,c*3/4,-Zb])cylinder(d=scrwDia-t,h=Zb);
translate([X/2,c*1/4,-Zb])cylinder(d=scrwDia-t,h=Zb);
translate([X/2,c*1/2,0])rotate([0,90,0])cylinder(d=8,h=frameW*2+t,center=true);
}

topMount(y,subtract);



}
}
module topMount(y,subtract){
translate([0,0,0]){
if(subtract==0){
difference(){
hull(){
translate([frameW,y/4,-2])cube([frameW,y/2,2]);
translate([frameW,y/2,-scrwBdist])rotate([0,90,0])cylinder(d=scrwBDia*3,h=frameW);}
translate([frameW,y/2,-scrwBdist])rotate([0,90,0])cylinder(d=scrwBDia,h=frameW);
translate([frameW+frameW/2,y/2,-scrwBdist])rotate([30,0,0])rotate([0,90,0])cylinder(d=nutBDia,h=frameW,$fn=6);
}}
if(subtract==1)translate([-frameW*2,y/2,-scrwBdist])rotate([0,90,0])cylinder(d=scrwBDia,h=frameW*4);

translate([X-frameW*3,0,0]){
if(subtract==0){
difference(){
hull(){
translate([frameW,y/4,-2])cube([frameW,y/2,2]);
translate([frameW,y/2,-scrwBdist])rotate([0,90,0])cylinder(d=scrwBDia*3,h=frameW);}
translate([frameW,y/2,-scrwBdist])rotate([0,90,0])cylinder(d=scrwBDia,h=frameW);
translate([frameW-frameW/2,y/2,-scrwBdist])rotate([30,0,0])rotate([0,90,0])cylinder(d=nutBDia,h=frameW,$fn=6);
}}
if(subtract==1)translate([frameW,y/2,-scrwBdist])rotate([0,90,0])cylinder(d=scrwBDia,h=frameW*4);
}
}
}
module winkel(){
height=Y;
width=frameW;
length=frontZ-(pcb2frontBtm-pcbZu)-frontSp;

thickH=5;
thickW=5;
thickL=5;

screwDia=5.3;
screwDist=25;
screwPosL=15;
screwPosW=(width-thickW)/2;

wallkneeA=Ya;
wallkneeB=Zb-bottomZ;
difference(){
union(){
translate([width,0,-pcbZu])rotate([0,-90,0]){
difference(){
rotate([0,0,0])linear_extrude(height=width, convexity= 100)
    polygon(points = [ [0,0],[length,0],[length,wallkneeA],[wallkneeB,height],[0,height] ], convexity = 1);
}
translate([0,-frontY,width-frontSp])cube([length,frontY,frontSp]);

translate([0,0,-(X-width)]){
difference(){
rotate([0,0,0])linear_extrude(height=width, convexity= 100)
    polygon(points = [ [0,0],[length,0],[length,wallkneeA],[wallkneeB,height],[0,height] ], convexity = 1);
translate([pcbZu+pcbZ,dcYpos,0])cube([dcZ,dcY,frameW]);
}
translate([0,-frontY,0])cube([length,frontY,frontSp]);
}
translate([0,0,-(X)/2]){

difference(){
rotate([0,0,0])linear_extrude(height=width*2, convexity= 100)
    polygon(points = [ [0,0],[length,0],[length,wallkneeA],[wallkneeB,height],[0,height] ], convexity = 1);

difference(){
difference(){
cube([length,Ya,width*2]);
translate([20,Ya,+width/4])rotate([0,0,-40])cube([length,Ya/3,width*1.5]);
}}

//translate([length-10,Ya-5,frameW])rotate([0,90,0])cylinder(d=scrwDia-t,h=10);
}
}

}
translate([0,Y-width,-pcbZu])cube([X,width,Zb-bottomZ]);
}
topA(1,0);
topB(1,0);
}
}


baseStl();
rotate([0,0,0])color([1,0,0])frontStl();
winkel();
color([0,1,0])topA(0,0);
color([0,1,0])topB(0,0);



