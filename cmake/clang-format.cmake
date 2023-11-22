# additional target to perform clang-format run, requires clang-format

# get all project files
file(GLOB_RECURSE ALL_SOURCE_FILES *.cpp *.h *.hpp)

# exclude trdparty files
if(NOT PROJECT_TRDPARTY_DIR)
    set(PROJECT_TRDPARTY_DIR "${PROJECT_SOURCE_DIR}/3rd_party")
endif()

foreach(SOURCE_FILE ${ALL_SOURCE_FILES})
    string(FIND ${SOURCE_FILE} ${PROJECT_TRDPARTY_DIR} PROJECT_TRDPARTY_DIR_FOUND)

    if(NOT ${PROJECT_TRDPARTY_DIR_FOUND} EQUAL -1)
        list(REMOVE_ITEM ALL_SOURCE_FILES ${SOURCE_FILE})
    endif()
endforeach()

add_custom_target(
    NAME clangformat
    COMMAND clang-format
    --fallback-style=WebKit
    --files ${PROJECT_SOURCE_DIR}/.clang-format
    -i
    ${ALL_SOURCE_FILES}
)