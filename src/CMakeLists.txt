add_executable(main main.cpp)

find_package(fmt CONFIG REQUIRED)
find_package(unofficial-sqlite3 CONFIG REQUIRED)

target_link_libraries(main PRIVATE fmt::fmt unofficial::sqlite3::sqlite3)