//------------------- default_line2 -------------------
#santiago_deleted_segments[zoom>=12],
#santiago_segments[zoom>=12]
{
  line-color: blue;
  line-cap: round;
  line-opacity: 0.5;
  line-width: 0.8;
  [zoom=13] {line-width: 1;}
  [zoom=14] {line-width: 1.2;}
  [zoom=15] {line-width: 1.5;}
  [zoom>=16] {line-width: 2;}
}

//------------------- nv roads ----------------------
#nv_highway[zoom>=7]
{
  line-color: rgb(242,191,36);
  line-cap: round;
  line-opacity: 0.5;
  line-width: 1;
  [zoom>=9] {line-width: 2;}
  [zoom>=11] {line-width: 3;}
  [zoom>=13] {line-width: 4;}
  [zoom>=15] {line-width: 5;}
}

#nv_main_road[zoom>=11]
{
  line-color: rgb(255,250,115);
  line-cap: round;
  line-opacity: 0.5;
  line-width: 2;
  [zoom=13] {line-width: 2.3;}
  [zoom=14] {line-width: 2.6;}
  [zoom>=15] {line-width: 3;}
}

#nv_detail_road[zoom>=14]
{
  line-color: white;
  line-cap: round;
  line-opacity: 0.5;
  line-width: 1;
  [zoom>=15] {line-width: 1.5;}
  [zoom>=16] {line-width: 2;}
}