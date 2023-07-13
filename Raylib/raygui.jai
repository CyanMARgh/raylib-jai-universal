//
// This file was auto-generated using the following command:
//
// jai generate.jai
//

RL :: #import,file "raylib.jai";
#import "Math";
using RL;

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
State :: enum s32 {
    NORMAL   :: 0;
    FOCUSED  :: 1;
    PRESSED  :: 2;
    DISABLED :: 3;
}
STATE_NORMAL   :: State.NORMAL;
STATE_FOCUSED  :: State.FOCUSED;
STATE_PRESSED  :: State.PRESSED;
STATE_DISABLED :: State.DISABLED;

// Gui control text alignment
TextAlignment :: enum s32 {
    LEFT   :: 0;
    CENTER :: 1;
    RIGHT  :: 2;
}
TEXT_ALIGN_LEFT   :: TextAlignment.LEFT;
TEXT_ALIGN_CENTER :: TextAlignment.CENTER;
TEXT_ALIGN_RIGHT  :: TextAlignment.RIGHT;

// Gui controls
Control :: enum s32 {
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
ControlProperty :: enum s32 {
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
DefaultProperty :: enum s32 {
    TEXT_SIZE         :: 16;
    TEXT_SPACING      :: 17;
    LINE_COLOR        :: 18;
    BACKGROUND_COLOR  :: 19;
    TEXT_LINE_SPACING :: 20;
}

// Toggle/ToggleGroup
ToggleProperty :: enum s32 {
    GROUP_PADDING :: 16;
}

// Slider/SliderBar
SliderProperty :: enum s32 {
    WIDTH   :: 16;
    PADDING :: 17;

    SLIDER_WIDTH   :: WIDTH;
    SLIDER_PADDING :: PADDING;
}

// ProgressBar
ProgressBarProperty :: enum s32 {
    PROGRESS_PADDING :: 16;
}

// ScrollBar
ScrollBarProperty :: enum s32 {
    ARROWS_SIZE           :: 16;
    ARROWS_VISIBLE        :: 17;
    SCROLL_SLIDER_PADDING :: 18;
    SCROLL_SLIDER_SIZE    :: 19;
    SCROLL_PADDING        :: 20;
    SCROLL_SPEED          :: 21;
}

// CheckBox
CheckBoxProperty :: enum s32 {
    CHECK_PADDING :: 16;
}

// ComboBox
ComboBoxProperty :: enum s32 {
    WIDTH   :: 16;
    SPACING :: 17;

    COMBO_BUTTON_WIDTH   :: WIDTH;
    COMBO_BUTTON_SPACING :: SPACING;
}

// DropdownBox
DropdownBoxProperty :: enum s32 {
    ARROW_PADDING          :: 16;
    DROPDOWN_ITEMS_SPACING :: 17;
}

// TextBox/TextBoxMulti/ValueBox/Spinner
TextBoxProperty :: enum s32 {
    INNER_PADDING      :: 16;
    LINES_SPACING      :: 17;
    ALIGNMENT_VERTICAL :: 18;
    MULTILINE          :: 19;
    WRAP_MODE          :: 20;
}
TEXT_INNER_PADDING      :: TextBoxProperty.INNER_PADDING;
TEXT_LINES_SPACING      :: TextBoxProperty.LINES_SPACING;
TEXT_ALIGNMENT_VERTICAL :: TextBoxProperty.ALIGNMENT_VERTICAL;
TEXT_MULTILINE          :: TextBoxProperty.MULTILINE;
TEXT_WRAP_MODE          :: TextBoxProperty.WRAP_MODE;

// Spinner
SpinnerProperty :: enum s32 {
    WIDTH   :: 16;
    SPACING :: 17;

    SPIN_BUTTON_WIDTH   :: WIDTH;
    SPIN_BUTTON_SPACING :: SPACING;
}

// ListView
ListViewProperty :: enum s32 {
    LIST_ITEMS_HEIGHT  :: 16;
    LIST_ITEMS_SPACING :: 17;
    SCROLLBAR_WIDTH    :: 18;
    SCROLLBAR_SIDE     :: 19;
}

// ColorPicker
ColorPickerProperty :: enum s32 {
    COLOR_SELECTOR_SIZE      :: 16;
    HUEBAR_WIDTH             :: 17;
    HUEBAR_PADDING           :: 18;
    HUEBAR_SELECTOR_HEIGHT   :: 19;
    HUEBAR_SELECTOR_OVERFLOW :: 20;
}

// Global gui state control functions
Enable :: () -> void #foreign raygui "GuiEnable";
Disable :: () -> void #foreign raygui "GuiDisable";
Lock :: () -> void #foreign raygui "GuiLock";
Unlock :: () -> void #foreign raygui "GuiUnlock";
IsLocked :: () -> bool #foreign raygui "GuiIsLocked";
Fade :: (alpha: float) -> void #foreign raygui "GuiFade";
SetState :: (state: State) -> void #foreign raygui "GuiSetState";
GetState :: () -> s32 #foreign raygui "GuiGetState";

// Font set/get functions
SetFont :: (font: Font) -> void #foreign raygui "GuiSetFont";
GetFont :: () -> Font #foreign raygui "GuiGetFont";

// Style set/get functions
SetStyle :: (control: Control, property: ControlProperty, value: s32) -> void #foreign raygui "GuiSetStyle";
GetStyle :: (control: Control, property: ControlProperty) -> u32 #foreign raygui "GuiGetStyle";

// Styles loading functions
LoadStyle :: (fileName: *u8) -> void #foreign raygui "GuiLoadStyle";
LoadStyleDefault :: () -> void #foreign raygui "GuiLoadStyleDefault";

// Tooltips management functions
EnableTooltip :: () -> void #foreign raygui "GuiEnableTooltip";
DisableTooltip :: () -> void #foreign raygui "GuiDisableTooltip";
SetTooltip :: (tooltip: *u8) -> void #foreign raygui "GuiSetTooltip";

// Icons functionality
IconText :: (iconId: IconName, text: *u8) -> *u8 #foreign raygui "GuiIconText";

SetIconScale :: (scale: s32) -> void #foreign raygui "GuiSetIconScale";
GetIcons :: () -> *u32 #foreign raygui "GuiGetIcons";
LoadIcons :: (fileName: *u8, loadIconsName: bool) -> **u8 #foreign raygui "GuiLoadIcons";
DrawIcon :: (iconId: s32, posX: s32, posY: s32, pixelSize: s32, color: Color) -> void #foreign raygui "GuiDrawIcon";

// Controls
//----------------------------------------------------------------------------------------------------------
// Container/separator controls, useful for controls organization
WindowBox :: (bounds: Rectangle, title: *u8) -> s32 #foreign raygui "GuiWindowBox";
GroupBox :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui "GuiGroupBox";
Line :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui "GuiLine";
Panel :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui "GuiPanel";
TabBar :: (bounds: Rectangle, text: **u8, count: s32, active: *s32) -> s32 #foreign raygui "GuiTabBar";
ScrollPanel :: (bounds: Rectangle, text: *u8, content: Rectangle, scroll: *Vector2, view: *Rectangle) -> s32 #foreign raygui "GuiScrollPanel";

// Basic controls set
Label :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui "GuiLabel";
Button :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui "GuiButton";
LabelButton :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui "GuiLabelButton";
Toggle :: (bounds: Rectangle, text: *u8, active: *bool) -> s32 #foreign raygui "GuiToggle";
ToggleGroup :: (bounds: Rectangle, text: *u8, active: *s32) -> s32 #foreign raygui "GuiToggleGroup";
CheckBox :: (bounds: Rectangle, text: *u8, checked: *bool) -> s32 #foreign raygui "GuiCheckBox";
ComboBox :: (bounds: Rectangle, text: *u8, active: *s32) -> s32 #foreign raygui "GuiComboBox";

DropdownBox :: (bounds: Rectangle, text: *u8, active: *s32, editMode: bool) -> s32 #foreign raygui "GuiDropdownBox";
Spinner :: (bounds: Rectangle, text: *u8, value: *s32, minValue: s32, maxValue: s32, editMode: bool) -> s32 #foreign raygui "GuiSpinner";
ValueBox :: (bounds: Rectangle, text: *u8, value: *s32, minValue: s32, maxValue: s32, editMode: bool) -> s32 #foreign raygui "GuiValueBox";
TextBox :: (bounds: Rectangle, text: *u8, textSize: s32, editMode: bool) -> s32 #foreign raygui "GuiTextBox";

Slider :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign raygui "GuiSlider";
SliderBar :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign raygui "GuiSliderBar";
ProgressBar :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign raygui "GuiProgressBar";
StatusBar :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui "GuiStatusBar";
DummyRec :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui "GuiDummyRec";
Grid :: (bounds: Rectangle, text: *u8, spacing: float, subdivs: s32, mouseCell: *Vector2) -> s32 #foreign raygui "GuiGrid";

// Advance controls set
ListView :: (bounds: Rectangle, text: *u8, scrollIndex: *s32, active: *s32) -> s32 #foreign raygui "GuiListView";
ListViewEx :: (bounds: Rectangle, text: **u8, count: s32, scrollIndex: *s32, active: *s32, focus: *s32) -> s32 #foreign raygui "GuiListViewEx";
MessageBox :: (bounds: Rectangle, title: *u8, message: *u8, buttons: *u8) -> s32 #foreign raygui "GuiMessageBox";
TextInputBox :: (bounds: Rectangle, title: *u8, message: *u8, buttons: *u8, text: *u8, textMaxSize: s32, secretViewActive: *bool) -> s32 #foreign raygui "GuiTextInputBox";
ColorPicker :: (bounds: Rectangle, text: *u8, color: *Color) -> s32 #foreign raygui "GuiColorPicker";
ColorPanel :: (bounds: Rectangle, text: *u8, color: *Color) -> s32 #foreign raygui "GuiColorPanel";
ColorBarAlpha :: (bounds: Rectangle, text: *u8, alpha: *float) -> s32 #foreign raygui "GuiColorBarAlpha";
ColorBarHue :: (bounds: Rectangle, text: *u8, value: *float) -> s32 #foreign raygui "GuiColorBarHue";
ColorPickerHSV :: (bounds: Rectangle, text: *u8, colorHsv: *Vector3) -> s32 #foreign raygui "GuiColorPickerHSV";
ColorPanelHSV :: (bounds: Rectangle, text: *u8, colorHsv: *Vector3) -> s32 #foreign raygui "GuiColorPanelHSV";

//----------------------------------------------------------------------------------
// Icons enumeration
//----------------------------------------------------------------------------------
IconName :: enum s32 {
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
}
ICON_NONE                    :: IconName.NONE;
ICON_FOLDER_FILE_OPEN        :: IconName.FOLDER_FILE_OPEN;
ICON_FILE_SAVE_CLASSIC       :: IconName.FILE_SAVE_CLASSIC;
ICON_FOLDER_OPEN             :: IconName.FOLDER_OPEN;
ICON_FOLDER_SAVE             :: IconName.FOLDER_SAVE;
ICON_FILE_OPEN               :: IconName.FILE_OPEN;
ICON_FILE_SAVE               :: IconName.FILE_SAVE;
ICON_FILE_EXPORT             :: IconName.FILE_EXPORT;
ICON_FILE_ADD                :: IconName.FILE_ADD;
ICON_FILE_DELETE             :: IconName.FILE_DELETE;
ICON_FILETYPE_TEXT           :: IconName.FILETYPE_TEXT;
ICON_FILETYPE_AUDIO          :: IconName.FILETYPE_AUDIO;
ICON_FILETYPE_IMAGE          :: IconName.FILETYPE_IMAGE;
ICON_FILETYPE_PLAY           :: IconName.FILETYPE_PLAY;
ICON_FILETYPE_VIDEO          :: IconName.FILETYPE_VIDEO;
ICON_FILETYPE_INFO           :: IconName.FILETYPE_INFO;
ICON_FILE_COPY               :: IconName.FILE_COPY;
ICON_FILE_CUT                :: IconName.FILE_CUT;
ICON_FILE_PASTE              :: IconName.FILE_PASTE;
ICON_CURSOR_HAND             :: IconName.CURSOR_HAND;
ICON_CURSOR_POINTER          :: IconName.CURSOR_POINTER;
ICON_CURSOR_CLASSIC          :: IconName.CURSOR_CLASSIC;
ICON_PENCIL                  :: IconName.PENCIL;
ICON_PENCIL_BIG              :: IconName.PENCIL_BIG;
ICON_BRUSH_CLASSIC           :: IconName.BRUSH_CLASSIC;
ICON_BRUSH_PAINTER           :: IconName.BRUSH_PAINTER;
ICON_WATER_DROP              :: IconName.WATER_DROP;
ICON_COLOR_PICKER            :: IconName.COLOR_PICKER;
ICON_RUBBER                  :: IconName.RUBBER;
ICON_COLOR_BUCKET            :: IconName.COLOR_BUCKET;
ICON_TEXT_T                  :: IconName.TEXT_T;
ICON_TEXT_A                  :: IconName.TEXT_A;
ICON_SCALE                   :: IconName.SCALE;
ICON_RESIZE                  :: IconName.RESIZE;
ICON_FILTER_POINT            :: IconName.FILTER_POINT;
ICON_FILTER_BILINEAR         :: IconName.FILTER_BILINEAR;
ICON_CROP                    :: IconName.CROP;
ICON_CROP_ALPHA              :: IconName.CROP_ALPHA;
ICON_SQUARE_TOGGLE           :: IconName.SQUARE_TOGGLE;
ICON_SYMMETRY                :: IconName.SYMMETRY;
ICON_SYMMETRY_HORIZONTAL     :: IconName.SYMMETRY_HORIZONTAL;
ICON_SYMMETRY_VERTICAL       :: IconName.SYMMETRY_VERTICAL;
ICON_LENS                    :: IconName.LENS;
ICON_LENS_BIG                :: IconName.LENS_BIG;
ICON_EYE_ON                  :: IconName.EYE_ON;
ICON_EYE_OFF                 :: IconName.EYE_OFF;
ICON_FILTER_TOP              :: IconName.FILTER_TOP;
ICON_FILTER                  :: IconName.FILTER;
ICON_TARGET_POINT            :: IconName.TARGET_POINT;
ICON_TARGET_SMALL            :: IconName.TARGET_SMALL;
ICON_TARGET_BIG              :: IconName.TARGET_BIG;
ICON_TARGET_MOVE             :: IconName.TARGET_MOVE;
ICON_CURSOR_MOVE             :: IconName.CURSOR_MOVE;
ICON_CURSOR_SCALE            :: IconName.CURSOR_SCALE;
ICON_CURSOR_SCALE_RIGHT      :: IconName.CURSOR_SCALE_RIGHT;
ICON_CURSOR_SCALE_LEFT       :: IconName.CURSOR_SCALE_LEFT;
ICON_UNDO                    :: IconName.UNDO;
ICON_REDO                    :: IconName.REDO;
ICON_REREDO                  :: IconName.REREDO;
ICON_MUTATE                  :: IconName.MUTATE;
ICON_ROTATE                  :: IconName.ROTATE;
ICON_REPEAT                  :: IconName.REPEAT;
ICON_SHUFFLE                 :: IconName.SHUFFLE;
ICON_EMPTYBOX                :: IconName.EMPTYBOX;
ICON_TARGET                  :: IconName.TARGET;
ICON_TARGET_SMALL_FILL       :: IconName.TARGET_SMALL_FILL;
ICON_TARGET_BIG_FILL         :: IconName.TARGET_BIG_FILL;
ICON_TARGET_MOVE_FILL        :: IconName.TARGET_MOVE_FILL;
ICON_CURSOR_MOVE_FILL        :: IconName.CURSOR_MOVE_FILL;
ICON_CURSOR_SCALE_FILL       :: IconName.CURSOR_SCALE_FILL;
ICON_CURSOR_SCALE_RIGHT_FILL :: IconName.CURSOR_SCALE_RIGHT_FILL;
ICON_CURSOR_SCALE_LEFT_FILL  :: IconName.CURSOR_SCALE_LEFT_FILL;
ICON_UNDO_FILL               :: IconName.UNDO_FILL;
ICON_REDO_FILL               :: IconName.REDO_FILL;
ICON_REREDO_FILL             :: IconName.REREDO_FILL;
ICON_MUTATE_FILL             :: IconName.MUTATE_FILL;
ICON_ROTATE_FILL             :: IconName.ROTATE_FILL;
ICON_REPEAT_FILL             :: IconName.REPEAT_FILL;
ICON_SHUFFLE_FILL            :: IconName.SHUFFLE_FILL;
ICON_EMPTYBOX_SMALL          :: IconName.EMPTYBOX_SMALL;
ICON_BOX                     :: IconName.BOX;
ICON_BOX_TOP                 :: IconName.BOX_TOP;
ICON_BOX_TOP_RIGHT           :: IconName.BOX_TOP_RIGHT;
ICON_BOX_RIGHT               :: IconName.BOX_RIGHT;
ICON_BOX_BOTTOM_RIGHT        :: IconName.BOX_BOTTOM_RIGHT;
ICON_BOX_BOTTOM              :: IconName.BOX_BOTTOM;
ICON_BOX_BOTTOM_LEFT         :: IconName.BOX_BOTTOM_LEFT;
ICON_BOX_LEFT                :: IconName.BOX_LEFT;
ICON_BOX_TOP_LEFT            :: IconName.BOX_TOP_LEFT;
ICON_BOX_CENTER              :: IconName.BOX_CENTER;
ICON_BOX_CIRCLE_MASK         :: IconName.BOX_CIRCLE_MASK;
ICON_POT                     :: IconName.POT;
ICON_ALPHA_MULTIPLY          :: IconName.ALPHA_MULTIPLY;
ICON_ALPHA_CLEAR             :: IconName.ALPHA_CLEAR;
ICON_DITHERING               :: IconName.DITHERING;
ICON_MIPMAPS                 :: IconName.MIPMAPS;
ICON_BOX_GRID                :: IconName.BOX_GRID;
ICON_GRID                    :: IconName.GRID;
ICON_BOX_CORNERS_SMALL       :: IconName.BOX_CORNERS_SMALL;
ICON_BOX_CORNERS_BIG         :: IconName.BOX_CORNERS_BIG;
ICON_FOUR_BOXES              :: IconName.FOUR_BOXES;
ICON_GRID_FILL               :: IconName.GRID_FILL;
ICON_BOX_MULTISIZE           :: IconName.BOX_MULTISIZE;
ICON_ZOOM_SMALL              :: IconName.ZOOM_SMALL;
ICON_ZOOM_MEDIUM             :: IconName.ZOOM_MEDIUM;
ICON_ZOOM_BIG                :: IconName.ZOOM_BIG;
ICON_ZOOM_ALL                :: IconName.ZOOM_ALL;
ICON_ZOOM_CENTER             :: IconName.ZOOM_CENTER;
ICON_BOX_DOTS_SMALL          :: IconName.BOX_DOTS_SMALL;
ICON_BOX_DOTS_BIG            :: IconName.BOX_DOTS_BIG;
ICON_BOX_CONCENTRIC          :: IconName.BOX_CONCENTRIC;
ICON_BOX_GRID_BIG            :: IconName.BOX_GRID_BIG;
ICON_OK_TICK                 :: IconName.OK_TICK;
ICON_CROSS                   :: IconName.CROSS;
ICON_ARROW_LEFT              :: IconName.ARROW_LEFT;
ICON_ARROW_RIGHT             :: IconName.ARROW_RIGHT;
ICON_ARROW_DOWN              :: IconName.ARROW_DOWN;
ICON_ARROW_UP                :: IconName.ARROW_UP;
ICON_ARROW_LEFT_FILL         :: IconName.ARROW_LEFT_FILL;
ICON_ARROW_RIGHT_FILL        :: IconName.ARROW_RIGHT_FILL;
ICON_ARROW_DOWN_FILL         :: IconName.ARROW_DOWN_FILL;
ICON_ARROW_UP_FILL           :: IconName.ARROW_UP_FILL;
ICON_AUDIO                   :: IconName.AUDIO;
ICON_FX                      :: IconName.FX;
ICON_WAVE                    :: IconName.WAVE;
ICON_WAVE_SINUS              :: IconName.WAVE_SINUS;
ICON_WAVE_SQUARE             :: IconName.WAVE_SQUARE;
ICON_WAVE_TRIANGULAR         :: IconName.WAVE_TRIANGULAR;
ICON_CROSS_SMALL             :: IconName.CROSS_SMALL;
ICON_PLAYER_PREVIOUS         :: IconName.PLAYER_PREVIOUS;
ICON_PLAYER_PLAY_BACK        :: IconName.PLAYER_PLAY_BACK;
ICON_PLAYER_PLAY             :: IconName.PLAYER_PLAY;
ICON_PLAYER_PAUSE            :: IconName.PLAYER_PAUSE;
ICON_PLAYER_STOP             :: IconName.PLAYER_STOP;
ICON_PLAYER_NEXT             :: IconName.PLAYER_NEXT;
ICON_PLAYER_RECORD           :: IconName.PLAYER_RECORD;
ICON_MAGNET                  :: IconName.MAGNET;
ICON_LOCK_CLOSE              :: IconName.LOCK_CLOSE;
ICON_LOCK_OPEN               :: IconName.LOCK_OPEN;
ICON_CLOCK                   :: IconName.CLOCK;
ICON_TOOLS                   :: IconName.TOOLS;
ICON_GEAR                    :: IconName.GEAR;
ICON_GEAR_BIG                :: IconName.GEAR_BIG;
ICON_BIN                     :: IconName.BIN;
ICON_HAND_POINTER            :: IconName.HAND_POINTER;
ICON_LASER                   :: IconName.LASER;
ICON_COIN                    :: IconName.COIN;
ICON_EXPLOSION               :: IconName.EXPLOSION;
ICON_1UP                     :: IconName._1UP;
ICON_PLAYER                  :: IconName.PLAYER;
ICON_PLAYER_JUMP             :: IconName.PLAYER_JUMP;
ICON_KEY                     :: IconName.KEY;
ICON_DEMON                   :: IconName.DEMON;
ICON_TEXT_POPUP              :: IconName.TEXT_POPUP;
ICON_GEAR_EX                 :: IconName.GEAR_EX;
ICON_CRACK                   :: IconName.CRACK;
ICON_CRACK_POINTS            :: IconName.CRACK_POINTS;
ICON_STAR                    :: IconName.STAR;
ICON_DOOR                    :: IconName.DOOR;
ICON_EXIT                    :: IconName.EXIT;
ICON_MODE_2D                 :: IconName.MODE_2D;
ICON_MODE_3D                 :: IconName.MODE_3D;
ICON_CUBE                    :: IconName.CUBE;
ICON_CUBE_FACE_TOP           :: IconName.CUBE_FACE_TOP;
ICON_CUBE_FACE_LEFT          :: IconName.CUBE_FACE_LEFT;
ICON_CUBE_FACE_FRONT         :: IconName.CUBE_FACE_FRONT;
ICON_CUBE_FACE_BOTTOM        :: IconName.CUBE_FACE_BOTTOM;
ICON_CUBE_FACE_RIGHT         :: IconName.CUBE_FACE_RIGHT;
ICON_CUBE_FACE_BACK          :: IconName.CUBE_FACE_BACK;
ICON_CAMERA                  :: IconName.CAMERA;
ICON_SPECIAL                 :: IconName.SPECIAL;
ICON_LINK_NET                :: IconName.LINK_NET;
ICON_LINK_BOXES              :: IconName.LINK_BOXES;
ICON_LINK_MULTI              :: IconName.LINK_MULTI;
ICON_LINK                    :: IconName.LINK;
ICON_LINK_BROKE              :: IconName.LINK_BROKE;
ICON_TEXT_NOTES              :: IconName.TEXT_NOTES;
ICON_NOTEBOOK                :: IconName.NOTEBOOK;
ICON_SUITCASE                :: IconName.SUITCASE;
ICON_SUITCASE_ZIP            :: IconName.SUITCASE_ZIP;
ICON_MAILBOX                 :: IconName.MAILBOX;
ICON_MONITOR                 :: IconName.MONITOR;
ICON_PRINTER                 :: IconName.PRINTER;
ICON_PHOTO_CAMERA            :: IconName.PHOTO_CAMERA;
ICON_PHOTO_CAMERA_FLASH      :: IconName.PHOTO_CAMERA_FLASH;
ICON_HOUSE                   :: IconName.HOUSE;
ICON_HEART                   :: IconName.HEART;
ICON_CORNER                  :: IconName.CORNER;
ICON_VERTICAL_BARS           :: IconName.VERTICAL_BARS;
ICON_VERTICAL_BARS_FILL      :: IconName.VERTICAL_BARS_FILL;
ICON_LIFE_BARS               :: IconName.LIFE_BARS;
ICON_INFO                    :: IconName.INFO;
ICON_CROSSLINE               :: IconName.CROSSLINE;
ICON_HELP                    :: IconName.HELP;
ICON_FILETYPE_ALPHA          :: IconName.FILETYPE_ALPHA;
ICON_FILETYPE_HOME           :: IconName.FILETYPE_HOME;
ICON_LAYERS_VISIBLE          :: IconName.LAYERS_VISIBLE;
ICON_LAYERS                  :: IconName.LAYERS;
ICON_WINDOW                  :: IconName.WINDOW;
ICON_HIDPI                   :: IconName.HIDPI;
ICON_FILETYPE_BINARY         :: IconName.FILETYPE_BINARY;
ICON_HEX                     :: IconName.HEX;
ICON_SHIELD                  :: IconName.SHIELD;
ICON_FILE_NEW                :: IconName.FILE_NEW;
ICON_FOLDER_ADD              :: IconName.FOLDER_ADD;
ICON_ALARM                   :: IconName.ALARM;
ICON_CPU                     :: IconName.CPU;
ICON_ROM                     :: IconName.ROM;
ICON_STEP_OVER               :: IconName.STEP_OVER;
ICON_STEP_INTO               :: IconName.STEP_INTO;
ICON_STEP_OUT                :: IconName.STEP_OUT;
ICON_RESTART                 :: IconName.RESTART;
ICON_BREAKPOINT_ON           :: IconName.BREAKPOINT_ON;
ICON_BREAKPOINT_OFF          :: IconName.BREAKPOINT_OFF;
ICON_BURGER_MENU             :: IconName.BURGER_MENU;
ICON_CASE_SENSITIVE          :: IconName.CASE_SENSITIVE;
ICON_REG_EXP                 :: IconName.REG_EXP;
ICON_FOLDER                  :: IconName.FOLDER;
ICON_FILE                    :: IconName.FILE;
ICON_SAND_TIMER              :: IconName.SAND_TIMER;
ICON_220                     :: IconName._220;
ICON_221                     :: IconName._221;
ICON_222                     :: IconName._222;
ICON_223                     :: IconName._223;
ICON_224                     :: IconName._224;
ICON_225                     :: IconName._225;
ICON_226                     :: IconName._226;
ICON_227                     :: IconName._227;
ICON_228                     :: IconName._228;
ICON_229                     :: IconName._229;
ICON_230                     :: IconName._230;
ICON_231                     :: IconName._231;
ICON_232                     :: IconName._232;
ICON_233                     :: IconName._233;
ICON_234                     :: IconName._234;
ICON_235                     :: IconName._235;
ICON_236                     :: IconName._236;
ICON_237                     :: IconName._237;
ICON_238                     :: IconName._238;
ICON_239                     :: IconName._239;
ICON_240                     :: IconName._240;
ICON_241                     :: IconName._241;
ICON_242                     :: IconName._242;
ICON_243                     :: IconName._243;
ICON_244                     :: IconName._244;
ICON_245                     :: IconName._245;
ICON_246                     :: IconName._246;
ICON_247                     :: IconName._247;
ICON_248                     :: IconName._248;
ICON_249                     :: IconName._249;
ICON_250                     :: IconName._250;
ICON_251                     :: IconName._251;
ICON_252                     :: IconName._252;
ICON_253                     :: IconName._253;
ICON_254                     :: IconName._254;
ICON_255                     :: IconName._255;

#scope_file
#if OS == .LINUX {
    raygui :: #library,no_dll "linux/raygui";
} else #if OS == .WINDOWS {
    // raygui :: #library,no_dll "windows/librayguidll";
    raygui :: #library "windows/librayguidll";
}


