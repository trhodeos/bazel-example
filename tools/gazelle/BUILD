load("@pip//:requirements.bzl", "all_whl_requirements")
load("@rules_python_gazelle_plugin//manifest:defs.bzl", "gazelle_python_manifest")
load("@rules_python_gazelle_plugin//modules_mapping:def.bzl", "modules_mapping")
load("@bazel_gazelle//:def.bzl", "gazelle")
load("@rules_python_gazelle_plugin//:def.bzl", "GAZELLE_PYTHON_RUNTIME_DEPS")

modules_mapping(
    name = "modules_map",
    wheels = all_whl_requirements,
)

gazelle_python_manifest(
    name = "gazelle_python_manifest",
    modules_mapping = ":modules_map",
    pip_repository_name = "pip",
    requirements = "//thirdparty/python:requirements_lock.txt",
    use_pip_repository_aliases = True,
)


gazelle(
    name = "gazelle",
    data = GAZELLE_PYTHON_RUNTIME_DEPS,
    gazelle = "@rules_python_gazelle_plugin//python:gazelle_binary",
)
