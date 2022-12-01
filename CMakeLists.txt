cmake_minimum_required(VERSION 3.0.0)
project(libreflect VERSION 0.1.0)

include_directories(include)
if(DEFINED ENV{ARCH})
    set(ARCH $ENV{ARCH})
else()
    set(ARCH "x86_64")
endif()
include_directories("arch/linux/${ARCH}")

option(USE_DEBUG "Build in debug mode" OFF)

if (USE_DEBUG)
    add_definitions(-DDEBUG=1)
endif()

add_library(reflect STATIC src/exec.c src/map_elf.c src/stack_setup.c src/jump.c)
set_property(TARGET reflect PROPERTY POSITION_INDEPENDENT_CODE ON)
set_target_properties(reflect PROPERTIES OUTPUT_NAME "reflect.${ARCH}")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

