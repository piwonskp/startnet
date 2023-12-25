client = import_module("./client.star")


def run(plan, participant, eth_url):
    cmd = [
        '--base_layer.node_url', 
        eth_url, 
        '--chain_id', 
        "3151908"
    ]
    rpc_port = 8080

    return client.run(plan, "papyrus", "ghcr.io/starkware-libs/papyrus:dev", cmd, rpc_port, participant)
