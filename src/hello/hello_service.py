from concurrent import futures

import grpc

from src.hello.proto import hello_service_pb2_grpc
from src.hello.proto import hello_service_pb2

class Greeter(hello_service_pb2_grpc.GreeterServicer):

  def SayHello(self, request, context):
    print(f"Saying hello to {request.name}")
    return hello_service_pb2.HelloReply(message=f'Hello, {request.name}!')

def serve():
  server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
  hello_service_pb2_grpc.add_GreeterServicer_to_server(
      Greeter(), server)
  server.add_insecure_port('[::]:50051')
  print("Serving on port 50051")
  server.start()
  server.wait_for_termination()

if __name__ == "__main__":
    serve()
