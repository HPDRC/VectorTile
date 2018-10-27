//------------------- polygon_label / polygon_label2 -------------------
#incorp_label[zoom>=11],
#prism_label[zoom>=10],
#zipcode_label[zoom>=11]
{
  text-face-name: @font;
  text-placement: point;
  text-halo-radius: 1;
  text-halo-fill: black;
  text-fill: rgb(115,230,255);
  text-allow-overlap: false;
  text-avoid-edges: true;
  text-min-distance: 30;
  text-size: 14;
  [zoom>=13] {text-size: 15;}
  [zoom>=15] {text-size: 16;}
  [zoom>=17] {text-size: 17;}
}
#incorp_label[zoom>=11] {text-name: '[name]';}
#prism_label[zoom>=10] {text-name: '[labeltq]';}
#zipcode_label[zoom>=11]
{
  text-name: '[zip]';
  text-size: 12;
  [zoom>=13] {text-size: 13;}
  [zoom>=15] {text-size: 15;}
  [zoom>=17] {text-size: 17;}
}

//------------------- line_label -------------------
#santiago_segments_label[zoom>=14],
#nv_highway_label[zoom>=10],
#nv_main_road_label[zoom>=13],
#nv_detail_road_label[zoom>=15]
{
  text-name: '[st_name]';
  text-face-name: @font;
  text-placement: line;
  text-halo-radius: 1;
  text-halo-fill: black;
  text-fill: white;
  text-allow-overlap: false;
  text-avoid-edges: true;
  text-min-distance: 30;
  text-size: 13;
  [zoom=16] {text-size: 14;}
  [zoom=17] {text-size: 15;}
  [zoom>=18] {text-size: 16;}
}
#nv_highway_label[zoom>=10],
#nv_main_road_label[zoom>=13],
#nv_detail_road_label[zoom>=15]
{
  text-size: 12;
  [zoom>=16] {text-size: 13;}
  [zoom>=18] {text-size: 14;}
}
#nv_highway_label[zoom>=10],
#nv_main_road_label[zoom>=13]
{
  text-min-distance: 50;
  text-min-path-length: 50;
  text-spacing: 50;
}

//------------------- label1 / label2 / label3 / label4 -------------------
#flpropertiesowner[zoom>=18],
#flpropertiesyear[zoom>=18],
#flpropertiessize[zoom>=18],
#flpropertiesvalue[zoom>=18]
{
  text-name: '[labeltq]';
  text-face-name: @font;
  text-size: 12;
  text-fill: black;
  text-placement: point;
  text-halo-radius: 1;
  text-halo-fill: white;
  text-allow-overlap: false;
  text-avoid-edges: true;
  text-min-distance: 0;
}
#flpropertiesowner[zoom>=18] {text-dx: 0; text-dy: 25;}
#flpropertiesyear[zoom>=18] {text-dx: 0; text-dy: 12;}
#flpropertiesvalue[zoom>=18] {text-dx: 0; text-dy: -12;}
