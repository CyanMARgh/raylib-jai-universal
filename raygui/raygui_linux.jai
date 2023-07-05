//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



RAYGUI_VERSION_MAJOR :: 4;
RAYGUI_VERSION_MINOR :: 0;
RAYGUI_VERSION_PATCH :: 0;
RAYGUI_VERSION :: "4.0-dev";

SCROLLBAR_LEFT_SIDE :: 0;
SCROLLBAR_RIGHT_SIDE :: 1;

// Style property
StyleProp :: struct {
    controlId:     u16;
    propertyId:    u16;
    propertyValue: u32;
}

// Gui control state
State :: enum u32 {
    NORMAL   :: 0;
    FOCUSED  :: 1;
    PRESSED  :: 2;
    DISABLED :: 3;

    STATE_NORMAL   :: NORMAL;
    STATE_FOCUSED  :: FOCUSED;
    STATE_PRESSED  :: PRESSED;
    STATE_DISABLED :: DISABLED;
}

// Gui control text alignment
TextAlignment :: enum u32 {
    LEFT   :: 0;
    CENTER :: 1;
    RIGHT  :: 2;

    TEXT_ALIGN_LEFT   :: LEFT;
    TEXT_ALIGN_CENTER :: CENTER;
    TEXT_ALIGN_RIGHT  :: RIGHT;
}

// Gui controls
Control :: enum u32 {
    DEFAULT     :: 0;

    LABEL       :: 1;
    BUTTON      :: 2;
    TOGGLE      :: 3;
    SLIDER      :: 4;
    PROGRESSBAR :: 5;
    CHECKBOX    :: 6;
    COMBOBOX    :: 7;
    DROPDOWNBOX :: 8;
    TEXTBOX     :: 9;
    VALUEBOX    :: 10;
    SPINNER     :: 11;
    LISTVIEW    :: 12;
    COLORPICKER :: 13;
    SCROLLBAR   :: 14;
    STATUSBAR   :: 15;
}

// Gui base properties for every control
// NOTE: RAYGUI_MAX_PROPS_BASE properties (by default 16 properties)
ControlProperty :: enum u32 {
    BORDER_COLOR_NORMAL   :: 0;
    BASE_COLOR_NORMAL     :: 1;
    TEXT_COLOR_NORMAL     :: 2;
    BORDER_COLOR_FOCUSED  :: 3;
    BASE_COLOR_FOCUSED    :: 4;
    TEXT_COLOR_FOCUSED    :: 5;
    BORDER_COLOR_PRESSED  :: 6;
    BASE_COLOR_PRESSED    :: 7;
    TEXT_COLOR_PRESSED    :: 8;
    BORDER_COLOR_DISABLED :: 9;
    BASE_COLOR_DISABLED   :: 10;
    TEXT_COLOR_DISABLED   :: 11;
    BORDER_WIDTH          :: 12;
    TEXT_PADDING          :: 13;
    TEXT_ALIGNMENT        :: 14;
    RESERVED              :: 15;
}

// DEFAULT extended properties
// NOTE: Those properties are common to all controls or global
DefaultProperty :: enum u32 {
    TEXT_SIZE         :: 16;
    TEXT_SPACING      :: 17;
    LINE_COLOR        :: 18;
    BACKGROUND_COLOR  :: 19;
    TEXT_LINE_SPACING :: 20;
}

// Toggle/ToggleGroup
ToggleProperty :: enum u32 {
    GROUP_PADDING :: 16;
}

// Slider/SliderBar
SliderProperty :: enum u32 {
    WIDTH   :: 16;
    PADDING :: 17;

    SLIDER_WIDTH   :: WIDTH;
    SLIDER_PADDING :: PADDING;
}

// ProgressBar
ProgressBarProperty :: enum u32 {
    PROGRESS_PADDING :: 16;
}

// ScrollBar
ScrollBarProperty :: enum u32 {
    ARROWS_SIZE           :: 16;
    ARROWS_VISIBLE        :: 17;
    SCROLL_SLIDER_PADDING :: 18;
    SCROLL_SLIDER_SIZE    :: 19;
    SCROLL_PADDING        :: 20;
    SCROLL_SPEED          :: 21;
}

// CheckBox
CheckBoxProperty :: enum u32 {
    CHECK_PADDING :: 16;
}

// ComboBox
ComboBoxProperty :: enum u32 {
    WIDTH   :: 16;
    SPACING :: 17;

    COMBO_BUTTON_WIDTH   :: WIDTH;
    COMBO_BUTTON_SPACING :: SPACING;
}

// DropdownBox
DropdownBoxProperty :: enum u32 {
    ARROW_PADDING          :: 16;
    DROPDOWN_ITEMS_SPACING :: 17;
}

// TextBox/TextBoxMulti/ValueBox/Spinner
TextBoxProperty :: enum u32 {
    INNER_PADDING      :: 16;
    LINES_SPACING      :: 17;
    ALIGNMENT_VERTICAL :: 18;
    MULTILINE          :: 19;
    WRAP_MODE          :: 20;

    TEXT_INNER_PADDING      :: INNER_PADDING;
    TEXT_LINES_SPACING      :: LINES_SPACING;
    TEXT_ALIGNMENT_VERTICAL :: ALIGNMENT_VERTICAL;
    TEXT_MULTILINE          :: MULTILINE;
    TEXT_WRAP_MODE          :: WRAP_MODE;
}

// Spinner
SpinnerProperty :: enum u32 {
    WIDTH   :: 16;
    SPACING :: 17;

    SPIN_BUTTON_WIDTH   :: WIDTH;
    SPIN_BUTTON_SPACING :: SPACING;
}

// ListView
ListViewProperty :: enum u32 {
    LIST_ITEMS_HEIGHT  :: 16;
    LIST_ITEMS_SPACING :: 17;
    SCROLLBAR_WIDTH    :: 18;
    SCROLLBAR_SIDE     :: 19;
}

// ColorPicker
ColorPickerProperty :: enum u32 {
    COLOR_SELECTOR_SIZE      :: 16;
    HUEBAR_WIDTH             :: 17;
    HUEBAR_PADDING           :: 18;
    HUEBAR_SELECTOR_HEIGHT   :: 19;
    HUEBAR_SELECTOR_OVERFLOW :: 20;
}

// Global gui state control functions
Enable :: () -> void #foreign _/raygui "GuiEnable";
Disable :: () -> void #foreign _/raygui "GuiDisable";
Lock :: () -> void #foreign _/raygui "GuiLock";
Unlock :: () -> void #foreign _/raygui "GuiUnlock";
IsLocked :: () -> bool #foreign _/raygui "GuiIsLocked";
Fade :: (alpha: float) -> void #foreign _/raygui "GuiFade";
SetState :: (state: s32) -> void #foreign _/raygui "GuiSetState";
GetState :: () -> s32 #foreign _/raygui "GuiGetState";

// Font set/get functions
SetFont :: (font: Font) -> void #foreign _/raygui "GuiSetFont";
GetFont :: () -> Font #foreign _/raygui "GuiGetFont";

// Style set/get functions
SetStyle :: (control: s32, property: s32, value: s32) -> void #foreign _/raygui "GuiSetStyle";
GetStyle :: (control: s32, property: s32) -> s32 #foreign _/raygui "GuiGetStyle";

// Styles loading functions
LoadStyle :: (fileName: *u8) -> void #foreign _/raygui "GuiLoadStyle";
LoadStyleDefault :: () -> void #foreign _/raygui "GuiLoadStyleDefault";

// Tooltips management functions
EnableTooltip :: () -> void #foreign _/raygui "GuiEnableTooltip";
DisableTooltip :: () -> void #foreign _/raygui "GuiDisableTooltip";
SetTooltip :: (tooltip: *u8) -> void #foreign _/raygui "GuiSetTooltip";

// Icons functionality
IconText :: (iconId: s32, text: *u8) -> *u8 #foreign _/raygui "GuiIconText";

SetIconScale :: (scale: s32) -> void #foreign _/raygui "GuiSetIconScale";
GetIcons :: () -> *u32 #foreign _/raygui "GuiGetIcons";
LoadIcons :: (fileName: *u8, loadIconsName: bool) -> **u8 #foreign _/raygui "GuiLoadIcons";
DrawIcon :: (iconId: s32, posX: s32, posY: s32, pixelSize: s32, color: Color) -> void #foreign _/raygui "GuiDrawIcon";

// Controls
//----------------------------------------------------------------------------------------------------------
// Container/separator controls, useful for controls organization
WindowBox :: (bounds: Rectangle, title: *u8) -> s32 #foreign _/raygui "GuiWindowBox";
GroupBox :: (bounds: Rectangle, text: *u8) -> s32 #foreign _/raygui "GuiGroupBox";
Line :: (bounds: Rectangle, text: *u8) -> s32 #foreign _/raygui "GuiLine";
Panel :: (bounds: Rectangle, text: *u8) -> s32 #foreign _/raygui "GuiPanel";
TabBar :: (bounds: Rectangle, text: **u8, count: s32, active: *s32) -> s32 #foreign _/raygui "GuiTabBar";
ScrollPanel :: (bounds: Rectangle, text: *u8, content: Rectangle, scroll: *Vector2, view: *Rectangle) -> s32 #foreign _/raygui "GuiScrollPanel";

// Basic controls set
Label :: (bounds: Rectangle, text: *u8) -> s32 #foreign _/raygui "GuiLabel";
Button :: (bounds: Rectangle, text: *u8) -> s32 #foreign _/raygui "GuiButton";
LabelButton :: (bounds: Rectangle, text: *u8) -> s32 #foreign _/raygui "GuiLabelButton";
Toggle :: (bounds: Rectangle, text: *u8, active: *bool) -> s32 #foreign _/raygui "GuiToggle";
ToggleGroup :: (bounds: Rectangle, text: *u8, active: *s32) -> s32 #foreign _/raygui "GuiToggleGroup";
CheckBox :: (bounds: Rectangle, text: *u8, checked: *bool) -> s32 #foreign _/raygui "GuiCheckBox";
ComboBox :: (bounds: Rectangle, text: *u8, active: *s32) -> s32 #foreign _/raygui "GuiComboBox";

DropdownBox :: (bounds: Rectangle, text: *u8, active: *s32, editMode: bool) -> s32 #foreign _/raygui "GuiDropdownBox";
Spinner :: (bounds: Rectangle, text: *u8, value: *s32, minValue: s32, maxValue: s32, editMode: bool) -> s32 #foreign _/raygui "GuiSpinner";
ValueBox :: (bounds: Rectangle, text: *u8, value: *s32, minValue: s32, maxValue: s32, editMode: bool) -> s32 #foreign _/raygui "GuiValueBox";
TextBox :: (bounds: Rectangle, text: *u8, textSize: s32, editMode: bool) -> s32 #foreign _/raygui "GuiTextBox";

Slider :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign _/raygui "GuiSlider";
SliderBar :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign _/raygui "GuiSliderBar";
ProgressBar :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign _/raygui "GuiProgressBar";
StatusBar :: (bounds: Rectangle, text: *u8) -> s32 #foreign _/raygui "GuiStatusBar";
DummyRec :: (bounds: Rectangle, text: *u8) -> s32 #foreign _/raygui "GuiDummyRec";
Grid :: (bounds: Rectangle, text: *u8, spacing: float, subdivs: s32, mouseCell: *Vector2) -> s32 #foreign _/raygui "GuiGrid";

// Advance controls set
ListView :: (bounds: Rectangle, text: *u8, scrollIndex: *s32, active: *s32) -> s32 #foreign _/raygui "GuiListView";
ListViewEx :: (bounds: Rectangle, text: **u8, count: s32, scrollIndex: *s32, active: *s32, focus: *s32) -> s32 #foreign _/raygui "GuiListViewEx";
MessageBox :: (bounds: Rectangle, title: *u8, message: *u8, buttons: *u8) -> s32 #foreign _/raygui "GuiMessageBox";
TextInputBox :: (bounds: Rectangle, title: *u8, message: *u8, buttons: *u8, text: *u8, textMaxSize: s32, secretViewActive: *bool) -> s32 #foreign _/raygui "GuiTextInputBox";
ColorPicker :: (bounds: Rectangle, text: *u8, color: *Color) -> s32 #foreign _/raygui "GuiColorPicker";
ColorPanel :: (bounds: Rectangle, text: *u8, color: *Color) -> s32 #foreign _/raygui "GuiColorPanel";
ColorBarAlpha :: (bounds: Rectangle, text: *u8, alpha: *float) -> s32 #foreign _/raygui "GuiColorBarAlpha";
ColorBarHue :: (bounds: Rectangle, text: *u8, value: *float) -> s32 #foreign _/raygui "GuiColorBarHue";
ColorPickerHSV :: (bounds: Rectangle, text: *u8, colorHsv: *Vector3) -> s32 #foreign _/raygui "GuiColorPickerHSV";
ColorPanelHSV :: (bounds: Rectangle, text: *u8, colorHsv: *Vector3) -> s32 #foreign _/raygui "GuiColorPanelHSV";

//----------------------------------------------------------------------------------
// Icons enumeration
//----------------------------------------------------------------------------------
IconName :: enum u32 {
    NONE                    :: 0;
    FOLDER_FILE_OPEN        :: 1;
    FILE_SAVE_CLASSIC       :: 2;
    FOLDER_OPEN             :: 3;
    FOLDER_SAVE             :: 4;
    FILE_OPEN               :: 5;
    FILE_SAVE               :: 6;
    FILE_EXPORT             :: 7;
    FILE_ADD                :: 8;
    FILE_DELETE             :: 9;
    FILETYPE_TEXT           :: 10;
    FILETYPE_AUDIO          :: 11;
    FILETYPE_IMAGE          :: 12;
    FILETYPE_PLAY           :: 13;
    FILETYPE_VIDEO          :: 14;
    FILETYPE_INFO           :: 15;
    FILE_COPY               :: 16;
    FILE_CUT                :: 17;
    FILE_PASTE              :: 18;
    CURSOR_HAND             :: 19;
    CURSOR_POINTER          :: 20;
    CURSOR_CLASSIC          :: 21;
    PENCIL                  :: 22;
    PENCIL_BIG              :: 23;
    BRUSH_CLASSIC           :: 24;
    BRUSH_PAINTER           :: 25;
    WATER_DROP              :: 26;
    COLOR_PICKER            :: 27;
    RUBBER                  :: 28;
    COLOR_BUCKET            :: 29;
    TEXT_T                  :: 30;
    TEXT_A                  :: 31;
    SCALE                   :: 32;
    RESIZE                  :: 33;
    FILTER_POINT            :: 34;
    FILTER_BILINEAR         :: 35;
    CROP                    :: 36;
    CROP_ALPHA              :: 37;
    SQUARE_TOGGLE           :: 38;
    SYMMETRY                :: 39;
    SYMMETRY_HORIZONTAL     :: 40;
    SYMMETRY_VERTICAL       :: 41;
    LENS                    :: 42;
    LENS_BIG                :: 43;
    EYE_ON                  :: 44;
    EYE_OFF                 :: 45;
    FILTER_TOP              :: 46;
    FILTER                  :: 47;
    TARGET_POINT            :: 48;
    TARGET_SMALL            :: 49;
    TARGET_BIG              :: 50;
    TARGET_MOVE             :: 51;
    CURSOR_MOVE             :: 52;
    CURSOR_SCALE            :: 53;
    CURSOR_SCALE_RIGHT      :: 54;
    CURSOR_SCALE_LEFT       :: 55;
    UNDO                    :: 56;
    REDO                    :: 57;
    REREDO                  :: 58;
    MUTATE                  :: 59;
    ROTATE                  :: 60;
    REPEAT                  :: 61;
    SHUFFLE                 :: 62;
    EMPTYBOX                :: 63;
    TARGET                  :: 64;
    TARGET_SMALL_FILL       :: 65;
    TARGET_BIG_FILL         :: 66;
    TARGET_MOVE_FILL        :: 67;
    CURSOR_MOVE_FILL        :: 68;
    CURSOR_SCALE_FILL       :: 69;
    CURSOR_SCALE_RIGHT_FILL :: 70;
    CURSOR_SCALE_LEFT_FILL  :: 71;
    UNDO_FILL               :: 72;
    REDO_FILL               :: 73;
    REREDO_FILL             :: 74;
    MUTATE_FILL             :: 75;
    ROTATE_FILL             :: 76;
    REPEAT_FILL             :: 77;
    SHUFFLE_FILL            :: 78;
    EMPTYBOX_SMALL          :: 79;
    BOX                     :: 80;
    BOX_TOP                 :: 81;
    BOX_TOP_RIGHT           :: 82;
    BOX_RIGHT               :: 83;
    BOX_BOTTOM_RIGHT        :: 84;
    BOX_BOTTOM              :: 85;
    BOX_BOTTOM_LEFT         :: 86;
    BOX_LEFT                :: 87;
    BOX_TOP_LEFT            :: 88;
    BOX_CENTER              :: 89;
    BOX_CIRCLE_MASK         :: 90;
    POT                     :: 91;
    ALPHA_MULTIPLY          :: 92;
    ALPHA_CLEAR             :: 93;
    DITHERING               :: 94;
    MIPMAPS                 :: 95;
    BOX_GRID                :: 96;
    GRID                    :: 97;
    BOX_CORNERS_SMALL       :: 98;
    BOX_CORNERS_BIG         :: 99;
    FOUR_BOXES              :: 100;
    GRID_FILL               :: 101;
    BOX_MULTISIZE           :: 102;
    ZOOM_SMALL              :: 103;
    ZOOM_MEDIUM             :: 104;
    ZOOM_BIG                :: 105;
    ZOOM_ALL                :: 106;
    ZOOM_CENTER             :: 107;
    BOX_DOTS_SMALL          :: 108;
    BOX_DOTS_BIG            :: 109;
    BOX_CONCENTRIC          :: 110;
    BOX_GRID_BIG            :: 111;
    OK_TICK                 :: 112;
    CROSS                   :: 113;
    ARROW_LEFT              :: 114;
    ARROW_RIGHT             :: 115;
    ARROW_DOWN              :: 116;
    ARROW_UP                :: 117;
    ARROW_LEFT_FILL         :: 118;
    ARROW_RIGHT_FILL        :: 119;
    ARROW_DOWN_FILL         :: 120;
    ARROW_UP_FILL           :: 121;
    AUDIO                   :: 122;
    FX                      :: 123;
    WAVE                    :: 124;
    WAVE_SINUS              :: 125;
    WAVE_SQUARE             :: 126;
    WAVE_TRIANGULAR         :: 127;
    CROSS_SMALL             :: 128;
    PLAYER_PREVIOUS         :: 129;
    PLAYER_PLAY_BACK        :: 130;
    PLAYER_PLAY             :: 131;
    PLAYER_PAUSE            :: 132;
    PLAYER_STOP             :: 133;
    PLAYER_NEXT             :: 134;
    PLAYER_RECORD           :: 135;
    MAGNET                  :: 136;
    LOCK_CLOSE              :: 137;
    LOCK_OPEN               :: 138;
    CLOCK                   :: 139;
    TOOLS                   :: 140;
    GEAR                    :: 141;
    GEAR_BIG                :: 142;
    BIN                     :: 143;
    HAND_POINTER            :: 144;
    LASER                   :: 145;
    COIN                    :: 146;
    EXPLOSION               :: 147;
    _1UP                    :: 148;
    PLAYER                  :: 149;
    PLAYER_JUMP             :: 150;
    KEY                     :: 151;
    DEMON                   :: 152;
    TEXT_POPUP              :: 153;
    GEAR_EX                 :: 154;
    CRACK                   :: 155;
    CRACK_POINTS            :: 156;
    STAR                    :: 157;
    DOOR                    :: 158;
    EXIT                    :: 159;
    MODE_2D                 :: 160;
    MODE_3D                 :: 161;
    CUBE                    :: 162;
    CUBE_FACE_TOP           :: 163;
    CUBE_FACE_LEFT          :: 164;
    CUBE_FACE_FRONT         :: 165;
    CUBE_FACE_BOTTOM        :: 166;
    CUBE_FACE_RIGHT         :: 167;
    CUBE_FACE_BACK          :: 168;
    CAMERA                  :: 169;
    SPECIAL                 :: 170;
    LINK_NET                :: 171;
    LINK_BOXES              :: 172;
    LINK_MULTI              :: 173;
    LINK                    :: 174;
    LINK_BROKE              :: 175;
    TEXT_NOTES              :: 176;
    NOTEBOOK                :: 177;
    SUITCASE                :: 178;
    SUITCASE_ZIP            :: 179;
    MAILBOX                 :: 180;
    MONITOR                 :: 181;
    PRINTER                 :: 182;
    PHOTO_CAMERA            :: 183;
    PHOTO_CAMERA_FLASH      :: 184;
    HOUSE                   :: 185;
    HEART                   :: 186;
    CORNER                  :: 187;
    VERTICAL_BARS           :: 188;
    VERTICAL_BARS_FILL      :: 189;
    LIFE_BARS               :: 190;
    INFO                    :: 191;
    CROSSLINE               :: 192;
    HELP                    :: 193;
    FILETYPE_ALPHA          :: 194;
    FILETYPE_HOME           :: 195;
    LAYERS_VISIBLE          :: 196;
    LAYERS                  :: 197;
    WINDOW                  :: 198;
    HIDPI                   :: 199;
    FILETYPE_BINARY         :: 200;
    HEX                     :: 201;
    SHIELD                  :: 202;
    FILE_NEW                :: 203;
    FOLDER_ADD              :: 204;
    ALARM                   :: 205;
    CPU                     :: 206;
    ROM                     :: 207;
    STEP_OVER               :: 208;
    STEP_INTO               :: 209;
    STEP_OUT                :: 210;
    RESTART                 :: 211;
    BREAKPOINT_ON           :: 212;
    BREAKPOINT_OFF          :: 213;
    BURGER_MENU             :: 214;
    CASE_SENSITIVE          :: 215;
    REG_EXP                 :: 216;
    FOLDER                  :: 217;
    FILE                    :: 218;
    SAND_TIMER              :: 219;
    _220                    :: 220;
    _221                    :: 221;
    _222                    :: 222;
    _223                    :: 223;
    _224                    :: 224;
    _225                    :: 225;
    _226                    :: 226;
    _227                    :: 227;
    _228                    :: 228;
    _229                    :: 229;
    _230                    :: 230;
    _231                    :: 231;
    _232                    :: 232;
    _233                    :: 233;
    _234                    :: 234;
    _235                    :: 235;
    _236                    :: 236;
    _237                    :: 237;
    _238                    :: 238;
    _239                    :: 239;
    _240                    :: 240;
    _241                    :: 241;
    _242                    :: 242;
    _243                    :: 243;
    _244                    :: 244;
    _245                    :: 245;
    _246                    :: 246;
    _247                    :: 247;
    _248                    :: 248;
    _249                    :: 249;
    _250                    :: 250;
    _251                    :: 251;
    _252                    :: 252;
    _253                    :: 253;
    _254                    :: 254;
    _255                    :: 255;

    ICON_NONE                    :: NONE;
    ICON_FOLDER_FILE_OPEN        :: FOLDER_FILE_OPEN;
    ICON_FILE_SAVE_CLASSIC       :: FILE_SAVE_CLASSIC;
    ICON_FOLDER_OPEN             :: FOLDER_OPEN;
    ICON_FOLDER_SAVE             :: FOLDER_SAVE;
    ICON_FILE_OPEN               :: FILE_OPEN;
    ICON_FILE_SAVE               :: FILE_SAVE;
    ICON_FILE_EXPORT             :: FILE_EXPORT;
    ICON_FILE_ADD                :: FILE_ADD;
    ICON_FILE_DELETE             :: FILE_DELETE;
    ICON_FILETYPE_TEXT           :: FILETYPE_TEXT;
    ICON_FILETYPE_AUDIO          :: FILETYPE_AUDIO;
    ICON_FILETYPE_IMAGE          :: FILETYPE_IMAGE;
    ICON_FILETYPE_PLAY           :: FILETYPE_PLAY;
    ICON_FILETYPE_VIDEO          :: FILETYPE_VIDEO;
    ICON_FILETYPE_INFO           :: FILETYPE_INFO;
    ICON_FILE_COPY               :: FILE_COPY;
    ICON_FILE_CUT                :: FILE_CUT;
    ICON_FILE_PASTE              :: FILE_PASTE;
    ICON_CURSOR_HAND             :: CURSOR_HAND;
    ICON_CURSOR_POINTER          :: CURSOR_POINTER;
    ICON_CURSOR_CLASSIC          :: CURSOR_CLASSIC;
    ICON_PENCIL                  :: PENCIL;
    ICON_PENCIL_BIG              :: PENCIL_BIG;
    ICON_BRUSH_CLASSIC           :: BRUSH_CLASSIC;
    ICON_BRUSH_PAINTER           :: BRUSH_PAINTER;
    ICON_WATER_DROP              :: WATER_DROP;
    ICON_COLOR_PICKER            :: COLOR_PICKER;
    ICON_RUBBER                  :: RUBBER;
    ICON_COLOR_BUCKET            :: COLOR_BUCKET;
    ICON_TEXT_T                  :: TEXT_T;
    ICON_TEXT_A                  :: TEXT_A;
    ICON_SCALE                   :: SCALE;
    ICON_RESIZE                  :: RESIZE;
    ICON_FILTER_POINT            :: FILTER_POINT;
    ICON_FILTER_BILINEAR         :: FILTER_BILINEAR;
    ICON_CROP                    :: CROP;
    ICON_CROP_ALPHA              :: CROP_ALPHA;
    ICON_SQUARE_TOGGLE           :: SQUARE_TOGGLE;
    ICON_SYMMETRY                :: SYMMETRY;
    ICON_SYMMETRY_HORIZONTAL     :: SYMMETRY_HORIZONTAL;
    ICON_SYMMETRY_VERTICAL       :: SYMMETRY_VERTICAL;
    ICON_LENS                    :: LENS;
    ICON_LENS_BIG                :: LENS_BIG;
    ICON_EYE_ON                  :: EYE_ON;
    ICON_EYE_OFF                 :: EYE_OFF;
    ICON_FILTER_TOP              :: FILTER_TOP;
    ICON_FILTER                  :: FILTER;
    ICON_TARGET_POINT            :: TARGET_POINT;
    ICON_TARGET_SMALL            :: TARGET_SMALL;
    ICON_TARGET_BIG              :: TARGET_BIG;
    ICON_TARGET_MOVE             :: TARGET_MOVE;
    ICON_CURSOR_MOVE             :: CURSOR_MOVE;
    ICON_CURSOR_SCALE            :: CURSOR_SCALE;
    ICON_CURSOR_SCALE_RIGHT      :: CURSOR_SCALE_RIGHT;
    ICON_CURSOR_SCALE_LEFT       :: CURSOR_SCALE_LEFT;
    ICON_UNDO                    :: UNDO;
    ICON_REDO                    :: REDO;
    ICON_REREDO                  :: REREDO;
    ICON_MUTATE                  :: MUTATE;
    ICON_ROTATE                  :: ROTATE;
    ICON_REPEAT                  :: REPEAT;
    ICON_SHUFFLE                 :: SHUFFLE;
    ICON_EMPTYBOX                :: EMPTYBOX;
    ICON_TARGET                  :: TARGET;
    ICON_TARGET_SMALL_FILL       :: TARGET_SMALL_FILL;
    ICON_TARGET_BIG_FILL         :: TARGET_BIG_FILL;
    ICON_TARGET_MOVE_FILL        :: TARGET_MOVE_FILL;
    ICON_CURSOR_MOVE_FILL        :: CURSOR_MOVE_FILL;
    ICON_CURSOR_SCALE_FILL       :: CURSOR_SCALE_FILL;
    ICON_CURSOR_SCALE_RIGHT_FILL :: CURSOR_SCALE_RIGHT_FILL;
    ICON_CURSOR_SCALE_LEFT_FILL  :: CURSOR_SCALE_LEFT_FILL;
    ICON_UNDO_FILL               :: UNDO_FILL;
    ICON_REDO_FILL               :: REDO_FILL;
    ICON_REREDO_FILL             :: REREDO_FILL;
    ICON_MUTATE_FILL             :: MUTATE_FILL;
    ICON_ROTATE_FILL             :: ROTATE_FILL;
    ICON_REPEAT_FILL             :: REPEAT_FILL;
    ICON_SHUFFLE_FILL            :: SHUFFLE_FILL;
    ICON_EMPTYBOX_SMALL          :: EMPTYBOX_SMALL;
    ICON_BOX                     :: BOX;
    ICON_BOX_TOP                 :: BOX_TOP;
    ICON_BOX_TOP_RIGHT           :: BOX_TOP_RIGHT;
    ICON_BOX_RIGHT               :: BOX_RIGHT;
    ICON_BOX_BOTTOM_RIGHT        :: BOX_BOTTOM_RIGHT;
    ICON_BOX_BOTTOM              :: BOX_BOTTOM;
    ICON_BOX_BOTTOM_LEFT         :: BOX_BOTTOM_LEFT;
    ICON_BOX_LEFT                :: BOX_LEFT;
    ICON_BOX_TOP_LEFT            :: BOX_TOP_LEFT;
    ICON_BOX_CENTER              :: BOX_CENTER;
    ICON_BOX_CIRCLE_MASK         :: BOX_CIRCLE_MASK;
    ICON_POT                     :: POT;
    ICON_ALPHA_MULTIPLY          :: ALPHA_MULTIPLY;
    ICON_ALPHA_CLEAR             :: ALPHA_CLEAR;
    ICON_DITHERING               :: DITHERING;
    ICON_MIPMAPS                 :: MIPMAPS;
    ICON_BOX_GRID                :: BOX_GRID;
    ICON_GRID                    :: GRID;
    ICON_BOX_CORNERS_SMALL       :: BOX_CORNERS_SMALL;
    ICON_BOX_CORNERS_BIG         :: BOX_CORNERS_BIG;
    ICON_FOUR_BOXES              :: FOUR_BOXES;
    ICON_GRID_FILL               :: GRID_FILL;
    ICON_BOX_MULTISIZE           :: BOX_MULTISIZE;
    ICON_ZOOM_SMALL              :: ZOOM_SMALL;
    ICON_ZOOM_MEDIUM             :: ZOOM_MEDIUM;
    ICON_ZOOM_BIG                :: ZOOM_BIG;
    ICON_ZOOM_ALL                :: ZOOM_ALL;
    ICON_ZOOM_CENTER             :: ZOOM_CENTER;
    ICON_BOX_DOTS_SMALL          :: BOX_DOTS_SMALL;
    ICON_BOX_DOTS_BIG            :: BOX_DOTS_BIG;
    ICON_BOX_CONCENTRIC          :: BOX_CONCENTRIC;
    ICON_BOX_GRID_BIG            :: BOX_GRID_BIG;
    ICON_OK_TICK                 :: OK_TICK;
    ICON_CROSS                   :: CROSS;
    ICON_ARROW_LEFT              :: ARROW_LEFT;
    ICON_ARROW_RIGHT             :: ARROW_RIGHT;
    ICON_ARROW_DOWN              :: ARROW_DOWN;
    ICON_ARROW_UP                :: ARROW_UP;
    ICON_ARROW_LEFT_FILL         :: ARROW_LEFT_FILL;
    ICON_ARROW_RIGHT_FILL        :: ARROW_RIGHT_FILL;
    ICON_ARROW_DOWN_FILL         :: ARROW_DOWN_FILL;
    ICON_ARROW_UP_FILL           :: ARROW_UP_FILL;
    ICON_AUDIO                   :: AUDIO;
    ICON_FX                      :: FX;
    ICON_WAVE                    :: WAVE;
    ICON_WAVE_SINUS              :: WAVE_SINUS;
    ICON_WAVE_SQUARE             :: WAVE_SQUARE;
    ICON_WAVE_TRIANGULAR         :: WAVE_TRIANGULAR;
    ICON_CROSS_SMALL             :: CROSS_SMALL;
    ICON_PLAYER_PREVIOUS         :: PLAYER_PREVIOUS;
    ICON_PLAYER_PLAY_BACK        :: PLAYER_PLAY_BACK;
    ICON_PLAYER_PLAY             :: PLAYER_PLAY;
    ICON_PLAYER_PAUSE            :: PLAYER_PAUSE;
    ICON_PLAYER_STOP             :: PLAYER_STOP;
    ICON_PLAYER_NEXT             :: PLAYER_NEXT;
    ICON_PLAYER_RECORD           :: PLAYER_RECORD;
    ICON_MAGNET                  :: MAGNET;
    ICON_LOCK_CLOSE              :: LOCK_CLOSE;
    ICON_LOCK_OPEN               :: LOCK_OPEN;
    ICON_CLOCK                   :: CLOCK;
    ICON_TOOLS                   :: TOOLS;
    ICON_GEAR                    :: GEAR;
    ICON_GEAR_BIG                :: GEAR_BIG;
    ICON_BIN                     :: BIN;
    ICON_HAND_POINTER            :: HAND_POINTER;
    ICON_LASER                   :: LASER;
    ICON_COIN                    :: COIN;
    ICON_EXPLOSION               :: EXPLOSION;
    ICON_1UP                     :: _1UP;
    ICON_PLAYER                  :: PLAYER;
    ICON_PLAYER_JUMP             :: PLAYER_JUMP;
    ICON_KEY                     :: KEY;
    ICON_DEMON                   :: DEMON;
    ICON_TEXT_POPUP              :: TEXT_POPUP;
    ICON_GEAR_EX                 :: GEAR_EX;
    ICON_CRACK                   :: CRACK;
    ICON_CRACK_POINTS            :: CRACK_POINTS;
    ICON_STAR                    :: STAR;
    ICON_DOOR                    :: DOOR;
    ICON_EXIT                    :: EXIT;
    ICON_MODE_2D                 :: MODE_2D;
    ICON_MODE_3D                 :: MODE_3D;
    ICON_CUBE                    :: CUBE;
    ICON_CUBE_FACE_TOP           :: CUBE_FACE_TOP;
    ICON_CUBE_FACE_LEFT          :: CUBE_FACE_LEFT;
    ICON_CUBE_FACE_FRONT         :: CUBE_FACE_FRONT;
    ICON_CUBE_FACE_BOTTOM        :: CUBE_FACE_BOTTOM;
    ICON_CUBE_FACE_RIGHT         :: CUBE_FACE_RIGHT;
    ICON_CUBE_FACE_BACK          :: CUBE_FACE_BACK;
    ICON_CAMERA                  :: CAMERA;
    ICON_SPECIAL                 :: SPECIAL;
    ICON_LINK_NET                :: LINK_NET;
    ICON_LINK_BOXES              :: LINK_BOXES;
    ICON_LINK_MULTI              :: LINK_MULTI;
    ICON_LINK                    :: LINK;
    ICON_LINK_BROKE              :: LINK_BROKE;
    ICON_TEXT_NOTES              :: TEXT_NOTES;
    ICON_NOTEBOOK                :: NOTEBOOK;
    ICON_SUITCASE                :: SUITCASE;
    ICON_SUITCASE_ZIP            :: SUITCASE_ZIP;
    ICON_MAILBOX                 :: MAILBOX;
    ICON_MONITOR                 :: MONITOR;
    ICON_PRINTER                 :: PRINTER;
    ICON_PHOTO_CAMERA            :: PHOTO_CAMERA;
    ICON_PHOTO_CAMERA_FLASH      :: PHOTO_CAMERA_FLASH;
    ICON_HOUSE                   :: HOUSE;
    ICON_HEART                   :: HEART;
    ICON_CORNER                  :: CORNER;
    ICON_VERTICAL_BARS           :: VERTICAL_BARS;
    ICON_VERTICAL_BARS_FILL      :: VERTICAL_BARS_FILL;
    ICON_LIFE_BARS               :: LIFE_BARS;
    ICON_INFO                    :: INFO;
    ICON_CROSSLINE               :: CROSSLINE;
    ICON_HELP                    :: HELP;
    ICON_FILETYPE_ALPHA          :: FILETYPE_ALPHA;
    ICON_FILETYPE_HOME           :: FILETYPE_HOME;
    ICON_LAYERS_VISIBLE          :: LAYERS_VISIBLE;
    ICON_LAYERS                  :: LAYERS;
    ICON_WINDOW                  :: WINDOW;
    ICON_HIDPI                   :: HIDPI;
    ICON_FILETYPE_BINARY         :: FILETYPE_BINARY;
    ICON_HEX                     :: HEX;
    ICON_SHIELD                  :: SHIELD;
    ICON_FILE_NEW                :: FILE_NEW;
    ICON_FOLDER_ADD              :: FOLDER_ADD;
    ICON_ALARM                   :: ALARM;
    ICON_CPU                     :: CPU;
    ICON_ROM                     :: ROM;
    ICON_STEP_OVER               :: STEP_OVER;
    ICON_STEP_INTO               :: STEP_INTO;
    ICON_STEP_OUT                :: STEP_OUT;
    ICON_RESTART                 :: RESTART;
    ICON_BREAKPOINT_ON           :: BREAKPOINT_ON;
    ICON_BREAKPOINT_OFF          :: BREAKPOINT_OFF;
    ICON_BURGER_MENU             :: BURGER_MENU;
    ICON_CASE_SENSITIVE          :: CASE_SENSITIVE;
    ICON_REG_EXP                 :: REG_EXP;
    ICON_FOLDER                  :: FOLDER;
    ICON_FILE                    :: FILE;
    ICON_SAND_TIMER              :: SAND_TIMER;
    ICON_220                     :: _220;
    ICON_221                     :: _221;
    ICON_222                     :: _222;
    ICON_223                     :: _223;
    ICON_224                     :: _224;
    ICON_225                     :: _225;
    ICON_226                     :: _226;
    ICON_227                     :: _227;
    ICON_228                     :: _228;
    ICON_229                     :: _229;
    ICON_230                     :: _230;
    ICON_231                     :: _231;
    ICON_232                     :: _232;
    ICON_233                     :: _233;
    ICON_234                     :: _234;
    ICON_235                     :: _235;
    ICON_236                     :: _236;
    ICON_237                     :: _237;
    ICON_238                     :: _238;
    ICON_239                     :: _239;
    ICON_240                     :: _240;
    ICON_241                     :: _241;
    ICON_242                     :: _242;
    ICON_243                     :: _243;
    ICON_244                     :: _244;
    ICON_245                     :: _245;
    ICON_246                     :: _246;
    ICON_247                     :: _247;
    ICON_248                     :: _248;
    ICON_249                     :: _249;
    ICON_250                     :: _250;
    ICON_251                     :: _251;
    ICON_252                     :: _252;
    ICON_253                     :: _253;
    ICON_254                     :: _254;
    ICON_255                     :: _255;
}

#scope_file

_/raygui :: #system_library "./raygui";
