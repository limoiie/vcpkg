include(vcpkg_common_functions)

vcpkg_from_bitbucket(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO iie4dev/cpp-common
    REF v0.0.3.9
    SHA512 567479ffc0003af09324b7bcabb0fda3ebd3024b0a85a3abe3a03f93dc0f273601fe5db15362fbc4aa73358f9bbefa8c3f99fbb2b38437744fa5b2ee04bed971
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DENABLE_TEST=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

# remove duplicated include/share files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/cpp-common RENAME copyright)