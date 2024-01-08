ethereum_package = import_module(
    "github.com/kurtosis-tech/ethereum-package/main.star"
)
participants = import_module("./src/participants.star")


DEFAULT = {
    "participants": [{"type": "juno"}]
}


def run(plan, args=DEFAULT):
    eth = ethereum_package.run(plan, {"additional_services": ["dora"]})
    eth_url = "ws://{}:{}".format(eth.all_participants[0].el_client_context.ip_addr, eth.all_participants[0].el_client_context.ws_port_num)

    return {"ethereum": eth, "starknet": participants.run(plan, args["participants"], eth_url)}
