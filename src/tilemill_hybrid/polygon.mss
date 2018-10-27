//------------------- default_polygon -------------------
#incorp[zoom>=11],
#block[zoom>=10],
#elem[zoom>=10],
#fa_parcel[zoom>=15],
#high[zoom>=10],
#mid[zoom>=10],
#prism[zoom>=10],
#santiago_landmarks[zoom>=10]
{
  line-color: rgb(153,179,204);
  line-cap: round;
  line-width: 0.6;
  [zoom>=13] {line-width: 0.8;}
  [zoom>=15] {line-width: 1.2;}
}

//------------------- background_polygon -------------------
#continent[zoom>=7], #zipcode[zoom>=8]
{
  line-color: rgb(153,179,204);
  line-cap: round;
  line-width: 0.6;
  [zoom>=13] {line-width: 0.8;}
  [zoom>=15] {line-width: 1.2;}
}