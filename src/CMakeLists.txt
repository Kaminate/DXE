add_executable( Demo WIN32)
target_sources( Demo PRIVATE
  main.cpp
  App.cpp
  App.h
  Core.cpp
  Core.h
)

add_subdirectory(Assets)
add_subdirectory(ECS)
add_subdirectory(Features)
add_subdirectory(Frames)
add_subdirectory(Utilities)

FetchContent_Declare( imgui # docking branch
  GIT_REPOSITORY https://github.com/ocornut/imgui.git
  GIT_TAG c2c38beec82aa94cf38cdbaca8ccb82a0e757721 )
FetchContent_MakeAvailable( imgui )

target_sources( Demo
  PRIVATE
${CMAKE_SOURCE_DIR}/Resources/Shaders/baseMipRadiance.hlsl
${CMAKE_SOURCE_DIR}/Resources/Shaders/common.hlsl
${CMAKE_SOURCE_DIR}/Resources/Shaders/deferred.hlsl
${CMAKE_SOURCE_DIR}/Resources/Shaders/pix.hlsl
${CMAKE_SOURCE_DIR}/Resources/Shaders/radiance.hlsl
${CMAKE_SOURCE_DIR}/Resources/Shaders/shadow.hlsl
${CMAKE_SOURCE_DIR}/Resources/Shaders/shadowDebug.hlsl
${CMAKE_SOURCE_DIR}/Resources/Shaders/voxelizer.hlsl
)

target_sources( Demo
  PRIVATE
    ${imgui_SOURCE_DIR}/imgui.cpp
    ${imgui_SOURCE_DIR}/imgui_demo.cpp
    ${imgui_SOURCE_DIR}/imgui_draw.cpp
    ${imgui_SOURCE_DIR}/imgui_tables.cpp
    ${imgui_SOURCE_DIR}/imgui_widgets.cpp
    ${imgui_SOURCE_DIR}/backends/imgui_impl_dx12.cpp
    ${imgui_SOURCE_DIR}/backends/imgui_impl_win32.cpp
    ${imgui_SOURCE_DIR}/imgui.h
    ${imgui_SOURCE_DIR}/imconfig.h
    ${imgui_SOURCE_DIR}/backends/imgui_impl_win32.h
    ${imgui_SOURCE_DIR}/backends/imgui_impl_dx12.h )
target_include_directories( Demo
  PRIVATE
    ${imgui_SOURCE_DIR}
    ${imgui_SOURCE_DIR}/backends )


target_link_libraries(Demo PRIVATE dxgi.lib assimp)


# Download pix runtime library from nuget
include( ${CMAKE_SOURCE_DIR}/cmake/pix.cmake )
add_pix_target()
target_link_libraries( Demo PRIVATE PIX )
add_custom_command( TARGET Demo
                    PRE_BUILD
                    COMMAND ${CMAKE_COMMAND} -E copy_if_different
                            ${PIX_DLL_PATH}
                            $<TARGET_FILE_DIR:Demo> )
target_compile_definitions( Demo PRIVATE PIX_AVAILABLE )
