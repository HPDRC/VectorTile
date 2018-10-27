/* ****************************************************************** */
/* OSM BRIGHT for Imposm                                              */
/* ****************************************************************** */

/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* directory to load fonts from in addition to the system directories */
Map { font-directory: url(./fonts); }

/* this is a modiefied osm bright setup to work in non latin */

@sans_light:        "Noto Sans Regular", "Noto Naskh Arabic Regular", "Noto Kufi Arabic Regular", "DejaVu Sans Book", "unifont Medium";
@sans_lt:           "Noto Sans Regular", "Noto Naskh Arabic Regular", "Noto Kufi Arabic Regular", "DejaVu Sans Book", "unifont Medium";
@sans_lt_italic:    "Noto Sans Italic", "Noto Naskh Arabic Regular", "Noto Kufi Arabic Regular", "DejaVu Sans Book", "unifont Medium";
@sans:              "Noto Sans Regular", "Noto Naskh Arabic Regular", "Noto Kufi Arabic Regular", "DejaVu Sans Book", "unifont Medium";
@sans_italic:       "Noto Sans Italic", "Noto Naskh Arabic Regular", "Noto Kufi Arabic Regular", "DejaVu Sans Book", "unifont Medium";
@sans_bold:         "Noto Sans Bold", "Noto Naskh Arabic Regular", "Noto Kufi Arabic Regular", "DejaVu Sans Book", "unifont Medium";
@sans_bold_italic:  "Noto Sans Bold Italic", "Noto Naskh Arabic Regular", "Noto Kufi Arabic Regular", "DejaVu Sans Book", "unifont Medium";


/* this is the original osm bright setup up font sets for various weights and styles 
@sans_light:        "Open Sans Light", "DejaVu Sans Book","unifont Medium";
@sans_lt:           "Open Sans Regular","DejaVu Sans Book","unifont Medium";
@sans_lt_italic:    "Open Sans Italic","DejaVu Sans Italic","unifont Medium";
@sans:              "Open Sans Semibold","DejaVu Sans Book","unifont Medium";
@sans_italic:       "Open Sans Semibold Italic","DejaVu Sans Italic","unifont Medium";
@sans_bold:         "Open Sans Bold","DejaVu Sans Bold","unifont Medium";
@sans_bold_italic:  "Open Sans Bold Italic","DejaVu Sans Bold Italic","unifont Medium";
*/

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 4;


/* ================================================================== */
/* Terrafly branding colors
/* ================================================================== */

//@tf_main_blue:      #004499; 
//this is the original tf blue I have in mind, the other one that is used here is an
// adaption that works better for the lables
@tf_main_blue:      #002F6B;
@tf_ligher_blue:    #0066cc;
@tf_darker_blue:    #003377;
@tf_accent_green:   #558811;
@tf_accent_red:     #810D0D;
@tf_accent_yellow:  #FFC200;
@tf_dark_grey:      #646460;
@tf_bg_beige:       #f2f2e6;
@tf_bg_grey:        #ebebeb;

@tf_legacy_blue:    #00618D;


/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

//@land:              #E9EFF7;
@land:              #FFF;
@water:             #AAD0ED;
//@water:             #A1C3DE;
@grass:             #d2dca0;
@grass_outline:     #bec896;
@beach:             #FFEEC7;
@park:              @tf_accent_green;
@cemetery:          #D6DED2;
@wooded:            #B8D781;
@agriculture:       #F2E8B6;
@building_alt:      #E0EDF2;
@building_lt:       lighten(@tf_bg_grey,3%);
@building:          @tf_bg_grey;
@hospital:          rgb(229,198,195);
@school:            @tf_bg_grey; 
@sports:            #E1EBB0;
@sports_outline:    #ADBA6E;
@university:        @land * 0.95;
@residential:       @land * 0.98;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           #F2F2F2;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline). (also, the roads fill in lower zoomlevels)
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_line:     #DEDED2;
@motorway_fill: 	#F2E5C5;
//@motorway_fill:     #E8E8DC;
//@motorway_fill:     lighten(@motorway_line,10%);
@motorway_case:     #B8B8B2;
@motorway_case_sm:  #FFFFFF;

@trunk_line:      #DEDED2;
@trunk_fill:      #F2E5C5;
//@trunk_fill:        lighten(@trunk_line,10%);
@trunk_case:      #B8B8B2;
//@trunk_case:        @trunk_line * 0.9;

@primary_line:      #DEDED2;
@primary_fill:      @tf_bg_beige;
//@primary_fill:      lighten(@primary_line,10%);
@primary_case:      #B8B8B2;
// @primary_case:      @primary_line * 0.9;

@secondary_line:    #DEDED2;
@secondary_fill:    @tf_bg_beige;
// @secondary_fill:    lighten(@secondary_line,10%);
@secondary_case:    #CACAC5;
// @secondary_case:    @secondary_line * 0.9;

@standard_line:    #ffffff;
//@standard_line:     @land * 0.85;
@standard_fill:     @tf_bg_beige;
@standard_case:     #B8B8B2;
//@standard_case:     @land * 0.9;

@pedestrian_line:   @standard_line;
@pedestrian_fill:   #FAFAF5;
@pedestrian_case:   @land;

@cycle_line:        @standard_line;
@cycle_fill:        #FAFAF5;
@cycle_case:        @land;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         @land;

@noauto_line:       #B8B8B2;
@noauto_case:       #fff;

@aeroway:           @standard_case;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        @land;
// @place_halo:        fadeout(#fff,34%);

@blue_text:         desaturate(@tf_main_blue, 20%);

@country_text:      @tf_dark_grey; 
@country_halo:      @place_halo;

@state_text:        @tf_dark_grey; 
@state_halo:        @place_halo;

@city_text:         @tf_dark_grey;
@city_halo:         @place_halo;

@town_text:        @tf_dark_grey;
@town_halo:         @place_halo;

@suburb_text:       @tf_dark_grey;
@town_halo:         @place_halo;

@poi_text:          #888;

@road_text:         #777;
@road_halo:         #fff;

@other_text:        #656565;
@other_halo:        @place_halo;

@locality_text:     @tf_dark_grey;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      @tf_dark_grey;
@village_halo:      @place_halo;

/* ****************************************************************** */



