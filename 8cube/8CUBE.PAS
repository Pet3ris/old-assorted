program cube3d;
 uses graph, crt;

const
{ lenkisx = 0;
 lenkisy = 0;
 lenkisz = 5; }
 lenkisx2 = 0;
 lenkisy2 = 0;
 lenkisz2 = -5;
 color = 4;
 color2 = 1;
 vx = -13;
 vy = 15;
 vz = 50;
 a = 100; { Puse no malas }
 a2 = 50;
 KEY_UP = chr(72);
 KEY_DOWN = chr(80);
 KEY_LEFT = chr(75);
 KEY_RIGHT = chr(77);
 KEY_ESC = chr(27);
type
 point = record
 x, y, z: real;
 end;
 prPoint = record
 x, y: integer;
 end;

var
 gd, gm: integer;
 cube: array[1..8] of point;
 cube2: array[1..8] of point;
 button: char;
 prCube: array[1..8] of prPoint;
 prCube2: array[1..8] of prPoint;
 i: word;
 oldx, oldy: real;
 lenkisx, lenkisy, lenkisz: shortint;
begin
 lenkisx := 0;
 lenkisy := 0;
 lenkisz := 0;

 gd := Detect;
 InitGraph(gd, gm, '');

 cube[1].x := -a;
 cube[1].y := -a;
 cube[1].z := a;

 cube[2].x := -a;
 cube[2].y := -a;
 cube[2].z := -a;

 cube[3].x := a;
 cube[3].y := -a;
 cube[3].z := -a;

 cube[4].x := a;
 cube[4].y := -a;
 cube[4].z := a;

 cube[5].x := -a;
 cube[5].y := a;
 cube[5].z := a;

 cube[6].x := -a;
 cube[6].y := a;
 cube[6].z := -a;

 cube[7].x := a;
 cube[7].y := a;
 cube[7].z := -a;

 cube[8].x := a;
 cube[8].y := a;
 cube[8].z := a;

 cube2[1].x := -a2;
 cube2[1].y := -a2;
 cube2[1].z := a2;

 cube2[2].x := -a2;
 cube2[2].y := -a2;
 cube2[2].z := -a2;

 cube2[3].x := a2;
 cube2[3].y := -a2;
 cube2[3].z := -a2;

 cube2[4].x := a2;
 cube2[4].y := -a2;
 cube2[4].z := a2;

 cube2[5].x := -a2;
 cube2[5].y := a2;
 cube2[5].z := a2;

 cube2[6].x := -a2;
 cube2[6].y := a2;
 cube2[6].z := -a2;

 cube2[7].x := a2;
 cube2[7].y := a2;
 cube2[7].z := -a2;

 cube2[8].x := a2;
 cube2[8].y := a2;
 cube2[8].z := a2;


 SetViewPort(getMaxX div 2, getMaxY div 2, getMaxX, getMaxY, clipoff);

 Repeat
  if keypressed then begin
   button := readkey;
   case button of
    KEY_UP: dec(lenkisx);
    KEY_DOWN: inc(lenkisx);
    KEY_LEFT: dec(lenkisz);
    KEY_RIGHT: inc(lenkisz);
    ',': inc(lenkisy);
    '.': dec(lenkisy);
   end;
  end;

  for i := 1 to 8 do begin
   prCube[i].x := round(cube[i].x+(-vx*cube[i].z/vz));
   prCube[i].y := round(cube[i].y+(-vy*cube[i].z/vz));
   PutPixel(prCube[i].x, prCube[i].y, color);

   prCube2[i].x := round(cube2[i].x+(-vx*cube2[i].z/vz));
   prCube2[i].y := round(cube2[i].y+(-vy*cube2[i].z/vz));
   PutPixel(prCube2[i].x, prCube2[i].y, color2);
  end;

  SetColor(color);

  line(prCube[1].x, prCube[1].y, prCube[2].x, prCube[2].y);
  line(prCube[2].x, prCube[2].y, prCube[3].x, prCube[3].y);
  line(prCube[3].x, prCube[3].y, prCube[4].x, prCube[4].y);
  line(prCube[4].x, prCube[4].y, prCube[1].x, prCube[1].y);

  line(prCube[5].x, prCube[5].y, prCube[6].x, prCube[6].y);
  line(prCube[6].x, prCube[6].y, prCube[7].x, prCube[7].y);
  line(prCube[7].x, prCube[7].y, prCube[8].x, prCube[8].y);
  line(prCube[8].x, prCube[8].y, prCube[5].x, prCube[5].y);

  line(prCube[1].x, prCube[1].y, prCube[5].x, prCube[5].y);
  line(prCube[2].x, prCube[2].y, prCube[6].x, prCube[6].y);
  line(prCube[3].x, prCube[3].y, prCube[7].x, prCube[7].y);
  line(prCube[4].x, prCube[4].y, prCube[8].x, prCube[8].y);

  SetColor(color2);

  line(prCube2[1].x, prCube2[1].y, prCube2[2].x, prCube2[2].y);
  line(prCube2[2].x, prCube2[2].y, prCube2[3].x, prCube2[3].y);
  line(prCube2[3].x, prCube2[3].y, prCube2[4].x, prCube2[4].y);
  line(prCube2[4].x, prCube2[4].y, prCube2[1].x, prCube2[1].y);

  line(prCube2[5].x, prCube2[5].y, prCube2[6].x, prCube2[6].y);
  line(prCube2[6].x, prCube2[6].y, prCube2[7].x, prCube2[7].y);
  line(prCube2[7].x, prCube2[7].y, prCube2[8].x, prCube2[8].y);
  line(prCube2[8].x, prCube2[8].y, prCube2[5].x, prCube2[5].y);

  line(prCube2[1].x, prCube2[1].y, prCube2[5].x, prCube2[5].y);
  line(prCube2[2].x, prCube2[2].y, prCube2[6].x, prCube2[6].y);
  line(prCube2[3].x, prCube2[3].y, prCube2[7].x, prCube2[7].y);
  line(prCube2[4].x, prCube2[4].y, prCube2[8].x, prCube2[8].y);

  for i := 1 to 8 do begin
   oldx := cube[i].x*cos(PI*lenkisz/180)-cube[i].y*sin(PI*lenkisz/180);
   cube[i].y := cube[i].x*sin(PI*lenkisz/180)+cube[i].y*cos(PI*lenkisz/180);
   cube[i].x := oldx;

   oldy := cube[i].y*cos(PI*lenkisx/180)-cube[i].z*sin(PI*lenkisx/180);
   cube[i].z := cube[i].y*sin(PI*lenkisx/180)+cube[i].z*cos(PI*lenkisx/180);
   cube[i].y := oldy;

   oldx := cube[i].x*cos(PI*lenkisy/180)+cube[i].z*sin(PI*lenkisy/180);
   cube[i].z := -cube[i].x*sin(PI*lenkisy/180)+cube[i].z*cos(PI*lenkisy/180);
   cube[i].x := oldx;

   oldx := cube2[i].x*cos(PI*lenkisz2/180)-cube2[i].y*sin(PI*lenkisz2/180);
   cube2[i].y := cube2[i].x*sin(PI*lenkisz2/180)+cube2[i].y*cos(PI*lenkisz2/180);
   cube2[i].x := oldx;

   oldy := cube2[i].y*cos(PI*lenkisx2/180)-cube2[i].z*sin(PI*lenkisx2/180);
   cube2[i].z := cube2[i].y*sin(PI*lenkisx2/180)+cube2[i].z*cos(PI*lenkisx2/180);
   cube2[i].y := oldy;

   oldx := cube2[i].x*cos(PI*lenkisy2/180)+cube2[i].z*sin(PI*lenkisy2/180);
   cube2[i].z := -cube2[i].x*sin(PI*lenkisy2/180)+cube2[i].z*cos(PI*lenkisy2/180);
   cube2[i].x := oldx;
  end;
  Delay(50);
  ClearDevice;
 Until(button=KEY_ESC);
 closeGraph;
end.
