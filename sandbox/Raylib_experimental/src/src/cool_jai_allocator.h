#ifndef COOL_JAI_ALLOCATOR
    #define COOL_JAI_ALLOCATOR

    #include "stdlib.h"
    void* jai_malloc(size_t size);
    void* jai_calloc(size_t num, size_t size);
    void* jai_realloc(void *ptr, size_t newsize);
    void jai_free(void* ptr);

    #ifndef RL_MALLOC
        #define RL_MALLOC(sz) jai_malloc(sz)
    #endif
	#ifndef RL_CALLOC
	    #define RL_CALLOC(n,sz)   jai_calloc(n,sz)
	#endif
	#ifndef RL_REALLOC
	    #define RL_REALLOC(n,sz)  jai_realloc(n,sz)
	#endif
	#ifndef RL_FREE
	    #define RL_FREE(p)        jai_free(p)
	#endif
#endif
