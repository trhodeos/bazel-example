load("@rules_python//python:defs.bzl", "py_binary")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_tarball")
load("//tools/rules:python.bzl", "py_image_layer")

py_binary(
    name = "hello_world_bin",
    srcs = ["hello_world.py"],
    main = "hello_world.py",
    deps = [
      "//thirdparty/python:python_i18n",
    ],
)

py_image_layer(
    name = "hello_world_layer",
    binary = ":hello_world_bin",
    root = "/opt",
)

oci_image(
    name = "image",
    base = "@python_base_image",
    entrypoint = ["/opt/src/hello/hello_world_bin"],
    tars = [":hello_world_layer"],
)

# $ bazel build //src/hello:tarball
# $ docker load --input $(bazel cquery --output=files //src/hello:tarball)
# $ docker run --rm gcr.io/oci_python_hello_world:latest
oci_tarball(
    name = "tarball",
    image = ":image",
    repo_tags = ["gcr.io/oci_python_hello_world:latest"],
)
