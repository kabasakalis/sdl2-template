cmake_minimum_required(VERSION 3.2)

project(SDL2Test)

# Meta information about the project #### [ADAPT]
set(META_PROJECT_NAME "SDL2 Template")
set(META_PROJECT_DESCRIPTION "Testing C++ compilation and tooling on windows")
set(META_AUTHOR_ORGANIZATION "Spiros Kabasakalis")
set(META_AUTHOR_DOMAIN "https://github.com/kabaskalis/sdl2-project/")
set(META_AUTHOR_MAINTAINER "kabasakalis@gmail.com")
set(META_VERSION_MAJOR "0")
set(META_VERSION_MINOR "1")
set(META_VERSION_PATCH "0")
set(META_VERSION_REVISION "${GIT_REV}")
set(META_VERSION "${META_VERSION_MAJOR}.${META_VERSION_MINOR}.${META_VERSION_PATCH}")
set(META_NAME_VERSION "${META_PROJECT_NAME} v${META_VERSION} (${META_VERSION_REVISION})")
set(META_CMAKE_INIT_SHA "${GIT_SHA1}")


# Set compiler GNU, CLANG or MSVC
#set(COMPILER "CLANG")
#set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
#It is important to be consistent in whether or not extensions are enabled when linking targets,
#as mixing different settings can result in trying to mix standard library implementations (dangerous at best).
set(CMAKE_CXX_EXTENSIONS OFF)
option(CMAKE_VERBOSE_MAKEFILE "Verbose build log" ON)
option(CMAKE_EXPORT_COMPILE_COMMANDS "Export Complile Commands" ON)

# Set flags per compiler
if (COMPILER STREQUAL "CLANG")
    MESSAGE(STATUS "Compiling with CLANG")
    SET(CMAKE_CXX_COMPILER "clang++")
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_FLAGS "-Wall -Wextra")

elseif (COMPILER STREQUAL "GNU")
    MESSAGE(STATUS "Compiling with GNU g++")
    SET(CMAKE_CXX_COMPILER "g++")
    SET(CMAKE_C_COMPILER "gcc")
    SET(CMAKE_CXX_FLAGS "-Wall -Wextra")
elseif (COMPILER STREQUAL "MSVC")
    MESSAGE(STATUS "Compiling with MSVC")

endif ()


#set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake_modules")

add_executable(SDL2Test src/main.cpp)

INCLUDE(FindPkgConfig)

#pkg_check_modules(FREETYPE2 REQUIRED freetype2)
#pkg_check_modules(HARFBUZZ REQUIRED harfbuzz)

pkg_check_modules(SDL2 REQUIRED sdl2)
pkg_check_modules(SDL2_IMAGE REQUIRED sdl2_image)
pkg_check_modules(SDL2_MIXER REQUIRED sdl2_mixer)


include_directories(${SDL2_INCLUDE_DIRS}
        ${SDL2_IMAGE_INCLUDE_DIRS}
        ${SDL2_MIXER_INCLUDE_DIRS}
        #                    ${FREETYPE2_INCLUDE_DIRS}
        #                    ${HARFBUZZ_INCLUDE_DIRS}
        )

link_directories(
        ${SDL2_LIBRARY_DIRS}
        ${SDL2_IMAGE_LIBRARY_DIRS}
        ${SDL2_MIXER_LIBRARY_DIRS}
        #        ${FREETYPE2_LIBRARY_DIRS}
        #        ${HARFBUZZ_LIBRARY_DIRS}
)

target_link_libraries(SDL2Test ${SDL2_LIBRARIES}
        ${SDL2_IMAGE_LIBRARIES}
        ${SDL2_MIXER_LIBRARIES}
        #        ${FREETYPE2_LIBRARIES}
        #        ${HARFBUZZ_LIBRARIES}
        )


MESSAGE(STATUS "SDL2 LIBRARIES: " ${SDL2_LIBRARIES})
MESSAGE(STATUS "SDL2 IMAGE_LIBRARIES: " ${SDL2_IMAGE_LIBRARIES})
MESSAGE(STATUS "SDL2 MIXER_LIBRARIES: " ${SDL2_MIXER_LIBRARIES})

MESSAGE(STATUS "SDL2_LIBRARY_DIRS: " ${SDL2_LIBRARY_DIRS})
MESSAGE(STATUS "SDL2_IMAGE_LIBRARY_DIRS: " ${SDL2_IMAGE_LIBRARY_DIRS})
MESSAGE(STATUS "SDL2_MIXER_LIBRARY_DIRS: " ${SDL2_MIXER_LIBRARY_DIRS})

MESSAGE(STATUS "Compiler: " ${CMAKE_CXX_COMPILER})
MESSAGE(STATUS "Build type: " ${CMAKE_BUILD_TYPE})
MESSAGE(STATUS "Library Type: " ${LIB_TYPE})
MESSAGE(STATUS "Compiler flags:" ${CMAKE_CXX_COMPILE_FLAGS})
MESSAGE(STATUS "Compiler cxx debug flags:" ${CMAKE_CXX_FLAGS_DEBUG})
MESSAGE(STATUS "Compiler cxx release flags:" ${CMAKE_CXX_FLAGS_RELEASE})
MESSAGE(STATUS "Compiler cxx min size flags:" ${CMAKE_CXX_FLAGS_MINSIZEREL})
MESSAGE(STATUS "Compiler cxx flags:" ${CMAKE_CXX_FLAGS})


# -DCMAKE_TOOLCHAIN_FILE=C:\cpp\vcpkg\scripts\buildsystems\vcpkg.cmake

