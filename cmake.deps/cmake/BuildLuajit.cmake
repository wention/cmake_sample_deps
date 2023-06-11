set(LUAJIT_URL https://github.com/LuaJIT/LuaJIT/archive/51fb2f2c3af778f03258fccee9092401ee4a0215.tar.gz)
set(LUAJIT_SHA256 d081eaa1a5bca419763712397f4696e0dd10db8d9b2e091e15c71d9fc50c24c9)

ExternalProject_Add(luajit
      URL ${LUAJIT_URL}
      URL_HASH SHA256=${LUAJIT_SHA256}
      DOWNLOAD_NO_PROGRESS TRUE
      DOWNLOAD_DIR ${DEPS_DOWNLOAD_DIR}/luajit
      CONFIGURE_COMMAND ""
      BUILD_IN_SOURCE 1
      BUILD_COMMAND ${CMAKE_COMMAND} -E chdir ${DEPS_BUILD_DIR}/src/luajit/src ${DEPS_BUILD_DIR}/src/luajit/src/msvcbuild.bat
      INSTALL_COMMAND ${CMAKE_COMMAND} -E make_directory ${DEPS_BIN_DIR}
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/luajit.exe ${DEPS_BIN_DIR}
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/lua51.dll ${DEPS_BIN_DIR}
        COMMAND ${CMAKE_COMMAND} -E make_directory ${DEPS_LIB_DIR}
        # Luarocks searches for lua51.lib
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/lua51.lib ${DEPS_LIB_DIR}/lua51.lib
        # Luv searches for luajit.lib
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/lua51.lib ${DEPS_LIB_DIR}/luajit.lib
        COMMAND ${CMAKE_COMMAND} -E make_directory ${DEPS_INSTALL_DIR}/include/luajit-2.1
        # Luv public headers
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/lua.h ${DEPS_INSTALL_DIR}/include/luajit-2.1/
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/lualib.h ${DEPS_INSTALL_DIR}/include/luajit-2.1/
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/lauxlib.h ${DEPS_INSTALL_DIR}/include/luajit-2.1/
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/luaconf.h ${DEPS_INSTALL_DIR}/include/luajit-2.1/
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/luajit.h ${DEPS_INSTALL_DIR}/include/luajit-2.1/
        COMMAND ${CMAKE_COMMAND} -E copy ${DEPS_BUILD_DIR}/src/luajit/src/lua.hpp ${DEPS_INSTALL_DIR}/include/luajit-2.1/

        COMMAND ${CMAKE_COMMAND} -E copy_directory ${DEPS_BUILD_DIR}/src/luajit/src/jit ${DEPS_INSTALL_DIR}/share/luajit-2.1.0-beta3/jit
      )