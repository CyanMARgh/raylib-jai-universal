COMPILE       :: true;
COMPILE_DEBUG :: true;
GENERATE_BINDINGS :: true;

RAYLIB_PATH :: "src";

DECLARATIONS_TO_OMIT :: string.[
    // In module.jai, we import these from Math module
    "Vector2",
    "Vector3",
    "Vector4",
    "Quaternion",
    "PI",

    // These repeat themself both in rlgl.h and in raylib.h without "rl" preffix.
    "rlBlendMode",
    "rlTextureFilter",
    "rlPixelFormat",
    "rlShaderAttributeDataType",
    "rlShaderUniformDataType",
    "rlShaderLocationIndex",
    "rlTraceLogLevel",
];

#run {
	set_build_options_dc(.{do_output = false}); // Don't build this into executable

	#if COMPILE {
        #import "BuildCpp";

        raylib_src_files: [..] string;
        array_add(*raylib_src_files, tprint("%/src/raudio.c",    RAYLIB_PATH));
        array_add(*raylib_src_files, tprint("%/src/rcore.c",     RAYLIB_PATH));
        array_add(*raylib_src_files, tprint("%/src/rmodels.c",   RAYLIB_PATH));
        array_add(*raylib_src_files, tprint("%/src/rshapes.c",   RAYLIB_PATH));
        array_add(*raylib_src_files, tprint("%/src/rtext.c",     RAYLIB_PATH));
        array_add(*raylib_src_files, tprint("%/src/rtextures.c", RAYLIB_PATH));
        array_add(*raylib_src_files, tprint("%/src/utils.c",     RAYLIB_PATH));
        array_add(*raylib_src_files, tprint("%/src/rglfw.c",     RAYLIB_PATH));

        success := true;
        #if OS == .WINDOWS {
            make_directory_if_it_does_not_exist("windows");

        	// TODO: /D _CRT_SECURE_NO_WARNINGS
        	raylib_flags: [..] string;
        	array_add(*raylib_flags, ..string.["/D_DEFAULT_SOURCE", "/DPLATFORM_DESKTOP", "/DGRAPHICS_API_OPENGL_33"]);
        	array_add(*raylib_flags, ..string.["/Isrc\\src", "/Isrc\\src\\external\\glfw\\include"]);
        	#if COMPILE_DEBUG {
        		array_add(*raylib_flags, ..string.["/std:c11", "/Od", "/Zi", "/utf-8", "/validate-charset", "/EHsc", "/w"]);
        	} else {
        		array_add(*raylib_flags, ..string.["/std:c11", "/O1", "/GL", "/favor:blend", "/utf-8", "/validate-charset", "/EHsc", "/w"]);
        	}
        	
            success &&= build_cpp_static_lib("windows/raylib", ..raylib_src_files, extra = raylib_flags, debug=COMPILE_DEBUG);
        } else #if OS == .LINUX {
            make_directory_if_it_does_not_exist("linux");
            
            raylib_flags: [..] string;
            array_add(*raylib_flags, ..string.["-D_DEFAULT_SOURCE", "-DPLATFORM_DESKTOP", "-DGRAPHICS_API_OPENGL_33"]);
            #if COMPILE_DEBUG {
                array_add(*raylib_flags, ..string.["-std=c99", "-O0", "-g"]);
            } else {
                array_add(*raylib_flags, ..string.["-std=c99", "-Os", "-flto"]);
            }

            // success &&= build_cpp_dynamic_lib("linux/raylib", ..raylib_src_files, extra = raylib_flags, debug=COMPILE_DEBUG);
            success &&= build_cpp_static_lib("linux/raylib", ..raylib_src_files, extra = raylib_flags, debug=COMPILE_DEBUG);
        } else {
            assert(false);
        }

        if !success exit(1);
    }
	
    if GENERATE_BINDINGS {
    	output_filename: string;
    	opts: Generate_Bindings_Options;
    	{
    		using opts;

    		strip_flags = 0;
    		generate_compile_time_struct_checks = false;
    		visitor = raylib_visitor;

    		array_add(*include_paths, ..string.["src/src", "src/src/external/glfw/include"]);
    		array_add(*libnames, "raylib");
    		array_add(*source_files,  ..string.["src/src/raylib.h", "src/src/rlgl.h"]);
    		array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);
    		array_add(*extra_clang_arguments, "-x", "c");

    		#if OS == .WINDOWS {
     			array_add(*libpaths, "windows");
                output_filename = "windows.jai";
            } else #if OS == .LINUX {
                array_add(*libpaths, "linux");
                output_filename = "linux.jai";
            } else { assert(false); }
    	}

    	generate_bindings(opts, output_filename);        
    }
}

raylib_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
	if !parent_decl {
        if array_find(DECLARATIONS_TO_OMIT, decl.name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
    }

    if begins_with(decl.name, "rl") { // Strip "rl" prefixes from rlgl.h
        new_decl_name := decl.name;
        new_decl_name.data += 2;
        new_decl_name.count -= 2;
        decl.output_name = new_decl_name; 
    }

    // Strip "alt" prefixes.
    // These were introduce to avoid random naming conflicts
    // from linking against windows libraries.
    if begins_with(decl.name, "alt") {
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