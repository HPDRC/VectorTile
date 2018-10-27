
/* ================================================================== */
/* RELIEF (copied from https://github.com/hotosm/HDM-CartoCSS/blob/master/base.mss)
/* ================================================================== */

#hillshade[zoom>=4]{
    raster-scaling: bilinear;
    raster-comp-op: multiply;
    raster-opacity: 0.85;

    [zoom>=5]  {raster-opacity: 0.65;}
    [zoom>=7]  {raster-opacity: 0.55;}
    [zoom>=9]  {raster-opacity: 0.45;}
    [zoom>=10] {raster-opacity: 0.40;}
    [zoom>=14] {raster-opacity: 0.30;}
    [zoom>=16] {raster-opacity: 0.25;}
}

#contour_line[zoom>=12]{
  line-width: 0.2;
  line-color: @contour_line;
  [zoom>=15] {
    line-width: 0.5;
  }
  [height=100], [height=200], [height=300], [height=400], [height=500],
  [height=600], [height=700], [height=800], [height=900], [height=1000],
  [height=1100], [height=1200], [height=1300], [height=1400], [height=1500],
  [height=1600], [height=1700], [height=1800], [height=1900], [height=2000],
  [height=2100], [height=2200], [height=2300], [height=2400], [height=2500],
  [height=3000], [height=3500],
  [height=4000], [height=4500],
  [height=5000], [height=5500],
  [height=6000], [height=6500],
  [height=7000], [height=7500],
  [height=8000] {
    line-width: 0.5;
    [zoom>=15] {
      line-width: 1;
      text-name: "[height]";
      text-face-name: @sans_lt;
      text-placement: line;
      text-fill: @contour_line;
      text-halo-fill: @land;
      text-halo-radius: 1;
      text-spacing: 500;
    }
  }
}
