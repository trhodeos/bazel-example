load(
    "@jvolkman_rules_pycross//pycross:defs.bzl",
    "pycross_target_environment",
)
load(
    "@jvolkman_rules_pycross//pycross:toolchain.bzl",
    "pycross_hermetic_toolchain",
)

load(
  "//tools/platforms:constraints.bzl", "darwin_arm64_constraints", "darwin_x86_64_constraints", "linux_x86_64_constraints"
)

PYTHON_VERSION = "3.10.4"

pycross_target_environment(
    name = "python_darwin_x86_64",
    abis = ["cp39"],
    platforms = ["macosx_12_0_x86_64"],
    python_compatible_with = darwin_x86_64_constraints,
    version = PYTHON_VERSION,
    visibility = ["//visibility:public"],
)

pycross_target_environment(
    name = "python_darwin_arm64",
    abis = ["cp39"],
    platforms = ["macosx_12_0_arm64"],
    python_compatible_with = darwin_arm64_constraints,
    version = PYTHON_VERSION,
    visibility = ["//visibility:public"],
)

pycross_target_environment(
    name = "python_linux_x86_64",
    abis = ["cp39"],
    platforms = [
        "linux_x86_64",
        "manylinux2014_x86_64",
    ] + [
        "manylinux_2_%s_x86_64" % str(i)
        for i in range(17, 25)
    ],
    python_compatible_with = linux_x86_64_constraints,
    version = PYTHON_VERSION,
    visibility = ["//visibility:public"],
)

pycross_hermetic_toolchain(
    name = "pycross_darwin_linux",
    exec_interpreter = "@python3_9_aarch64-apple-darwin//:py3_runtime",
    target_environment = ":python_linux_x86_64",
    target_interpreter = "@python3_9_x86_64-unknown-linux-gnu//:py3_runtime",
)

toolchain(
    name = "pycross_darwin_linux_tc",
    exec_compatible_with = darwin_arm64_constraints,
    target_compatible_with = linux_x86_64_constraints,
    toolchain = ":pycross_darwin_linux",
    toolchain_type = "@jvolkman_rules_pycross//pycross:toolchain_type",
)

pycross_hermetic_toolchain(
    name = "pycross_darwin_darwin",
    exec_interpreter = "@python3_9_x86_64-apple-darwin//:py3_runtime",
    target_environment = ":python_darwin_x86_64",
    target_interpreter = "@python3_9_x86_64-apple-darwin//:py3_runtime",
)

toolchain(
    name = "pycross_darwin_darwin_tc",
    exec_compatible_with = darwin_x86_64_constraints,
    target_compatible_with = darwin_x86_64_constraints,
    toolchain = ":pycross_darwin_darwin",
    toolchain_type = "@jvolkman_rules_pycross//pycross:toolchain_type",
)

pycross_hermetic_toolchain(
    name = "pycross_linux_linux",
    exec_interpreter = "@python3_9_x86_64-unknown-linux-gnu//:py3_runtime",
    target_environment = ":python_linux_x86_64",
    target_interpreter = "@python3_9_x86_64-unknown-linux-gnu//:py3_runtime",
)

toolchain(
    name = "pycross_linux_linux_tc",
    exec_compatible_with = linux_x86_64_constraints,
    target_compatible_with = linux_x86_64_constraints,
    toolchain = ":pycross_linux_linux",
    toolchain_type = "@jvolkman_rules_pycross//pycross:toolchain_type",
)

pycross_hermetic_toolchain(
    name = "pycross_linux_darwin",
    exec_interpreter = "@python3_9_x86_64-unknown-linux-gnu//:py3_runtime",
    target_environment = ":python_darwin_x86_64",
    target_interpreter = "@python3_9_x86_64-apple-darwin//:py3_runtime",
)

toolchain(
    name = "pycross_linux_darwin_tc",
    exec_compatible_with = linux_x86_64_constraints,
    target_compatible_with = darwin_x86_64_constraints,
    toolchain = ":pycross_linux_darwin",
    toolchain_type = "@jvolkman_rules_pycross//pycross:toolchain_type",
)
