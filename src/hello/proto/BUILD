load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_proto_grpc//python:defs.bzl", "python_grpc_library")

package(
    default_visibility = ["//visibility:public"]
)

proto_library(
    name = "hello_service_proto",
    srcs = ["hello_service.proto"],
)

python_grpc_library(
    name = "hello_service_proto_py",
    protos = [":hello_service_proto"],
)
