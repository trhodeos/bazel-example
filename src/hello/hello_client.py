from __future__ import print_function

import grpc

from src.hello.proto import hello_service_pb2_grpc
from src.hello.proto import hello_service_pb2


def make_message(name):
    return hello_service_pb2.HelloRequest(
        name=name
    )


def send_message(stub):
    response = stub.SayHello(make_message("world"))
    print("Hello from the server received your %s" % response.message)


def run():
    with grpc.insecure_channel('localhost:50051') as channel:
        stub = hello_service_pb2_grpc.GreeterStub(channel)
        send_message(stub)


if __name__ == '__main__':
    run()
