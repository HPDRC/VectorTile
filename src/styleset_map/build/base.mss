/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
 *
 */

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#land-low[zoom>=0][zoom<10],
#land-high[zoom>=10] {
  polygon-fill: @land;
  polygon-gamma: 0.75;
}

#landuse[zoom>3] {
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest']        { polygon-fill: @wooded; }
  [type='hospital']      { polygon-fill: darken(@building,10%); }
  [type='industrial']    { polygon-fill: @industrial; }
  [type='parking']       { polygon-fill: @parking; }     
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='residential']   { polygon-fill: @residential; }
//  [type='school']        { polygon-fill: darken(@building,5%); }
  [type='wood']          { polygon-fill: @wooded; }
  [type='university']     { 
       [zoom<=14] { polygon-fill: @tf_bg_grey;}   
       [zoom>=15] { polygon-fill: @university;} 
       [zoom>=17] { polygon-fill: #FCFCF9;}//lighten(@tf_bg_beige, 2.9%);  } 
    }
   [type='school']   { 
       [zoom<=16] { polygon-fill: @building_alt;}   
       [zoom>=16] { polygon-fill: @school;} 
    }
}

#landuse::woods-and-stuff[zoom>=12] { 
   [type='wood'], 
   [type='forest'],     { 
    polygon-fill: @wooded; 
    polygon-pattern-file:url(img/wood-pattern_aeb789_20150615.png);}    
  }  
   
// grassy areas    
#landuse::grass-and-stuff[zoom>=12] { 
   [type='park'], 
   [type='cemetery'],
   [type='grass']      { polygon-fill: @grass; line-width:1; line-color:@grass_outline;}
}

#landuse::athletics-and-stuff_sm[zoom>=13][zoom<15] {
  [type='sports_center'],
  [type='golf_course'],  
  [type='stadium'],       
  [type='pitch']       { polygon-fill: @sports; }
}

#landuse::athletics-and-stuff_lg[zoom>=15] {
  [type='sports_center'],
  [type='golf_course'],  
  [type='stadium'],    
  [type='pitch']      { polygon-fill: @sports; line-color:@sports_outline; line-width:0.5; }
}

#landuse[type='nature_reserve'][zoom>6] {
  line-color: darken(@wooded,25%);
  line-opacity:  0.3;
  line-dasharray: 1,1;
  polygon-fill: darken(@wooded,25%);
  polygon-opacity: 0.1;
  [zoom=7] { line-width: 0.4; }
  [zoom=8] { line-width: 0.6; }
  [zoom=9] { line-width: 0.8; }
  [zoom=10] { line-width: 1.0; }
  [zoom=11] { line-width: 1.5; }
  [zoom>=12] { line-width: 2.0; }
}
 
#landuse[type='wetland'][zoom>11][zoom<=12] { 
  polygon-pattern-file:url(img/marsh-pattern_aeb789_20150625.png); 
  polygon-pattern-opacity:0.5;
  polygon-fill: fadeout(@grass,50%); 
  polygon-fill: lighten(@grass,10%); 
}
#landuse[type='wetland'][zoom>=13] {
  polygon-fill: fadeout(@grass,50%); polygon-fill: lighten(@grass,10%); 
  [zoom>11][zoom<=14] { polygon-pattern-file:url(img/marsh-pattern_aeb789_20150625.png); polygon-pattern-opacity:0.5;}
  [zoom>=14] { polygon-pattern-file:url(img/marsh-pattern_aeb789_20150625.png);polygon-pattern-opacity:0.8;}
  }


/* ---- BUILDINGS ---- */
#buildings[zoom>=12][zoom<=16] {
  polygon-fill:@building_alt;
  [zoom>=14] {
    line-color:darken(@building,5%);
    line-width:0.2;
  }
  [zoom>=16] {
    line-color:darken(@building,20%);
    line-width:0.4;
  }
}
// At the highest zoom levels, render buildings in fancy pseudo-3D.
// Ordering polygons by their Y-position is necessary for this effect
// so we use a separate layer that does this for us.
#buildings[zoom>=17][type != 'hedge'] {
  building-fill:@building;
  building-height:1.25;
}

#buildings[zoom>=17][type = 'hedge'] {
  building-fill:@wooded;
  building-height:1.25;
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map { background-color: transparent;  }

//#water_gen0[zoom>3][zoom<=9],
//#water_gen1[zoom>9][zoom<=12],
// #water {
// polygon-fill: @water;   
//  polygon-pattern-file:url(images/water.png);
//  [zoom>12]{ line-width:0.7; line-color:darken(@water,10%);}
// }

#waterarea[zoom>3] {
  polygon-gamma:0.5; // reduces gaps between shapes
  polygon-fill:@water;
  [zoom>=13] {polygon-pattern-file:url(img/Water-pattern_A1C3DE-2015601.png);
             line-color:darken(@water,10%);
  	         line-width:0.8; }
 //  polygon-pattern-comp-op:color-burn; // hide - this causes the pattern to break
//  polygon-pattern-alignment:global; // keeps it seamless
}
/*  this might end up being some sort of glow effect but it needs figuring out
#waterarea::glow1 {
  [zoom>12]{ line-width:8; line-opacity:0.1; line-offset:0; line-color:darken(@water,20%);}
}
#waterarea::glow2 {
 [zoom>12]{ line-width:8; line-opacity:0.08; line-offset:-8;line-color:darken(@water,20%);}
}
#waterarea::glow3 {
  [zoom>12]{ line-width:8; line-opacity:0.06; line-offset:-16; line-color:darken(@water,20%);}
}
#waterarea::glow4 {
  [zoom>12]{ line-width:8; line-opacity:0.04; line-offset:-24; line-color:darken(@water,20%);}
} 
#waterarea::glow5 {
  [zoom>12]{ line-width:8; line-opacity:0.02; line-offset:-30; line-color:darken(@water,20%);}
} 
#waterarea::glow6 {
  [zoom>12]{ line-width:8; line-opacity:0.01; line-offset:-36; line-color:darken(@water,20%);}
} 

*/


/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway[zoom>=8][zoom<=12] {
  line-color: @water;
  [zoom=8] { line-width: 0.1; }
  [zoom=9] { line-width: 0.2; }
  [zoom=10]{ line-width: 0.4; }
  [zoom=11]{ line-width: 0.6; }
  [zoom=12]{ line-width: 0.8; }
}

#waterway[zoom>=13][zoom<=14] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=13]{ line-width: 1; }
    [zoom=14]{ line-width: 1.5; }
  }
  [type='stream'] {
    [zoom=13]{ line-width: 0.2; }
    [zoom=14]{ line-width: 0.4; }
  }
}
  
#waterway[zoom>=15] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=15]{ line-width: 2; }
    [zoom=16]{ line-width: 3; }
    [zoom=17]{ line-width: 4; }
    [zoom=18]{ line-width: 5; }
    [zoom=19]{ line-width: 6; }
    [zoom>19]{ line-width: 7; }
  }
  [type='stream'] {
    [zoom=15]{ line-width: 0.6; }
    [zoom=16]{ line-width: 0.8; }
    [zoom=17]{ line-width: 1; }
    [zoom=18]{ line-width: 1.5; }
    [zoom>18]{ line-width: 2; }
  }
  [type='ditch'],
  [type='drain'] {
    [zoom=15]{ line-width: 0.1; }
    [zoom=16]{ line-width: 0.3; }
    [zoom=17]{ line-width: 0.5; }
    [zoom=18]{ line-width: 0.7; }
    [zoom=19]{ line-width: 1; }
    [zoom>19]{ line-width: 1.5; }
  }
}

/* ================================================================== */
/* BARRIER POINTS
/* ================================================================== */


#barrier_points[zoom>=17][stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

#barrier_lines[zoom>=17][stylegroup = 'gate'] {
  line-width:2.5;
  line-color:#aab;
  line-dasharray:3,2;
}

#barrier_lines[zoom>=17][stylegroup = 'fence'] {
  line-width:1.75;
  line-color:#aab;
  line-dasharray:1,1;
}

#barrier_lines[zoom>=17][stylegroup = 'hedge'] {
  line-width:3;
  line-color:darken(@grass_outline,5%);

}

#admin[admin_level=2][zoom>2][zoom<9] {
  line-width:1;
  line-color:darken(@tf_bg_grey,10%);
  }
