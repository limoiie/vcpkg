include(vcpkg_common_functions)

vcpkg_from_bitbucket(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO iie4dev/cpp-common
    REF v0.0.6.8
    SHA512 d92d8c2171064d559f286f9f5d137f5624385f3982464cec2319eea11d0ebc4fd59b1c2357ca4fc8502c0cbf1a316f66abcd68722b8f658e4af0d20706eda23e
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DENABLE_TEST=OFF
        -DUNICODE=ON
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

# remove duplicated include/share files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/cpp-common RENAME copyright)