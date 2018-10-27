//--------------- default_point -------------------
#gnis2[zoom>=10],
#bg_mhinc[zoom>=12],
#blk_pop[zoom>=12],
#hotels[zoom>=14],
#nv_restrnts[zoom>=14],
#nypages[zoom>=14],
#physicianspecialty[zoom>=14],
#re1n[zoom>=14],
#re2n[zoom>=14],
#rinn[zoom>=14],
#rldn[zoom>=14],
#rntn[zoom>=14],
#santiago_nodes[zoom>=14],
#wtown[zoom>=12]
{  
  shield-face-name: @font;
  shield-fill: rgb(115, 230, 255);
  shield-avoid-edges: true;
  shield-allow-overlap: false;
  shield-text-dx: 0;
  shield-text-dy: 20;
  shield-min-padding: 20;
  shield-min-distance: 20;
  shield-halo-fill: black;
  shield-halo-radius: 1;
  shield-size: 12;
  [zoom>=14] {shield-size: 13;}
  [zoom>=16] {shield-size: 14;}
}
#gnis2[zoom>=10]
{
  shield-name: '[name]';
  shield-file: url('icon/default.png');
  [type = 'park'] {shield-file: url('icon/park.png');}
  [type = 'hospital'] {shield-file: url('icon/hospital.png');}
  [type = 'church'] {shield-file: url('icon/church.png');}
  [type = 'airport'] {shield-file: url('icon/airport.png');}
  [type = 'cemetery'] {shield-file: url('icon/cemetery.png');}
  [type = 'school'] {shield-file: url('icon/school.png');}
  [type = 'helicopter'] {shield-file: url('icon/helicopter.png');}
}
#bg_mhinc[zoom>=12]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/money.png');
}
#blk_pop[zoom>=12]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/population.png');
}
#hotels[zoom>=14]
{
  shield-name: '[name]';
  shield-file: url('icon/hotel0.png');
  [stars='1'],[stars='1.5'] {shield-file: url('icon/hotel1.png');}
  [stars='2'],[stars='2.5'] {shield-file: url('icon/hotel2.png');}
  [stars='3'],[stars='3.5'] {shield-file: url('icon/hotel3.png');}
  [stars='4'],[stars='4.5'] {shield-file: url('icon/hotel4.png');}
  [stars='5'] {shield-file: url('icon/hotel5.png');}
}
#nv_restrnts[zoom>=14]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/restaurant.png');
}
#nypages[zoom>=14]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/sun.png');
}
#physicianspecialty[zoom>=14]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/doctor.png');
}
#re1n[zoom>=14]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/house.png');
}
#re2n[zoom>=14]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/condo.png');
}
#rinn[zoom>=14]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/apartment.png');
}
#rldn[zoom>=14]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/flag.png');
}
#rntn[zoom>=14]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/money.png');
}
#santiago_nodes[zoom>=14]
{
  shield-name: '[ref_id]';
  shield-file: url('icon/circle.png');
}
#wtown[zoom>=12]
{
  shield-name: '[labeltq]';
  shield-file: url('icon/trans.png');
  shield-min-padding: 0;
}
