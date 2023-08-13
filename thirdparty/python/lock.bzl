# This file is generated by rules_pycross.
# It is not intended for manual editing.

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@jvolkman_rules_pycross//pycross:defs.bzl", "pycross_wheel_build", "pycross_wheel_library", "pypi_file")

PINS = {
    "cython": "cython_0.29.34",
    "numpy": "numpy_1.25.2",
    "pybind11": "pybind11_2.11.1",
    "python_i18n": "python_i18n_0.3.9",
    "setuptools": "setuptools_68.0.0",
    "wheel": "wheel_0.41.1",
}

def targets():
    for pin_name, pin_target in PINS.items():
        native.alias(
            name = pin_name,
            actual = ":" + pin_target,
        )

    native.config_setting(
        name = "_env_python_darwin_arm64",
        constraint_values = [
            "@platforms//os:osx",
            "@platforms//cpu:aarch64",
        ],
    )

    native.config_setting(
        name = "_env_python_darwin_x86_64",
        constraint_values = [
            "@platforms//os:osx",
            "@platforms//cpu:x86_64",
        ],
    )

    native.config_setting(
        name = "_env_python_linux_arm64",
        constraint_values = [
            "@platforms//os:linux",
            "@platforms//cpu:aarch64",
        ],
    )

    native.config_setting(
        name = "_env_python_linux_x86_64",
        constraint_values = [
            "@platforms//os:linux",
            "@platforms//cpu:x86_64",
        ],
    )

    _target = select({
        ":_env_python_darwin_arm64": "@//tools/toolchains:python_darwin_arm64",
        ":_env_python_darwin_x86_64": "@//tools/toolchains:python_darwin_x86_64",
        ":_env_python_linux_arm64": "@//tools/toolchains:python_linux_arm64",
        ":_env_python_linux_x86_64": "@//tools/toolchains:python_linux_x86_64",
    })

    pycross_wheel_library(
        name = "cython_0.29.34",
        wheel = "@lock_wheel_cython_0.29.34_py2.py3_none_any//file",
    )

    _numpy_1_25_2_build_deps = [
        ":cython_0.29.34",
        ":pybind11_2.11.1",
        ":setuptools_68.0.0",
        ":wheel_0.41.1",
    ]

    pycross_wheel_build(
        name = "_build_numpy_1.25.2",
        sdist = "@lock_sdist_numpy_1.25.2//file",
        target_environment = _target,
        deps = _numpy_1_25_2_build_deps,
        tags = ["manual"],
    )

    pycross_wheel_library(
        name = "numpy_1.25.2",
        wheel = ":_build_numpy_1.25.2",
    )

    pycross_wheel_library(
        name = "pybind11_2.11.1",
        wheel = "@lock_wheel_pybind11_2.11.1_py3_none_any//file",
    )

    pycross_wheel_library(
        name = "python_i18n_0.3.9",
        wheel = "@lock_wheel_python_i18n_0.3.9_py3_none_any//file",
    )

    pycross_wheel_library(
        name = "setuptools_68.0.0",
        wheel = "@lock_wheel_setuptools_68.0.0_py3_none_any//file",
    )

    pycross_wheel_library(
        name = "wheel_0.41.1",
        wheel = "@lock_wheel_wheel_0.41.1_py3_none_any//file",
    )

def repositories():
    maybe(
        pypi_file,
        name = "lock_sdist_numpy_1.25.2",
        package_name = "numpy",
        package_version = "1.25.2",
        filename = "numpy-1.25.2.tar.gz",
        sha256 = "fd608e19c8d7c55021dffd43bfe5492fab8cc105cc8986f813f8c3c048b38760",
        index = "https://pypi.org",
    )

    maybe(
        pypi_file,
        name = "lock_wheel_cython_0.29.34_py2.py3_none_any",
        package_name = "cython",
        package_version = "0.29.34",
        filename = "Cython-0.29.34-py2.py3-none-any.whl",
        sha256 = "be4f6b7be75a201c290c8611c0978549c60353890204573078e865423dbe3c83",
        index = "https://pypi.org",
    )

    maybe(
        pypi_file,
        name = "lock_wheel_pybind11_2.11.1_py3_none_any",
        package_name = "pybind11",
        package_version = "2.11.1",
        filename = "pybind11-2.11.1-py3-none-any.whl",
        sha256 = "33cdd02a6453380dd71cc70357ce388ad1ee8d32bd0e38fc22b273d050aa29b3",
        index = "https://pypi.org",
    )

    maybe(
        pypi_file,
        name = "lock_wheel_python_i18n_0.3.9_py3_none_any",
        package_name = "python-i18n",
        package_version = "0.3.9",
        filename = "python_i18n-0.3.9-py3-none-any.whl",
        sha256 = "bda5b8d889ebd51973e22e53746417bd32783c9bd6780fd27cadbb733915651d",
        index = "https://pypi.org",
    )

    maybe(
        pypi_file,
        name = "lock_wheel_setuptools_68.0.0_py3_none_any",
        package_name = "setuptools",
        package_version = "68.0.0",
        filename = "setuptools-68.0.0-py3-none-any.whl",
        sha256 = "11e52c67415a381d10d6b462ced9cfb97066179f0e871399e006c4ab101fc85f",
        index = "https://pypi.org",
    )

    maybe(
        pypi_file,
        name = "lock_wheel_wheel_0.41.1_py3_none_any",
        package_name = "wheel",
        package_version = "0.41.1",
        filename = "wheel-0.41.1-py3-none-any.whl",
        sha256 = "473219bd4cbedc62cea0cb309089b593e47c15c4a2531015f94e4e3b9a0f6981",
        index = "https://pypi.org",
    )

