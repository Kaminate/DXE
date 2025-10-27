cmake_minimum_required( VERSION 4.0 )
project( DXE2 CXX ) # GANG = Gui and Nate game
set( CMAKE_CXX_STANDARD 23 )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR} )
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR} )

set( CMAKE_INCLUDE_CURRENT_DIR ON )


list( APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" )
include( FetchContent )
include( assimp )

set( DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" )



if( MSVC )
    #set( CMAKE_VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" )
    add_compile_options( /ZI   # Edit and continue
                         #/W4   # warning level 4
                         #/WX   # treat linker warnings as errors
                         /MP ) # multi processor compilation
    add_compile_options("$<$<CONFIG:Debug>:/wd4101>") # unreferenced local var
    add_compile_options("$<$<CONFIG:Debug>:/wd4505>") # unreferenced local fn
    add_compile_options("$<$<CONFIG:Debug>:/wd4189>") # unreferenced initialized local fn
    add_compile_options("$<$<CONFIG:Debug>:/wd4100>") # unreferenced param
endif()

add_subdirectory( src )

