include(vcpkg_common_functions)

vcpkg_from_bitbucket(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO iie4dev/cpp-common
    REF v0.0.7
    SHA512 ba6646db578de9933942eb2ab5eeb6e7b29e92e840c6fec0d3d1f819c4f5af332c97a593344997cae1a1c5bf925fbd8dbcc987534d9c28848d3a7cb1423888fa
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DENABLE_TEST=OFF
        -DUNICODE=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

# remove duplicated include/share files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/cpp-common-multichars RENAME copyright)