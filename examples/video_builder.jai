#import "Process";
#import "Basic";
#import "File";
// #import "stb_image_resize";

#if OS == .WINDOWS {
	#import "Windows";
} else {
	#import "POSIX";
}

FFMPEG :: struct {
	process : Process;
	fps : int;
}
ffmpeg_start_rendering :: (width : int, height : int, fps := 60, filename := "output.mp4", path := ".", bitrate := 5000) -> FFMPEG, ok:bool {
	ffmpeg := FFMPEG.{
		fps = fps
	};

	make_directory_if_it_does_not_exist(path, true);
	success := create_process(*ffmpeg.process,
		"ffmpeg",
		"-loglevel", "verbose",
		"-y",
		"-f", "rawvideo",
		"-pix_fmt", "rgba",
		"-s", tprint("%x%", width, height),
		"-r", tprint("%", fps),
		"-i", "-",
		"-c:v", "libx264",
		"-vb", tprint("%k", bitrate),
		"-c:a", "aac",
		"-ab", "200k",
		"-pix_fmt", "yuv420p",
		tprint("%/%", path, filename),
		capture_and_return_output = true
	);
	return ffmpeg, success;
}
ffmpeg_end_rendering :: (ffmpeg : *FFMPEG) {
	#if OS == .WINDOWS {
		fclose(ffmpeg.process.input.handle); //not sure about this
	} else {
		close(ffmpeg.process.input.handle);
	}
	success, result := get_process_result(*ffmpeg.process);
}
ffmpeg_send_frame :: (ffmpeg : *FFMPEG, frame : Frame) -> ok:bool {
	bytes := frame.bytes;
	while bytes.count > 0 {
		succes, bytes_written := write_to_process(*ffmpeg.process, bytes);
		bytes.data += bytes_written;
		bytes.count -= bytes_written;
	}
	return true;
}
ffmpeg_send_screenshot :: (ffmpeg : *FFMPEG, buffer : *Frame) {
	fill_frame_with_screenshot(buffer);
	ffmpeg_send_frame(ffmpeg, buffer);
}

Frame :: struct {
	width, height : int;
	bytecount : int;
	pixels : *u32;
	#place bytecount;
	bytes : []u8;
}
make_frame :: (width : int, height : int) -> Frame {
	return .{
		width = width,
		height = height,
		bytes = NewArray(width * height * 4, u8)
	};
}
clear :: (using frame : Frame) {
	array_free(bytes);
}

fill_frame_with_screenshot :: (frame : *Frame) {
	flip_and_remove_transparency :: (using frame : *Frame) {
		for y1 : 0..(height / 2 - 1) {
			y2 := height - y1 - 1;
			row1 := pixels + y1 * width;
			row2 := pixels + y2 * width;
			for x : 0..width-1 {
				row1[x], row2[x] = row2[x], row1[x];
			}
		}
	}

	glReadPixels(0, 0, xx frame.width, xx frame.height, GL_RGBA, GL_UNSIGNED_BYTE, frame.pixels);
	flip_and_remove_transparency(frame);
}