# bazel-example

## What is this?

This is a bazel example as of 2023 with some pretty normal asks:
* proto support
* python support (with cross-platform support)
* go support
* OCI images

## What do I do?

### Prereqs
* Install [bazelisk](https://github.com/bazelbuild/bazelisk)

### Run an example image

```
bazel build --platforms //tools/platforms:linux_arm64 //src/hello:tarball
docker load --input $(bazel cquery --output=files //src/hello:tarball)
docker run --rm gcr.io/oci_python_hello_world:latest
```

## TODO

* Get python-c-extensions working (numpy) with hermetic_cc_toolchain
* Add go support + example
* Add k8s and/or helm support
