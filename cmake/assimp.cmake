include( FetchContent )
FetchContent_Declare( assimp
  GIT_REPOSITORY	https://github.com/assimp/assimp.git
	GIT_TAG			    v6.0.2 )
FetchContent_MakeAvailable( assimp )

#target_compile_options( fastgltf PRIVATE	/wd4244
#											/wd4100
#											/wd4003
#											/wd4505
#											/wd4127 )
#
