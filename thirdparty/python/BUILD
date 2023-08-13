load(
    "@jvolkman_rules_pycross//pycross:defs.bzl",
    "pycross_lock_file",
    "pycross_poetry_lock_model",
)

load("@bazel_skylib//rules:write_file.bzl", "write_file")

load(":lock.bzl", "targets")

package(
    default_visibility = ["//visibility:public"],
)

targets()

pycross_poetry_lock_model(
    name = "lock_model",
    poetry_lock_file = "poetry.lock",
    poetry_project_file = "pyproject.toml",
)

pycross_lock_file(
    name = "lock",
    out = "lock.bzl",
    default_alias_single_version = True,
    lock_model_file = ":lock_model",
    pypi_index = "https://pypi.org",
    package_build_dependencies = {
        "numpy": [
            "setuptools",
            "wheel",
            "cython",
            "pybind11"
        ],
    },
    target_environments = [
        "//tools/toolchains:python_darwin_x86_64",
        "//tools/toolchains:python_darwin_arm64",
        "//tools/toolchains:python_linux_x86_64",
    ],
)

_GENERATED = {
    "thirdparty/python/lock.bzl": "//thirdparty/python:lock.bzl",
}

# Generate the updater script so there's only one target for devs to run,
# even if many generated files are in the source folder.
write_file(
    name = "gen_update",
    out = "update.sh",
    content = [
        # This depends on bash, would need tweaks for Windows
        "#!/usr/bin/env bash",
        # Bazel gives us a way to access the source folder!
        "cd $BUILD_WORKSPACE_DIRECTORY",
    ] + [
        # Paths are now relative to the workspace.
        # We can copy files from bazel-bin to the sources
        "cp -fv bazel-bin/{1} {0}".format(
            k,
            # Convert label to path
            v.replace(":", "/"),
        )
        for [
            k,
            v,
        ] in _GENERATED.items()
    ],
)

# This is what you can `bazel run` and it can write to the source folder
sh_binary(
    name = "update_lock",
    srcs = ["update.sh"],
    data = _GENERATED.values(),
)
