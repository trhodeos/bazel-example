load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_proto_grpc//python:defs.bzl", "python_grpc_compile")

proto_library(
    name = "hello_service_proto",
    srcs = ["hello_service.proto"],
    visibility = ["//visibility:public"],
)


python_grpc_compile(
    name = "hello_service_proto_py",
    protos = [":hello_service_proto"],
)
