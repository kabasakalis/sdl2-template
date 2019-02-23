# FindLime2D.cmake

# The directories to search for Lime2D
set(FIND_LIME2D_PATHS
#        ~/Library/Frameworks/Lime2D
        ~/cpp/frameworks/Lime2D/bin/Lime2D
        F:/msys64/home/spiros/cpp/frameworks/Lime2D/bin/Lime2D
        )

# The location of the include folder
find_path(LIME2D_INCLUDE_DIR lime2d.h
        PATH_SUFFIXES include
        PATHS ${FIND_LIME2D_PATHS}
        )

# The location of the lib folder
find_library(LIME2D_LIBRARY
        NAMES lime2d
        PATH_SUFFIXES lib
        PATHS ${FIND_LIME2D_PATHS}
        )

