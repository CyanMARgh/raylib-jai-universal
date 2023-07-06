#import "Math";
#import,dir "Raylib";
#import "Basic";

// to_c_str_arr :: (lines : []string) -> **u8 {

// }

main :: () {
	screenWidth, screenHeight :: 690, 560;

	RL.InitWindow(screenWidth, screenHeight, "raygui - controls test suite");
	RL.SetExitKey(0);

	dropdownBox000Active :s32= 0;
	dropDown000EditMode := false;

	dropdownBox001Active :s32= 0;
	dropDown001EditMode := false;

	spinner001Value : s32 = 0;
	spinnerEditMode := false;

	valueBox002Value : s32 = 0;
	valueBoxEditMode := false;

	textBoxText : [64]u8;
	textBoxEditMode := false;

	listViewScrollIndex :s32= 0;
	listViewActive :s32= -1;

	listViewExScrollIndex :s32= 0;
	listViewExActive :s32= 2;
	listViewExFocus :s32= -1;
	listViewExList := *u8.["This", "is", "a", "list view", "with", "disable", "elements", "amazing!"];

	multiTextBoxText := "Multi text box";
	multiTextBoxEditMode := false;
	colorPickerValue := RL.RED;

	sliderValue :float= 50;
	sliderBarValue :float= 60;
	progressValue := 0.4;

	forceSquaredChecked := false;

	alphaValue := 0.5;

	comboBoxActive :s32= 1;

	toggleGroupActive :s32= 0;

	viewScroll := Vector2.{0, 0};

	exitWindow := false;
	showMessageBox := false;

	textInput : [100]u8;
	showTextInputBox := false;

	textInputFileName : [100]u8;

	RL.SetTargetFPS(60);
	while !exitWindow {
		exitWindow = RL.WindowShouldClose();
		if(RL.IsKeyPressed(RL.KEY_ESCAPE)) showMessageBox = !showMessageBox;
		if(RL.IsKeyDown(RL.KEY_LEFT_CONTROL) && RL.IsKeyPressed(RL.KEY_S)) showTextInputBox = true;
		if(GUI.IsFileDropped()) {
		    dropFileCount := 0;
		    droppedFiles := GUI.LoadDroppedFiles();

		    if ((dropFileCount > 0) && IsFileExtension(droppedFiles.paths[0], ".rgs".data)) GUI.LoadStyle(droppedFiles.paths[0]);

		    GUI.UnloadDroppedFiles(droppedFiles);
		}
		RL.BeginDrawing();
			RL.ClearBackground(RL.GetColor(GUI.GetStyle(.DEFAULT, xx GUI.DefaultProperty.BACKGROUND_COLOR)));

			if (dropDown000EditMode || dropDown001EditMode) GUI.Lock();
			else if (!dropDown000EditMode && !dropDown001EditMode) GUI.Unlock();

			GUI.CheckBox(RL.Rectangle.{25, 108, 15, 15}, temp_c_string("FORCE CHECK!"), *forceSquaredChecked);

			GUI.SetStyle(.TEXTBOX, .TEXT_ALIGNMENT, xx GUI.TEXT_ALIGN_CENTER);
			if (GUI.Spinner(RL.Rectangle.{25, 135, 125, 30}, null, *spinner001Value, 0, 100, spinnerEditMode)) spinnerEditMode = !spinnerEditMode;
			if (GUI.ValueBox(RL.Rectangle.{25, 175, 125, 30}, null, *valueBox002Value, 0, 100, valueBoxEditMode)) valueBoxEditMode = !valueBoxEditMode;
			GUI.SetStyle(.TEXTBOX, .TEXT_ALIGNMENT, xx GUI.TEXT_ALIGN_LEFT);
			// if (GUI.TextBox(Rectangle.{25, 215, 125, 30}, textBoxText.data, 64, textBoxEditMode)) textBoxEditMode = !textBoxEditMode;

			GUI.SetStyle(.BUTTON, .TEXT_ALIGNMENT, xx GUI.TEXT_ALIGN_CENTER);
			if (GUI.Button(RL.Rectangle.{25, 255, 125, 30}, GUI.IconText(xx GUI.ICON_FILE_SAVE, "Save File"))) showTextInputBox = true;

			GUI.GroupBox(RL.Rectangle.{25, 310, 125, 150}, "STATES");
			GUI.Lock();
				GUI.SetState(.NORMAL); if (GUI.Button(RL.Rectangle.{30, 320, 115, 30}, "NORMAL")) { }
				GUI.SetState(.FOCUSED); if (GUI.Button(RL.Rectangle.{30, 355, 115, 30}, "FOCUSED")) { }
				GUI.SetState(.PRESSED); if (GUI.Button(RL.Rectangle.{30, 390, 115, 30}, "#15#PRESSED")) { }
				GUI.SetState(.DISABLED); if (GUI.Button(RL.Rectangle.{30, 425, 115, 30}, "DISABLED")) { }
				GUI.SetState(.NORMAL);
			GUI.Unlock();

			GUI.ComboBox(RL.Rectangle.{25, 470, 125, 30}, "ONE;TWO;THREE;FOUR", *comboBoxActive);

			GUI.SetStyle(.DROPDOWNBOX, .TEXT_ALIGNMENT, xx GUI.TEXT_ALIGN_LEFT);
			if (GUI.DropdownBox(RL.Rectangle.{25, 65, 125, 30}, "#01#ONE;#02#TWO;#03#THREE;#04#FOUR", *dropdownBox001Active, dropDown001EditMode)) dropDown001EditMode = !dropDown001EditMode;

			GUI.SetStyle(.DROPDOWNBOX, .TEXT_ALIGNMENT, xx GUI.TEXT_ALIGN_CENTER);
			if (GUI.DropdownBox(RL.Rectangle.{25, 25, 125, 30}, "ONE;TWO;THREE", *dropdownBox000Active, dropDown000EditMode)) dropDown000EditMode = !dropDown000EditMode;

			GUI.ListView(RL.Rectangle.{165, 25, 140, 140}, "Charmander;Bulbasaur;#18#Squirtel;Pikachu;Eevee;Pidgey", *listViewScrollIndex, *listViewActive);
			GUI.ListViewEx(RL.Rectangle.{165, 180, 140, 200}, listViewExList.data, 8, *listViewExFocus, *listViewExScrollIndex, *listViewExActive);

			GUI.ToggleGroup(RL.Rectangle.{165, 400, 140, 25}, "#1#ONE\n#3#TWO\n#8#THREE\n#23#", *toggleGroupActive);

			GUI.ColorPicker(RL.Rectangle.{320, 185, 196, 192}, "color picker", *colorPickerValue);

			GUI.Slider(RL.Rectangle.{355, 400, 165, 20}, "TEST", RL.TextFormat("%", cast(float)sliderValue), *sliderValue, -50, 100);
			GUI.SliderBar(RL.Rectangle.{320, 430, 200, 20}, null, RL.TextFormat("%", cast(int)sliderBarValue), *sliderBarValue, 0, 100);
			GUI.ProgressBar(RL.Rectangle.{320, 460, 200, 20}, null, null, *progressValue, 0, 1);

			view : RL.Rectangle;
			GUI.ScrollPanel(RL.Rectangle.{560, 25, 100, 160}, "scroll panel", RL.Rectangle.{560, 25, 200, 400}, *viewScroll, *view);

			GUI.StatusBar(RL.Rectangle.{0, xx(RL.GetScreenHeight() - 20), xx RL.GetScreenWidth(), 20}, "This is a status bar");

			GUI.ColorBarAlpha(RL.Rectangle.{320, 490, 200, 30}, "colorbaralpha", *alphaValue);

			if (showMessageBox) {
			    RL.DrawRectangle(0, 0, xx GetScreenWidth(), xx GetScreenHeight(), RL.Fade(RAYWHITE, 0.8));
			    result := GUI.MessageBox(RL.Rectangle.{xx (GetScreenWidth()/2 - 125), xx(GetScreenHeight()/2 - 50), 250, 100}, GUI.IconText(.EXIT, "Close Window"), "Do you really want to exit?", "Yes;No");

			    if ((result == 0) || (result == 2)) showMessageBox = false;
			    else if (result == 1) exitWindow = true;
			}

			if (showTextInputBox) {
			    RL.DrawRectangle(0, 0, xx RL.GetScreenWidth(), xx RL.GetScreenHeight(), RL.Fade(RAYWHITE, 0.8));
			    secretViewActive : bool;
			    result := GUI.TextInputBox(
			    	RL.Rectangle.{xx(GetScreenWidth()/2 - 120), xx(GetScreenHeight()/2 - 60), 240, 140},
			    	GUI.IconText(.FILE_SAVE, "Save file as..."),
			    	"Introduce a save file name",
			    	"Ok;Cancel",
			    	textInput.data,
			    	100, 
			    	*secretViewActive
			    );

			    if (result == 1) {
			        textInputFileName = textInput;
			    }

			    if ((result == 0) || (result == 1) || (result == 2)) {
			        showTextInputBox = false;
			        for textInput it = 0;
			    }
			}
		RL.EndDrawing();
	}
	RL.CloseWindow();
}