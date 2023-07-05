COMPILE       :: true;
RAYGUI_PATH :: "src";

DECLARATIONS_TO_OMIT :: string.[
	// In module.jai, we import these from Math module
	// "Vector2",
	// "Vector3",
	// "Vector4",
	// "Quaternion",
	// "PI"
];

#run {
	set_build_options_dc(.{do_output = false});

	output_filename: string;
	opts: Generate_Bindings_Options;
	{
		using opts;

		strip_flags = 0;
		generate_compile_time_struct_checks = false;
		visitor = raygui_visitor;

		array_add(*libnames, "raygui");
		array_add(*source_files,  ..string.["src/raygui.c"]);
		array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);
		// array_add(*extra_clang_arguments, "-x", "c");

        array_add(*libpaths, "linux");
        output_filename = "raygui_linux.jai";
	}

	generate_bindings(opts, output_filename);
}

raygui_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
	if !parent_decl {
        if array_find(DECLARATIONS_TO_OMIT, decl.name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
    }

    if begins_with(decl.name, "Gui") {
        new_decl_name := decl.name;
        new_decl_name.data += 3;
        new_decl_name.count -= 3;
        decl.output_name = new_decl_name; 
    }

    return .RECURSE;
}

#import "Basic";
#import "Bindings_Generator";
#import "Compiler";
#import "File";
#import "String";