client = import_module("./client.star")


def run(plan, participant, eth_url):
    cmd = [
        '--http', 
        '--http-port', 
        '6060', 
        '--http-host', 
        '0.0.0.0', 
        '--db-path', 
        '/var/lib/juno', 
        # '--eth-node', 
        # eth_url
    ]
    rpc_port = 6060

    return client.run(plan, "juno", "nethermind/juno", cmd, rpc_port, participant)
