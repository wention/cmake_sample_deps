set(FREEGLUT_URL https://github.com/FreeGLUTProject/freeglut/archive/refs/tags/v3.4.0.tar.gz)
set(FREEGLUT_SHA256 3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec)

ExternalProject_Add(freeglut
        URL ${FREEGLUT_URL}
        URL_HASH SHA256=${FREEGLUT_SHA256}
        DOWNLOAD_NO_PROGRESS TRUE
        DOWNLOAD_DIR ${DEPS_DOWNLOAD_DIR}/freeglut
        CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${DEPS_INSTALL_DIR}
        -DCMAKE_INSTALL_LIBDIR=lib
        -DFREEGLUT_BUILD_DEMOS=OFF
        BUILD_IN_SOURCE 0
        )
