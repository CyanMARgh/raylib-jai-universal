#ifndef COOL_JAI_ALLOCATOR
    #define COOL_JAI_ALLOCATOR

    #include "stdlib.h"
    void* jai_malloc(size_t size);
    void* jai_calloc(size_t num, size_t size);
    void* jai_realloc(void *ptr, size_t newsize);
    void jai_free(void* ptr);

    #ifndef RAYGUI_MALLOC
        #define RAYGUI_MALLOC(sz) jai_malloc(sz)
    #endif
	#ifndef RAYGUI_CALLOC
	    #define RAYGUI_CALLOC(n,sz)   jai_calloc(n,sz)
	#endif
	#ifndef RAYGUI_REALLOC
	    #define RAYGUI_REALLOC(n,sz)  jai_realloc(n,sz)
	#endif
	#ifndef RAYGUI_FREE
	    #define RAYGUI_FREE(p)        jai_free(p)
	#endif
#endif
