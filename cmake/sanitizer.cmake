# sanitizer
option(ENABLE_ADDRESS_SANITIZER "Enable Address Sanitizer" ON)
option(ENABLE_MEMORY_SANITIZER "Enable Memory Sanitizer" OFF)
option(ENABLE_THREAD_SANITIZER "Enable Thread Sanitizer" OFF)
option(ENABLE_UB_SANITIZER "Enable UB Sanitizer" ON)

if(ENABLE_ADDRESS_SANITIZER)
    # https://github.com/google/sanitizers/wiki/AddressSanitizer
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address -O2 -g -fno-omit-frame-pointer")
endif()

if(ENABLE_MEMORY_SANITIZER)
    # https://github.com/google/sanitizers/wiki/MemorySanitizer
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=memory -O2 -fPIE -pie -fno-omit-frame-pointer -g")
endif()

if(ENABLE_THREAD_SANITIZER)
    # https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=thread -O2 -fPIE -pie -fno-omit-frame-pointer -g")
endif()

if(ENABLE_UB_SANITIZER)
    # https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=undefined")
endif()