/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */

/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

#place::country[type='country'][zoom>3][zoom<9] {
  text-name:'[name]';
  text-face-name:@sans_lt;
  text-placement:point;
  text-fill:@blue_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  text-wrap-before:true;
  [zoom=3] {
    text-size:10;// + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=4] {
    text-size:12;// + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>4] {
    text-halo-radius: 2;
  }
  [zoom>=5] {
    text-size:10.5;//12 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
    text-character-spacing:1;
    text-transform:uppercase;
    text-face-name:@sans_bold;
  }
  [zoom=6] {
    text-size:12; //+ @text_adjust;
    text-character-spacing: 2;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=7] {
    text-size:14;// + @text_adjust;
    text-character-spacing: 2;
    text-wrap-width: 120;
  }
    [zoom=8] {
    text-size:13;// + @text_adjust;
    text-character-spacing:3;
    text-transform:uppercase;
    text-fill:@country_text;
    text-face-name:@sans_bold;
  }
}

#place::state[type='state'][zoom>=5][zoom<=10] {
  text-name:'[name]';
  text-face-name:@sans_lt;
  text-placement:point;
  text-fill:@state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: 2;
  [zoom=5] {
    text-size:10;
    text-wrap-width: 40;
    text-fill:@state_text;
  }
  [zoom=6] {
    text-size:11;//13 + @text_adjust;
    text-wrap-width: 40;
    text-character-spacing:0.5;
  }
  [zoom=7] {
    text-size:12;//13 + @text_adjust;
    text-wrap-width: 50;
    text-fill:@state_text;
    text-character-spacing:0.5;
  }
  [zoom>8] {
    text-size:11.5;
    text-halo-radius: 2;
    text-fill:@state_text;
  }
  [zoom=8] {
    text-size:13 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
    text-fill:@blue_text;
  }
  [zoom=9] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
    text-fill:@blue_text;
  }
  [zoom=10] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
    text-fill:@blue_text;  }
}

/* ---- Cities (ie Ft Lauderdale, Miami)------------------------------------------------------ */

#place::city[type='city'][zoom>=8][zoom<=15] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@city_text;
  text-halo-fill:@city_halo;
  text-halo-radius:0.75;
  [zoom=8] {
    text-size:11;
    text-wrap-width: 60;
    text-halo-radius:1.3;
    text-character-spacing:0.3;
  }
  [zoom=9] {
    text-size:12;
    text-character-spacing:0.3;
    }
  [zoom=10] {
    text-fill:@blue_text;
    text-size:13;
    text-halo-radius:1;
    text-character-spacing:0.3;
  }
    [zoom=11] {
    text-fill:@blue_text;
    text-size:13.5;
    text-wrap-width: 60;
    text-halo-radius:1.2;
    text-character-spacing: 0.3;
  }
  [zoom=12] {
//    text-face-name:@sans_lt;
    text-fill:@blue_text;
    text-size:15;
 //   text-character-spacing: 1;
    text-wrap-width: 100;
    text-character-spacing: 1;
    text-transform:uppercase;
  }
  [zoom=13]{
    text-size:16;
    text-character-spacing: 1;
    text-wrap-width: 200;
    text-transform: uppercase;
    text-halo-radius:0.8;
  }
  [zoom=14] {
    text-size:17;
    text-character-spacing: 3;
    text-wrap-width: 300;
    text-transform: uppercase;
    text-halo-radius:0.8;
  }
  [zoom=15] {
    text-size:17;
    text-character-spacing: 4;
    text-wrap-width: 400;
    text-transform: uppercase;
  }
}

/* ---- Towns ------------------------------------------------------- */

#place::town[type='town'][zoom>=9][zoom<=17] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@town_text;
  text-size:10;
  text-halo-fill:@town_halo;
  text-halo-radius:1;
  text-wrap-width: 50;
  [zoom>=10] {
    text-halo-radius:2;
    text-size: 12;
  }
  [zoom>=11]{ text-size:13; }
  [zoom>=12]{
    text-size:13;
    text-line-spacing: 3;
  }
  [zoom>=13]{
    text-transform: uppercase;
    text-character-spacing: 1;
    text-line-spacing: 2;
  }
  [zoom>=14]{
    text-size:14;
    text-character-spacing: 3;
    text-line-spacing: 3;
  }
  [zoom>=15]{
    text-size:14;
    text-character-spacing: 3;
    text-line-spacing: 4;
  }
  [zoom>=15]{
    text-size:15;
    text-character-spacing: 4;
    text-line-spacing: 5;
  }
  [zoom>=17]{
    text-size:16;
    text-character-spacing: 5;
    text-line-spacing: 6;
  }
}

/* ---- Other small places ------------------------------------------ */

#place::small[type='village'][zoom>=13],
#place::small[type='hamlet'][zoom>=13],
#place::small[type='neighbourhood'][zoom>=13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@other_text;
  text-size:11;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  text-character-spacing: 0.5;
  text-line-spacing: 0;
  text-allow-overlap:false;

  [zoom>=14] {
    text-size:11;
    text-transform:uppercase;
    text-character-spacing: 0.3;
    text-wrap-width: 40;
  }
  [zoom>=15] {
    text-size:12;
    text-halo-radius: 1.5;
    text-wrap-width: 60; 
    text-line-spacing: 1;
  }
  [zoom>=16] {
    text-face-name:@sans_light;
    text-size:14;
    text-wrap-width: 120;
    text-transform:none;
    text-character-spacing: 1;
  } 
  [zoom>=17] {
    text-size:15; 
    text-wrap-width: 160;
  }
  [zoom>=18] {
    text-size:16;
  }
}
 
// similar to village/hamlet/neighborhood except for color


#place::small[type='suburb'][zoom>=12] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@tf_dark_grey;   
//  text-fill: desaturate(@suburb_text, 50%);
  text-transform: uppercase;
  text-character-spacing: 1;
  text-size:10;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  text-line-spacing: 0;
   [zoom=13] {
    text-size:14;
    text-wrap-width: 40;
  }
  [zoom>=14] {
    text-size:14;
    text-wrap-width: 40;
  }
  [zoom>=15] {
    text-halo-radius: 2;
    text-transform: uppercase;
    text-wrap-width: 60; 
  }
  [zoom>=16] {
    text-size:13;
    text-character-spacing: 2;
    text-wrap-width: 120;
    text-line-spacing: 2;
  } 
  [zoom>=17] {
    text-size:14; 
    text-character-spacing: 3;
    text-wrap-width: 160;
    text-line-spacing: 0;
  }
  [zoom>=18] {
    text-size:16;
    text-character-spacing: 4;
    text-line-spacing: 2;
  }
}

#place::small[type='locality'][zoom>=15] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@locality_text;
  text-size:11;
  text-halo-fill:@locality_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  text-character-spacing: 0.5;
  [zoom>=16] {
    text-wrap-width: 60;
 //   text-line-spacing: 2;
  }
  [zoom>=17] {
    text-size:12;
    text-wrap-width: 120;
    text-line-spacing: 2;
  }
  [zoom>=18] {
    text-size:13;
    text-line-spacing: 4;
  }
}


// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom>=11][area>25600000],
  [zoom>=13][area>1600000],
  [zoom>=14][area>320000],
  [zoom>=15][area>80000],
  [zoom>=16][area>20000],
  [zoom>=17][area>5000],
  [zoom>=18][area>=0] {
    text-name: "[name]";
    text-halo-radius: 1;
    text-face-name:@sans;
    text-size: 11.5;
    text-wrap-width:40;
    text-fill: lighten(@tf_dark_grey, 5%);
    text-halo-fill: #FFFFFF;
    text-line-spacing:-2;
        [zoom=14]{text-size:11.5; }
        [zoom=15]{text-size:12.5; text-wrap-width: 150;}
        [zoom>=16]{text-size:13; }
    // Specific style overrides for different types of areas:
    [type='park'][zoom>=10] {
 //     text-fill: @park;
//      text-halo-fill: fadeout(#FFF, 10%);
      text-wrap-width: 120;
      text-wrap-before: true;
      text-placement-type: dummy;
      [zoom>=15] {text-wrap-width:90;}
      [zoom>=16] {text-halo-radius:0.7;text-size:15;}
    }
    [type='golf_course'][zoom>=10] {
      text-fill: @sports * 0.6;
      text-halo-fill: lighten(@sports, 10);
    }
    [type='cemetery'][zoom>=10] {
      text-fill: @cemetery * 0.6;
      text-halo-fill: lighten(@cemetery, 10);
    }
    [type='hospital'][zoom>=10] {
      text-fill: @hospital * 0.6;
      text-halo-fill: lighten(@hospital, 10);
    }
    [type='college'],
    [type='school'],
    [type='university']{
      text-face-name:@sans_italic;
      text-character-spacing:0.7;
      text-fill:@tf_dark_grey; 
      }
 

    [type='water'][zoom>=10] {
      text-fill: @water * 0.6;
      text-halo-fill: lighten(@water, 10);
    }
  }
/* ================================================================== 

  [zoom=15][area>1600000],
  [zoom=16][area>80000],
  [zoom=17][area>20000],
  [zoom=18][area>5000] {
    text-name: "[name]";
    text-size: 14;
    text-wrap-width: 80;
    text-character-spacing: 1;
  }
  [zoom=16][area>1600000],
  [zoom=17][area>80000],
  [zoom=18][area>20000] {
    text-size: 15;
    text-wrap-width: 200;
    text-wrap-before: true;
    text-placement-type: simple;
  }
  [zoom>17][area>1600000],
  [zoom>18][area>80000] {
    text-size: 18;
    text-wrap-width: 200;
    text-wrap-before: true;
  }
  */
}

/* building experiments, problematic because osm data isnt lablelled universally the same 
#buildings[type='apartments'][zoom>=17] {
  text-name: '[name]';
  text-face-name: @sans_italic;
  text-size:11;
  text-fill: @poi_text;
  text-halo-radius: 1.5;
  text-halo-fill:@building;
  text-wrap-width:30;
}
*/


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17] {
  text-name: '[name]';
  text-face-name: @sans_italic;
  text-fill: fadeout(@tf_main_blue, 20%);
  text-halo-fill: fadeout(lighten(@water,10%),25%);
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 400;
  text-spacing: 500;
  text-size: 10.5;
  text-character-spacing:0.5;
  [type='river'][zoom>=15]{
    text-fill: fadeout(@tf_main_blue, 35%);
    text-size: 14;
    text-spacing: 500;
    text-character-spacing:0.5;
    [zoom=16]{text-size: 15;}
    [zoom>=17]{text-size: 16;   text-character-spacing:0;}
  }
  }
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17]{
    text-size: 12;
    text-spacing: 300;
    text-character-spacing:0.5;
  }


/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#motorway_label[zoom>=11][zoom<=14][reflen<=8] {
  shield-name: "[ref]";
  shield-size: 9;
  shield-face-name: @sans_bold;  
  shield-fill: #fff;
  shield-file: url(img/shield-motorway-1.png);
  shield-spacing: 50;
  [type='motorway'] {
    [reflen=1] { shield-file: url(img/shield-motorway-1.png); }
    [reflen=2] { shield-file: url(img/shield-motorway-2.png); }
    [reflen=3] { shield-file: url(img/shield-motorway-3.png); }
    [reflen=4] { shield-file: url(img/shield-motorway-4.png); }
    [reflen=5] { shield-file: url(img/shield-motorway-5.png); }
    [reflen=6] { shield-file: url(img/shield-motorway-6.png); }
    [reflen=7] { shield-file: url(img/shield-motorway-7.png); }
    [reflen=8] { shield-file: url(img/shield-motorway-8.png); }
  }
  [type='trunk'] {
    [reflen=1] { shield-file: url(img/shield-trunk-1.png); }
    [reflen=2] { shield-file: url(img/shield-trunk-2.png); }
    [reflen=3] { shield-file: url(img/shield-trunk-3.png); }
    [reflen=4] { shield-file: url(img/shield-trunk-4.png); }
    [reflen=5] { shield-file: url(img/shield-trunk-5.png); }
    [reflen=6] { shield-file: url(img/shield-trunk-6.png); }
    [reflen=7] { shield-file: url(img/shield-trunk-7.png); }
    [reflen=8] { shield-file: url(img/shield-trunk-8.png); }
  }
  [zoom=11] { shield-min-distance: 60; } //50
  [zoom=12] { shield-min-distance: 80; } //60
  [zoom=13] { shield-min-distance: 120; } //120
  [zoom=14] { shield-min-distance: 180; }
}

#motorway_label[type='motorway'][zoom>9],
#motorway_label[type='trunk'][zoom>9] {
  text-name:"[name]";
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@primary_fill;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:12;
  text-character-spacing:0.5;
  [zoom=11] { text-min-distance:70; }
  [zoom=12] { text-min-distance:80; }
  [zoom=13] { text-min-distance:100; }
  [zoom=17] { text-size:12.5;}
  [zoom>=18] { text-size:14;}


}

#mainroad_label[type='primary'][zoom>12],
#mainroad_label[type='secondary'][zoom>13],
#mainroad_label[type='tertiary'][zoom>13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-character-spacing:0.5;
  text-placement:line;
  text-fill:@road_text;
//  text-fill:darken(@road_text,15%);
  text-halo-fill:@tf_bg_beige;
  text-halo-radius:1;
  text-min-distance:60;
  [zoom=15]{
  text-face-name:@sans;  
  text-size:11;
  text-halo-radius:1.5;
  text-character-spacing:0.8;
  text-avoid-edges:true;}
  [zoom>=16]{
  text-size:12;
  text-face-name:@sans;  
  text-fill:@road_text;
  text-halo-radius:1.5;
  text-character-spacing:0.5;}
}

#minorroad_label[zoom>14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-character-spacing:0.8;
  text-halo-fill:@tf_bg_beige;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
  text-avoid-edges:true;
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */

#motorway_label[oneway!=0][zoom>=16],
#mainroad_label[oneway!=0][zoom>=16],
#minorroad_label[oneway!=0][zoom>=16] {
  marker-placement:line;
  marker-max-error: 0.5;
  marker-spacing: 200;
  marker-file: url(img/icon/oneway.svg);
  [oneway=-1] { marker-file: url(img/icon/oneway-reverse.svg); }
  [zoom=16] { marker-transform: "scale(0.9)"; }
  [zoom=17] { marker-transform: "scale(0.75)"; }
}


/* ****************************************************************** */
