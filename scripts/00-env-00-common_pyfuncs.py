#!/usr/bin/env python3

import sys

def get_free_tcp_port():
    import socket
    tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp.bind(('', 0))
    addr, port = tcp.getsockname()
    tcp.close()
    return port

def main():
    # as a wrapper, call the function with arguments
    if len(sys.argv) >= 2:
        func_name = sys.argv[1]  # [0] is this script's name
        func_args = sys.argv[2:]
        result = globals()[func_name](*func_args)
    else:
        result = ''
    print(result)
    

if __name__ == '__main__':
    main()
